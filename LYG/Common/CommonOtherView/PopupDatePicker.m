//
//  PopupDatePicker.m
//  Pengyouquan
//
//  Created by 李洋 on 15/6/25.
//  Copyright (c) 2015年 李洋. All rights reserved.
//

#import "PopupDatePicker.h"

#define ShowPopupDatePickerTimeInterval 0.5
#define DismissPopupDatePickerTimeInterval 0.3

static PopupDatePicker *popupDatePicker = nil;

@interface PopupDatePicker ()

@property (nonatomic, weak) id<PopupDatePickerDelegate> delegate;

//datePicker父视图
@property (weak, nonatomic) IBOutlet UIView *datePickerContainerView;
//辅助视图
@property (weak, nonatomic) IBOutlet UIView *accessoryView;
//日期选择器
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
//日期标签
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
//取消视图
@property (weak, nonatomic) IBOutlet UIView *cancelView;
//取消视图上的点击事件
@property (nonatomic, strong) UITapGestureRecognizer *tapGR;

@end

@implementation PopupDatePicker

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dateLabel.text = [LYGUtil stringWithDate:[NSDate date] andDateFormat:@"yyyy年MM月dd日"];
    self.tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelPopupDataPicker:)];
    [self.cancelView addGestureRecognizer:self.tapGR];
    
    //应用进入后台时，首先将PopupDatePicker移除，以免多个视图或者控制器弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismiss) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)cancelPopupDataPicker:(UITapGestureRecognizer *)tapGR {
    [popupDatePicker dismiss];
}

//在keyWindow里面显示popupDatePicker
- (void)show {
    
#ifdef PopupDatePickerAnimationOn
    //弹出accessoryView和datePickerContainerView的动画
    CGRect accessoryViewFrame = self.accessoryView.frame;
    CGRect datePickerContainerViewFrame = self.datePickerContainerView.frame;
    
    self.accessoryView.frame = CGRectMake(accessoryViewFrame.origin.x, SCREEN_HEIGHT, accessoryViewFrame.size.width, accessoryViewFrame.size.height);
    self.datePickerContainerView.frame = CGRectMake(datePickerContainerViewFrame.origin.x, SCREEN_HEIGHT+accessoryViewFrame.size.height, datePickerContainerViewFrame.size.width, datePickerContainerViewFrame.size.height);
    
    [UIView animateWithDuration:ShowPopupDatePickerTimeInterval animations:^{
        self.accessoryView.frame = accessoryViewFrame;
        self.datePickerContainerView.frame = datePickerContainerViewFrame;
    }];
#else
    
#endif

}

//从keyWindow中移除PopupDatePick
- (void)dismiss {
    
#ifdef PopupDatePickerAnimationOn
    if ([self.delegate respondsToSelector:@selector(popupDatePickerWillDismiss:)]) {
        [self.delegate popupDatePickerWillDismiss:self];
    }
    
    //dismiss accessoryView和datePickerContainerView的动画
    CGRect accessoryViewFrame = self.accessoryView.frame;
    CGRect datePickerContainerViewFrame = self.datePickerContainerView.frame;
    [UIView animateWithDuration:DismissPopupDatePickerTimeInterval animations:^{
        self.accessoryView.frame = CGRectMake(accessoryViewFrame.origin.x, SCREEN_HEIGHT, accessoryViewFrame.size.width, accessoryViewFrame.size.height);
        self.datePickerContainerView.frame = CGRectMake(datePickerContainerViewFrame.origin.x, SCREEN_HEIGHT+accessoryViewFrame.size.height, datePickerContainerViewFrame.size.width, datePickerContainerViewFrame.size.height);
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(popupDatePickerDidDismiss:)]) {
            [self.delegate popupDatePickerDidDismiss:self];
        }
        self.accessoryView.frame = accessoryViewFrame;
        self.datePickerContainerView.frame = datePickerContainerViewFrame;
        [self removeFromSuperview];
    }];
    
#else
    if ([self.delegate respondsToSelector:@selector(popupDatePickerDidDismiss:)]) {
        [self.delegate popupDatePickerDidDismiss:self];
    }
    [self removeFromSuperview];
#endif
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
}

#pragma mark - IBAction

//时间选择器中的值变化
- (IBAction)datePickerValueChanged:(UIDatePicker *)sender {
    self.dateLabel.text = [LYGUtil stringWithDate:self.datePicker.date andDateFormat:@"yyyy年MM月dd日"];
}

//“确认”按钮点击
- (IBAction)confirmButtonClicked:(UIButton *)sender {
    [self.delegate popupDatePicker:self didSelectDate:self.datePicker.date];
    [popupDatePicker dismiss];
}

#pragma mark - Static methods

//在keyWindow里面添加popupDatePicker
+ (void)showPopupDatePickWithDelegate:(id<PopupDatePickerDelegate>)delegate {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if (popupDatePicker==nil) {
        popupDatePicker = [PopupDatePicker getViewFromNib];
        popupDatePicker.frame = keyWindow.bounds;
    }
    popupDatePicker.delegate = delegate;
    [keyWindow addSubview:popupDatePicker];
    
    [popupDatePicker show];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
