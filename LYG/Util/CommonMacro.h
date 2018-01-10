//
//  CommonMacro.h
//  Pengyouquan
//
//  Created by 李洋 on 15/6/27.
//  Copyright (c) 2015年 李洋. All rights reserved.
//

#ifndef Pengyouquan_CommonMacro_h
#define Pengyouquan_CommonMacro_h

//屏幕宽
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕高
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//当前IOS系统版本
#define CurrentSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

//APP主题色
#define APP_THEME_COLOR @"0xee8a10"

//获取可用的字符串
#define AvailableString(string) string?string:@""

//通过类对象来生成nib
#define NibWithClass(Class)  [UINib nibWithNibName:NSStringFromClass([Class class]) bundle:nil]
//通过类对象生成string
#define StringWithClass(Class) NSStringFromClass([Class class])

//默认的Cell两端约束间隔
#define Default_CellConstraintSpace 8.0

#endif
