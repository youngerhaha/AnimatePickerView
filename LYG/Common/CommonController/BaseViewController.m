//
//  BaseViewController.m
//  LYG
//
//  Created by 李洋 on 15/6/18.
//  Copyright (c) 2015年 李洋. All rights reserved.
//

#import "BaseViewController.h"
#import "UIBarButtonItem+WB.h"

#import "PopupDatePicker.h"
#import "PopupPickerView.h"

@interface BaseViewController ()<PopupDatePickerDelegate,PopupPickerViewDelegate>


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureNavigationBarButtonItems];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)configureNavigationBarButtonItems {
    //不是首页，且左侧不存在barButtonItem
    if (self.navigationController.viewControllers.count>1&&self.navigationItem.leftBarButtonItems.count==0) {
        self.navigationItem.leftBarButtonItem = [LYGUtil barButtonItemWithWithImageNamed:@"login_backicon_normal" hightlightedImageNamed:@"login_backicon_pressed" target:self andSelector:@selector(popViewController)];
    }
    
    [self configureNavigationBarButtonItemsTheme];
}

#pragma mark - IBAction

- (IBAction)showPopupDatePicker:(id)sender {
    [PopupDatePicker showPopupDatePickWithDelegate:self];
}

- (IBAction)showPopupPickerView:(id)sender {
    [PopupPickerView showPopupPickerViewWithDelegate:self andDataSourceArray:@[@[@"123",@"234"],@[@"345"]]];
}

#pragma mark - PopupDatePickerDelegate

//popupDatePicker已经选择日期
- (void)popupDatePicker:(PopupDatePicker *)popupDatePicker didSelectDate:(NSDate *)date {
    NSLog(@"%@",date);
}


#pragma mark - PopupPickerViewDelegate

- (void)popupPickerView:(PopupPickerView *)popupPickerView didSelectItemTitles:(NSArray *)itemTitles {
    NSLog(@"itemTitles:%@",itemTitles);
}

#pragma mark - Basic Functions

//配置UINavigationBar上的item的样式
- (void)configureNavigationBarButtonItemsTheme {
    //找到所有的barButtonItems
    NSMutableArray *barButtonItems = [LYGUtil barButtonItemsInNavWithViewController:self];
    
    for (UIBarButtonItem *barButtonItem in barButtonItems) {
        // 设置文字属性
        [LYGUtil setDefaultTitleTextAttributesForBarButtonItem:barButtonItem];
    }
}

//设置Navigation的左侧item隐藏
- (void)setLeftNavigationBarButtonItemHidden {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
}

-(void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
