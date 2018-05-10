//
//  LVTableViewInteractor.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVTableViewPresenterProtocol.h"
#import "LVTableViewInteractorProtocol.h"
@interface LVTableViewInteractor : NSObject <LVTableViewInteractorProtocol>
/** tableView的数据源*/
@property (nonatomic, strong) NSMutableArray *dateSource;

+ (instancetype)interactorWithBaseParams:(NSDictionary *)baseParams presenter:(id<LVTableViewPresenterProtocol>)presenter;
- (void)viewDidLoadMethod;
@end
