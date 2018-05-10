//
//  LVTableViewInteractorProtocol.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//
#import "LVInteractorProtocol.h"

@protocol LVTableViewInteractorProtocol <LVInteractorProtocol>
/** tableView的数据源*/
@property (nonatomic, strong) NSMutableArray *dateSource;

@end
