//
//  LVCellModel.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVCommonCellModelProtocl.h"
@interface LVCellModel : NSObject <LVCommonCellModelProtocl>
@property (nonatomic, assign) float cellHeight;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, assign) BOOL needRefreshCell;
@property (nonatomic, strong) id dateSource;

/** 默认需要刷新cell的Model初始化方式*/
+ (LVCellModel *)generateCommonModel:(float)cellHeight
                      cellIdentifier:(NSString *)cellIdentifier
                          dateSource:(id)dateSource;
/** 如果不需要刷新cell，用该Model初始化方式（应该用不到）*/
+ (LVCellModel *)generateCommonModel:(float)cellHeight
                      cellIdentifier:(NSString *)cellIdentifier
                          dateSource:(id)dateSource
                     needRefreshCell:(BOOL)needRefreshCell;
@end
