//
//  UITableView+Utilies.m
//  Noq
//
//  Created by mac on 14/10/28.
//  Copyright (c) 2014年 xun. All rights reserved.
//

#import "UITableView+Utilies.h"

@implementation UITableView (Utilies)

- (void)setTableViewExtraFooterView{
    UIView *view = [UIView new];
    UITableView *tb = (UITableView *)self;
    [tb setTableFooterView:view];
}

- (void)setTableViewSeperaInsetZero{
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
