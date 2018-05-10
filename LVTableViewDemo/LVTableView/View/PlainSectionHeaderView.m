//
//  PlainSectionHeaderView.m
//  Lvmm
//
//  Created by zhouyi on 14-7-4.
//  Copyright (c) 2014年 Lvmama. All rights reserved.
//

#import "PlainSectionHeaderView.h"

//固定Plain型的tableView的HeaderView
@implementation PlainSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = [UIColor clearColor];
        self.backgroundView = bgView;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    if (self.resetCount || (self.tableView).tracking || (self.tableView).decelerating || (self.tableView).dragging) {
        self.resetCount = 1;
        CGRect sectionRect = [self.tableView rectForSection:self.section];
        CGRect newFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(sectionRect), CGRectGetWidth(frame), CGRectGetHeight(frame));
        super.frame = newFrame;
    } else {
        super.frame = frame;
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

@end

//固定Plain型的tableView的FooterView
@implementation PlainSectionFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = [UIColor clearColor];
        self.backgroundView = bgView;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    if (self.resetCount || (self.tableView).tracking || (self.tableView).decelerating || (self.tableView).dragging) {
        self.resetCount = 1;
        CGRect sectionRect = [self.tableView rectForSection:self.section];
        CGRect newFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMaxY(sectionRect) - CGRectGetHeight(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));
        super.frame = newFrame;
    } else {
        super.frame = frame;
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

@end

//固定Plain型的tableView的HeaderView
@implementation PlainSectionHeaderButton

- (void)setFrame:(CGRect)frame {
    if (self.resetCount || (self.tableView).tracking || (self.tableView).decelerating || (self.tableView).dragging) {
        self.resetCount = 1;
        CGRect sectionRect = [self.tableView rectForSection:self.section];
        CGRect newFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(sectionRect), CGRectGetWidth(frame), CGRectGetHeight(frame));
        super.frame = newFrame;
    } else {
        super.frame = frame;
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = [UIColor clearColor];
        self.backgroundView = bgView;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selfHeaderClick:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)headerClick:(id)sender {
    assert(NO);
}

- (void)selfHeaderClick:(UITapGestureRecognizer *)t {
    [self.tableView.delegate performSelector:@selector(headerClick:) withObject:self];
}
- (void)dealloc {
    self.tableView = nil;
    self.section = NSNotFound;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

@end

@implementation PlainSectionMoveHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = [UIColor clearColor];
        self.backgroundView = bgView;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    if (self.section > (self.tableView).numberOfSections - 1) {
        //        return [super setFrame:frame];
        super.frame = frame;
        return;
    }
    if (self.resetCount || (self.tableView).tracking || (self.tableView).decelerating || (self.tableView).dragging) {
        self.resetCount = 1;
        CGRect sectionRect = [self.tableView rectForSection:self.section];
        CGRect newFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(sectionRect), CGRectGetWidth(frame), CGRectGetHeight(frame));
        super.frame = newFrame;
    } else {
        super.frame = frame;
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}

@end
