//
//  UIColor+Helper.m
//  Health Doctor
//
//  Created by LPP on 14-3-13.
//  Copyright (c) 2014年 health. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

- (UIImage *)image {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+(UIColor *)colorWithHex:(int)hex {
    
    int r = (hex >> 16) & 255;
    int g = (hex >> 8) & 255;
    int b = hex & 255;
    
    float rf = (float)r / 255.0f;
    float gf = (float)g / 255.0f;
    float bf = (float)b / 255.0f;
    
    return [UIColor colorWithRed:rf green:gf blue:bf alpha:1.0];
}

+(UIColor *)backgroundColor
{
    return [UIColor colorWithHex:0xf2f2f2];
}

+(UIColor *)textColor
{
    return [UIColor colorWithHex:0x202020];
}

+(UIColor *)tfbgColor
{
    return [UIColor colorWithHex:0xDEDDE2];
}

+(UIColor *)tfbgatvColor
{
    return [UIColor colorWithHex:0xFEF0EF];
}

+(UIColor *)tfbdColor
{
    return [UIColor colorWithHex:0x753144];
}

+(UIColor *)btbgColor
{
    return [UIColor colorWithHex:0xAC3215];
    //    return [UIColor colorWithHex:0x7d0000];
}

+(UIColor *)btshdwColor
{
    return [UIColor colorWithHex:0xAC3215];
}

+(UIColor *)nvbgColor
{
    //    return [UIColor colorWithHex:0xB13134];
    return [UIColor colorWithHex:0xAC3215];
}

+(UIColor*)stepTitleColor
{
    return [UIColor colorWithHex:0x4FACEF];
}


@end
