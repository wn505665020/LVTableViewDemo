//
//  LVPresenterProtocol.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

@protocol LVPresenterProtocol <NSObject>
//启动loadingView
- (void)showAnimatingWithIndicatorStyle:(int)style;
//stop loadingView
- (void)stopAnimatingView;
#pragma mark - Request Back RefreshUI
- (void)updateUIWithMethodBack:(NSString *)methodBack;
/** 请求code不等于0的时候，主要处理试图相关的部分*/
- (void)presenterRequestFailedByErrorMsg:(NSString *)methodBack errorMessage:(NSString *)errorMessage;
/** 请求失败处理，主要处理视图相关的部分 */
- (void)presenterRequestFailed:(NSString *)methodBack;
@end
