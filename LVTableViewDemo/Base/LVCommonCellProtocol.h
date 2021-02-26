//
//  LVCommonCellProtocol.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

@protocol LVCommonCallBackDelegate <NSObject>

@end

@protocol LVCommonCellProtocol <NSObject>

@optional
@property (nonatomic, weak) id<LVCommonCallBackDelegate> delegate;

- (void)updateCellUIWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectRowWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath;
@end
