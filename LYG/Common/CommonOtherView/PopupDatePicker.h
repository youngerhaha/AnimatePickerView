//
//  PopupDatePicker.h
//  Pengyouquan
//
//  Created by 李洋 on 15/6/25.
//  Copyright (c) 2015年 李洋. All rights reserved.
//

#import "BaseView.h"

//PopupDatePicker显示和隐藏时是否有动画（默认是有动画，没有动画就注释掉）
#define PopupDatePickerAnimationOn

@class PopupDatePicker;

@protocol PopupDatePickerDelegate <NSObject>

@required
//popupDatePicker已经选择日期
- (void)popupDatePicker:(PopupDatePicker *)popupDatePicker didSelectDate:(NSDate *)date;

@optional
//popupDatePicker即将消失
- (void)popupDatePickerWillDismiss:(PopupDatePicker *)popupDatePicker;

//popupDatePicker已经消失
- (void)popupDatePickerDidDismiss:(PopupDatePicker *)popupDatePicker;

@end

//在keyWindow中显示的自定义DatePicker
@interface PopupDatePicker : BaseView

//采用默认的动画效果
+ (void)showPopupDatePickWithDelegate:(id<PopupDatePickerDelegate>)delegate;

//从keyWindow中移除PopupDatePick
- (void)dismiss;

@end
