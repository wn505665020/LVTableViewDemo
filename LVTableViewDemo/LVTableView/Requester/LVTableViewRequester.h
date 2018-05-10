//
//  LVTableViewRequester.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVTableViewInteractorProtocol.h"
@interface LVTableViewRequester : NSObject

+ (instancetype)requesterWithinteractor:(id<LVTableViewInteractorProtocol>)interactor;
- (void)viewDidLoadMethod;
@end
