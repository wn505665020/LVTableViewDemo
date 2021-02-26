//
//  LVTableViewCell.h
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LVCommonCellProtocol.h"

@protocol LVTableViewCellBackDelegate <LVCommonCallBackDelegate>

@optional
- (void)cellButtonClickBack:(NSIndexPath *)indexPath;
@end

@interface LVTableViewCell : UITableViewCell <LVCommonCellProtocol>
/**也可以写个baseCell实现LVCommonCellProtocol协议*/

@property (nonatomic, weak) id<LVTableViewCellBackDelegate> delegate;

@end
