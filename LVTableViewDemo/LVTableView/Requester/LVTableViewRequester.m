//
//  LVTableViewRequester.m
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVTableViewRequester.h"
@interface LVTableViewRequester ()
@end

@implementation LVTableViewRequester

+ (instancetype)requesterWithinteractor:(id<LVTableViewInteractorProtocol>)interactor {
    LVTableViewRequester *requester = [[self alloc] init];
    return requester;
}

- (void)viewDidLoadMethod {
    //do first request or other
}

@end
