//
//  UIColor+Helper.h
//  Health Doctor
//
//  Created by LPP on 14-3-13.
//  Copyright (c) 2014年 health. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Helper)

- (UIImage *)image;

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+(UIColor *)colorWithHex:(int)hex;
+(UIColor *)backgroundColor;
+(UIColor *)textColor;
+(UIColor *)tfbgColor;
+(UIColor *)tfbgatvColor;
+(UIColor *)tfbdColor;
+(UIColor *)btbgColor;
+(UIColor *)btshdwColor;
+(UIColor *)nvbgColor;
+(UIColor *)stepTitleColor;

@end
