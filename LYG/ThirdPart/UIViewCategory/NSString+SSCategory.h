//
//  NSString+SSCategory.h
//  SSOA
//
//  Created by wangbin on 14-2-28.
//  Copyright (c) 2014年 wangbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SSCategory)
-(BOOL) isValidateMobile;
- (NSString *)stringByReplacingStringsFromDictionary:(NSDictionary *)dict;
- (BOOL)isValidAddress;
- (BOOL)isValidAge;
- (BOOL) isvalidID;
- (BOOL)isValidZipCode;
- (NSInteger)getAge;
+ (NSInteger)getCurrentDate;
+ (NSString *)removePhone:(NSString *)phoneMumber prefixAndSepareateMark:(NSString *)mark;
@end
