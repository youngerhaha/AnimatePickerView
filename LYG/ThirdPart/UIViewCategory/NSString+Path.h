//
//  NSString+Path.h
//  NurseOperator
//
//  Created by Lee on 13-12-26.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)
+ (NSString*)bundlePathWithBudleName:(NSString*)aBundle;
+ (NSString*)mainBundlePath;

+ (NSString*)documentPath;
+ (NSString*)cachePath;
+ (NSString*)tempPath;

+ (NSString*)fileBundlePath:(NSString*)fileName type:(NSString*)type;

+ (BOOL)isPureInt:(NSString*)string;
@end
