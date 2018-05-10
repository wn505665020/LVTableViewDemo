//
//  LVTableViewCellBackDelegate.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVCommonCellProtocol.h"

@protocol LVTableViewCellBackDelegate <LVCommonCallBackDelegate>

@optional
- (void)cellButtonClickBack:(NSIndexPath *)indexPath;
@end
