//
//  LVTableViewCell.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LVTableViewCellProtocol.h"
#import "LVTableViewCellBackDelegate.h"

@interface LVTableViewCell : UITableViewCell <LVTableViewCellProtocol>
@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, weak) id<LVTableViewCellBackDelegate> delegate;

@end
