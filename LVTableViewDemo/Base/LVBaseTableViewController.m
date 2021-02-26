//
//  LVBaseTableViewController.m
//  LVTableViewDemo
//
//  Created by WN on 2019/8/5.
//  Copyright © 2019 iflytek. All rights reserved.
//

#import "LVBaseTableViewController.h"
//#import "UIScrollView+EmptyDataSet.h" // DZNEmptyDataSet 不需要就移除 实现没数据时候的占位图
#import "LVCommonCellProtocol.h"
#import "LVCommonCellModelProtocl.h"

#define SECTIONHEADERHEIGHT 10

@interface LVBaseTableViewController () <UITableViewDelegate, UITableViewDataSource, LVCommonCallBackDelegate/**, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate*/>

@end

@implementation LVBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.dataSource = @[].mutableCopy;
    
    [self.view addSubview:self.mainTableView];
}
/**
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return [NSAttributedString iflytek_buildAttributedStringWithStringArray:@[@"暂无数据"]
                                                              withFontArray:@[[UIFont iflytek_fontWithSystemSize:kFontFifth12]]
                                                             withColorArray:@[[UIColor iflytek_colorWithHexadecimal:kColoriFlyTextThird]]];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return UIIMAGE_NAME(@"appNoData");
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return -TOP_BAR_HEIGHT - 60;
}
 */

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSArray *item = self.dataSource[section];
    return (item.count > 0) ? SECTIONHEADERHEIGHT : 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, SECTIONHEADERHEIGHT)];
    headView.backgroundColor = [UIColor clearColor];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *item = self.dataSource[section];
    return item.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<LVCommonCellModelProtocl> item = self.dataSource[indexPath.section][indexPath.row];
    return item.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section >= self.dataSource.count) {
        return [[UITableViewCell alloc] init];
    }
    NSArray *sections = self.dataSource[indexPath.section];
    if (indexPath.row >= sections.count) {
        return [[UITableViewCell alloc] init];
    }
    id<LVCommonCellModelProtocl> object = self.dataSource[indexPath.section][indexPath.row];
    UITableViewCell<LVCommonCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:object.cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(delegate)] && !cell.delegate) {
        cell.delegate = self;
    }
    if ([cell respondsToSelector:@selector(updateCellUIWithDataSource:withIndexPath:)]) {
        [cell updateCellUIWithDataSource:self.dataSource withIndexPath:indexPath];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section >= self.dataSource.count) {
        return;
    }
    NSArray *sections = self.dataSource[indexPath.section];
    if (indexPath.row >= sections.count) {
        return;
    }
    
    UITableViewCell<LVCommonCellProtocol> *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(didSelectRowWithDataSource:withIndexPath:)]) {
        [cell didSelectRowWithDataSource:self.dataSource withIndexPath:indexPath];
    }
}

- (void)registerCell {
}

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0/**TOP_BAR_HEIGHT*/, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height /**- TOP_BAR_HEIGHT*/)];
        _mainTableView.backgroundView = nil;
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
//        _mainTableView.emptyDataSetSource = self;
//        _mainTableView.emptyDataSetDelegate = self;
        
        // A little trick for removing the cell separators
        _mainTableView.tableFooterView = [UIView new];
        [self registerCell];
    }
    return _mainTableView;
}
/**
- (EGOMJTableView *)mainTableView {
    if (!_mainTableView) {
        self.mainTableView = [[EGOMJTableView alloc] initWithFrame:CGRectMake(0, TOP_BAR_HEIGHT, [UIScreen iflytek_screenWidth], [UIScreen iflytek_screenHeight] - TOP_BAR_HEIGHT)];
        _mainTableView.backgroundView = nil;
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.emptyDataSetSource = self;
        _mainTableView.emptyDataSetDelegate = self;
        
        // A little trick for removing the cell separators
        _mainTableView.tableFooterView = [UIView new];
        [self registerCell];
    }
    return _mainTableView;
}
*/
@end
