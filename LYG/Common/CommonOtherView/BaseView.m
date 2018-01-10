//
//  BaseView.m
//  Pengyouquan
//
//  Created by 李洋 on 15/6/25.
//  Copyright (c) 2015年 李洋. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

+ (instancetype)getViewFromNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
