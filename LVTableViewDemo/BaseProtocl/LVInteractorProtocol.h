//
//  LVInteractorProtocol.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//


@class LVMMRequestSetup;

@protocol LVInteractorProtocol <NSObject>
- (void)dealRequestSuccessMethod:(LVMMRequestSetup *)request;
- (void)dealRequestFailedMethod:(LVMMRequestSetup *)request;
- (void)dealRequestMsgErrorMethod:(LVMMRequestSetup *)request;
@end
