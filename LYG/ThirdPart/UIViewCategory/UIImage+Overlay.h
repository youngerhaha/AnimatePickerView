//
//  UIImage+Overlay.h
//  Health Doctor
//
//  Created by LPP on 14-5-7.
//  Copyright (c) 2014年 health. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Overlay)

- (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha;

@end
