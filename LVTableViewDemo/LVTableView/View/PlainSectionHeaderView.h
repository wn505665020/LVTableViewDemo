//
//  PlainSectionHeaderView.h
//  Lvmm
//
//  Created by zhouyi on 14-7-4.
//  Copyright (c) 2014年 Lvmama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlainSectionHeaderView : UITableViewHeaderFooterView
@property (nonatomic, assign) int resetCount;
@property (nonatomic, assign) NSUInteger section;
@property (nonatomic, weak) UITableView *tableView;

- (void)setBackgroundColor:(UIColor *)backgroundColor;

@end

@interface PlainSectionFooterView : UITableViewHeaderFooterView
@property (nonatomic, assign) int resetCount;
@property (nonatomic, assign) NSUInteger section;
@property (nonatomic, weak) UITableView *tableView;

- (void)setBackgroundColor:(UIColor *)backgroundColor;

@end

@interface PlainSectionHeaderButton : UITableViewHeaderFooterView
@property (nonatomic, assign) int resetCount;
@property (nonatomic, assign) NSUInteger section;
@property (nonatomic, weak) UITableView *tableView;

- (void)setBackgroundColor:(UIColor *)backgroundColor;

@end

@interface PlainSectionMoveHeaderView : UITableViewHeaderFooterView
@property (nonatomic, assign) int resetCount;
@property (nonatomic, assign) NSUInteger section;
@property (nonatomic, weak) UITableView *tableView;

- (void)setBackgroundColor:(UIColor *)backgroundColor;

@end
