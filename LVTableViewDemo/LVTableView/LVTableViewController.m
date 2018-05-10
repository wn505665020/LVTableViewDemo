//
//  LVTableViewController.m
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVTableViewController.h"
#import "LVTableViewInteractor.h"
#import "LVTableViewPresenterProtocol.h"
#import "PlainSectionHeaderView.h"
#import "LVConfig.h"
#import "LVCommonCellModelProtocl.h"
#import "LVTableViewCellProtocol.h"
#import "LVTableViewCellBackDelegate.h"

#define lv_screenWidth [UIScreen mainScreen].bounds.size.width
#define lv_screenHeight [UIScreen mainScreen].bounds.size.height
#define NEWSECTIONHEADERHEIGHT 10

@interface LVTableViewController ()<UITableViewDelegate, UITableViewDataSource, LVTableViewPresenterProtocol, LVTableViewCellBackDelegate>
@property (nonatomic, strong) LVTableViewInteractor *interactor;
@property (nonatomic, strong) UITableView *tempTableView;
@end

@implementation LVTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupParams];
    [self setupUI];
    [self.interactor viewDidLoadMethod];
}

- (void)setupParams {
    self.interactor = [LVTableViewInteractor interactorWithBaseParams:@{} presenter:self];
}

- (void)setupUI {
    [self.view addSubview:self.tempTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.interactor.dateSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSArray *item = self.interactor.dateSource[section];
    return (item.count > 0) ? ((section == 0) ? 0 : NEWSECTIONHEADERHEIGHT) : 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PlainSectionHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kCellIdentifierPlainSectionHeaderView];
    headView.tableView = tableView;
    headView.section = section;
    headView.backgroundColor = [UIColor darkGrayColor];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == tableView.numberOfSections - 1) {
        PlainSectionFooterView *footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kCellIdentifierPlainSectionFooterView];
        footView.tableView = tableView;
        footView.section = section;
        footView.backgroundColor = [UIColor darkGrayColor];
        return footView;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *item = self.interactor.dateSource[section];
    return item.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<LVCommonCellModelProtocl> item = self.interactor.dateSource[indexPath.section][indexPath.row];
    return item.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<LVCommonCellModelProtocl> object = self.interactor.dateSource[indexPath.section][indexPath.row];
    UITableViewCell<LVTableViewCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:object.cellIdentifier];
    if ([cell respondsToSelector:@selector(delegate)] && !cell.delegate) {
        cell.delegate = self;
    }
    if ([cell respondsToSelector:@selector(titleString)]) {
        cell.titleString = @"哈哈哈";
    }
    if ([cell respondsToSelector:@selector(updateCellUIWithDataSource:withIndexPath:)]) {
        [cell updateCellUIWithDataSource:self.interactor.dateSource withIndexPath:indexPath];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell<LVTableViewCellProtocol> *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(didSelectRowWithDataSource:withIndexPath:)]) {
        [cell didSelectRowWithDataSource:self.interactor.dateSource withIndexPath:indexPath];
    }
}

- (void)registerCell {
    [_tempTableView registerClass:[PlainSectionHeaderView class] forHeaderFooterViewReuseIdentifier:kCellIdentifierPlainSectionHeaderView];
    [_tempTableView registerClass:[PlainSectionFooterView class] forHeaderFooterViewReuseIdentifier:kCellIdentifierPlainSectionFooterView];
    [_tempTableView registerClass:NSClassFromString(kCellIdentifierLVTableViewCell) forCellReuseIdentifier:kCellIdentifierLVTableViewCell];
    [_tempTableView registerClass:NSClassFromString(kCellIdentifierLVTypeSecondCell) forCellReuseIdentifier:kCellIdentifierLVTypeSecondCell];
}

- (UITableView *)tempTableView {
    if (!_tempTableView) {
        self.tempTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, lv_screenWidth, lv_screenHeight)];
        _tempTableView.backgroundColor = [UIColor whiteColor];
        _tempTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tempTableView.dataSource = self;
        _tempTableView.delegate = self;
        [self registerCell];
    }
    return _tempTableView;
}

#pragma mark - delegate
- (void)cellButtonClickBack:(NSIndexPath *)indexPath {
    NSLog(@"点击了按钮 %zd-%zd",indexPath.section,indexPath.row);
}

#pragma mark - protocol part
- (void)refreshTableView {
    [self.tempTableView reloadData];
}
//启动loadingView
- (void)showAnimatingWithIndicatorStyle:(int)style {
    
}
//stop loadingView
- (void)stopAnimatingView {
    
}

// Request Back RefreshUI
- (void)updateUIWithMethodBack:(NSString *)methodBack {
    
}
/** 请求code不等于0的时候，主要处理试图相关的部分*/
- (void)presenterRequestFailedByErrorMsg:(NSString *)methodBack errorMessage:(NSString *)errorMessage {
    
}
/** 请求失败处理，主要处理视图相关的部分 */
- (void)presenterRequestFailed:(NSString *)methodBack {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
