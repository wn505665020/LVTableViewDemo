//
//  LVTypeSecondCell.m
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVTypeSecondCell.h"
#import "LVCellModel.h"

#define lv_screenWidth [UIScreen mainScreen].bounds.size.width

@interface LVTypeSecondCell ()
@property (nonatomic, strong) UILabel *contentLabel;

@end
@implementation LVTypeSecondCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor yellowColor];
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, lv_screenWidth, 20)];
        [self.contentView addSubview:_contentLabel];
    }
    return self;
}

- (void)updateCellUIWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath {
    LVCellModel *item = dataSource[indexPath.section][indexPath.row];
    NSString *string = item.dateSource;
    NSString *showString = [NSString stringWithFormat:@"indexPath %zd-%zd context%@",indexPath.section,indexPath.row,string];
    self.contentLabel.text = showString;
}

- (void)didSelectRowWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了 %zd-%zd",indexPath.section,indexPath.row);
}

@end
