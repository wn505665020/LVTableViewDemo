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
#define lv_screenHeight [UIScreen mainScreen].bounds.size.height

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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, lv_screenWidth, 20)];
    [self.contentView addSubview:_contentLabel];
    
    self.clickBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, lv_screenWidth, 20)];
    [_clickBtn setTitle:@"点击" forState:UIControlStateNormal];
    [_clickBtn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.clickBtn];
}

- (void)updateCellUIWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath {
    self.currentIndex = indexPath;
    LVCellModel *item = dataSource[indexPath.section][indexPath.row];
    NSString *string = item.dateSource;
    NSString *showString = [NSString stringWithFormat:@"indexPath %zd-%zd context%@ %@",indexPath.section,indexPath.row,string,self.titleString];
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
