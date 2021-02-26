//
//  LVTableViewCell.m
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVTableViewCell.h"
#import "LVCellModel.h"

#define lv_screenWidth [UIScreen mainScreen].bounds.size.width

@interface LVTableViewCell ()
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *clickBtn;
@property (nonatomic, strong) NSIndexPath *currentIndex;
@end

@implementation LVTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor redColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, lv_screenWidth, 20)];
    [self.contentView addSubview:_contentLabel];
    
    self.clickBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 20, lv_screenWidth - 200, 20)];
    [_clickBtn setTitle:@"点击" forState:UIControlStateNormal];
    [_clickBtn setBackgroundColor:[UIColor greenColor]];
    [_clickBtn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.clickBtn];
}

- (void)updateCellUIWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath {
    self.currentIndex = indexPath;
    LVCellModel *item = dataSource[indexPath.section][indexPath.row];
    NSString *string = item.dateSource;
    NSString *showString = [NSString stringWithFormat:@"indexPath %zd-%zd context%@",indexPath.section,indexPath.row,string];
    self.contentLabel.text = showString;
}

- (void)didSelectRowWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了 %zd-%zd",indexPath.section,indexPath.row);
}

- (void)btnclick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(cellButtonClickBack:)]) {
        [self.delegate cellButtonClickBack:self.currentIndex];
    }
}
@end
