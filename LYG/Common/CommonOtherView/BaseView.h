//
//  BaseView.h
//  Pengyouquan
//
//  Created by 李洋 on 15/6/25.
//  Copyright (c) 2015年 李洋. All rights reserved.
//

#import <UIKit/UIKit.h>

//基view
@interface BaseView : UIView

//从与子类同名的Nib文件中加载cell
+ (instancetype)getViewFromNib;

@end
