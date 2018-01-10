//
//  NSString+Path.m
//  NurseOperator
//
//  Created by Lee on 13-12-26.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)

+ (NSString*)bundlePathWithBudleName:(NSString*)aBundle{
    return nil;
}

+ (NSString*)mainBundlePath{
    return [[NSBundle mainBundle] resourcePath];
}

+ (NSString*)documentPath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return path;
}

+ (NSString*)cachePath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return path;
}

+ (NSString*)tempPath{
    return NSTemporaryDirectory();
}

+ (NSString*)fileBundlePath:(NSString*)fileName type:(NSString*)type{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:type];
}

+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

@end
