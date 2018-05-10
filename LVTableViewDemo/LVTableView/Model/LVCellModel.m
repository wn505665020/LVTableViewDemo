//
//  LVCellModel.m
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVCellModel.h"

@implementation LVCellModel

+ (LVCellModel *)generateCommonModel:(float)cellHeight cellIdentifier:(NSString *)cellIdentifier dateSource:(id)dateSource {
    //是否需要刷新Model对应的cell，初始化的时候数据修改了，默认是YES
    return [self generateCommonModel:cellHeight cellIdentifier:cellIdentifier dateSource:dateSource needRefreshCell:YES];
}

+ (LVCellModel *)generateCommonModel:(float)cellHeight
                      cellIdentifier:(NSString *)cellIdentifier
                          dateSource:(id)dateSource
                     needRefreshCell:(BOOL)needRefreshCell {
    LVCellModel *model = [[self alloc] init];
    model.cellHeight = cellHeight;
    model.cellIdentifier = cellIdentifier;
    model.dateSource = dateSource;
    model.needRefreshCell = needRefreshCell;
    return model;
}

@end
