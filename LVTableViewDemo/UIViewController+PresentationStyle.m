//
//  UIViewController+PresentationStyle.m
//  XxsyReader
//
//  Created by liming on 2019/9/6.
//  Copyright © 2019 ___xiaoxiangwenxue___. All rights reserved.
//

#import "UIViewController+PresentationStyle.h"
#import <objc/runtime.h>

@implementation UIViewController (PresentationStyle)
+ (void)load
{
    /******为了适配ios13 present模式默认改变为不全屏覆盖********/
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        {
            Method originMethod = class_getInstanceMethod([self class], @selector(presentViewController:animated:completion:));
            Method swizzledMethod = class_getInstanceMethod([self class], @selector(lm_presentViewController:animated:completion:));
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
        
    });
}

- (void)lm_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^ __nullable)(void))completion
{
    if (viewControllerToPresent) {
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [self lm_presentViewController:viewControllerToPresent animated:flag completion:completion];
}


@end
