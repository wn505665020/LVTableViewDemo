//
//  LVTableViewCellProtocol.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVCommonCellProtocol.h"
@protocol LVTableViewCellProtocol <LVCommonCellProtocol>
@optional
@property (nonatomic, copy) NSString *titleString;
@end
