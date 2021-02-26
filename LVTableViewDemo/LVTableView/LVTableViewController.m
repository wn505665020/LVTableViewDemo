//
//  LVTableViewController.m
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVTableViewController.h"
#import "LVConfig.h"
#import "LVCellModel.h"

@interface LVTableViewController ()
@end

@implementation LVTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupParams];
    [self setupUI];
}

- (void)setupParams {
    [self performSelector:@selector(loadDateSource) withObject:nil afterDelay:0.5];
}

- (void)setupUI {
}

- (void)loadDateSource {
    [self generateSectionFirst];
    [self generateSectionSecond];
    [self.mainTableView reloadData];
}

/** 只需要组装DataSource就可以实现tableview的展示*/
- (void)generateSectionFirst {
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:50
                                                   cellIdentifier:kCellIdentifierLVTableViewCell
                                                       dateSource:@"一一一"];
        [sectionArray addObject:cellModel];
    }
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:60
                                                   cellIdentifier:kCellIdentifierLVTypeSecondCell
                                                       dateSource:@"二二二"];
        [sectionArray addObject:cellModel];
    }
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:70
                                                   cellIdentifier:kCellIdentifierLVTableViewCell
                                                       dateSource:@"三三三"];
        [sectionArray addObject:cellModel];
    }
    [self.dataSource addObject:sectionArray];
}

- (void)generateSectionSecond {
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:50
                                                   cellIdentifier:kCellIdentifierLVTypeSecondCell
                                                       dateSource:@"四四四"];
        [sectionArray addObject:cellModel];
    }
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:60
                                                   cellIdentifier:kCellIdentifierLVTableViewCell
                                                       dateSource:@"五五五"];
        [sectionArray addObject:cellModel];
    }
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:70
                                                   cellIdentifier:kCellIdentifierLVTypeSecondCell
                                                       dateSource:@"六六六"];
        [sectionArray addObject:cellModel];
    }
    [self.dataSource addObject:sectionArray];
}

#pragma mark - delegate
- (void)cellButtonClickBack:(NSIndexPath *)indexPath {
    NSLog(@"点击了按钮 %zd-%zd",indexPath.section,indexPath.row);
}

- (void)registerCell {
    [self.mainTableView registerClass:NSClassFromString(kCellIdentifierLVTableViewCell) forCellReuseIdentifier:kCellIdentifierLVTableViewCell];
    [self.mainTableView registerClass:NSClassFromString(kCellIdentifierLVTypeSecondCell) forCellReuseIdentifier:kCellIdentifierLVTypeSecondCell];
}

@end
