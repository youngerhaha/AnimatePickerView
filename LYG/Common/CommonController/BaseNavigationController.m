//
//  BaseNavigationController.m
//  LYG
//
//  Created by 李洋 on 15/6/18.
//  Copyright (c) 2015年 李洋. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIColor+Addition.h"
#import "UIImage+WB.h"
#import "CommonMacro.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Basic Functions

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - Static functions--configure navi bar theme

//第一次使用这个类时调用
+ (void)initialize
{
    // 设置导航栏主题
    [self configureNavigationBarTheme];
}

// 设置导航栏主题
+ (void)configureNavigationBarTheme
{
    // 取出 appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //    [navBar setBackgroundImage:[self createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    //    [navBar setBackIndicatorTransitionMaskImage:[self createImageWithColor:[UIColor clearColor]]];
    //    [navBar setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    // 设置背景
    
    [navBar setBarTintColor:[UIColor getColorRGB:APP_THEME_COLOR]];
    // 设置标题属性
    if (CurrentSystemVersion<8.0) {
        [navBar setTranslucent:NO];
    }
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
}

@end
