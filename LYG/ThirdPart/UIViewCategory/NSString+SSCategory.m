//
//  NSString+SSCategory.m
//  SSOA
//
//  Created by wangbin on 14-2-28.
//  Copyright (c) 2014年 wangbin. All rights reserved.
//

#import "NSString+SSCategory.h"

@implementation NSString (SSCategory)
-(BOOL) isValidateMobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:self];
}

- (NSString *)stringByReplacingStringsFromDictionary:(NSDictionary *)dict
{
    NSMutableString *string = [self mutableCopy];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string replaceOccurrencesOfString:key withString:[dict valueForKey:key]
                                   options:0 range:NSMakeRange(0, [string length])];
    }];
    return string;
}

- (BOOL)isValidAddress
{
    if(self.length<8)
        return NO;
    
    if ([self rangeOfString:@"省"].location==NSNotFound &&
        [self rangeOfString:@"市"].location==NSNotFound &&
        [self rangeOfString:@"区"].location==NSNotFound &&
        [self rangeOfString:@"县"].location==NSNotFound) {
        return NO;
    }
    
//    add by alay@20140423
    if([self chsLen]<8){
        return NO;
    }
    
    NSData* da = [self dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
    if(da.length<16){
        return NO;
    }
    
    return YES;
}

//字符串中包含汉字个数
- (int)chsLen{
    int charCount=0;
    for (int i=0;i<self.length; i++) {
        unichar tmpChar=[self characterAtIndex:i];
        if(tmpChar>=0x4E00&&tmpChar<=0x9FA5){
            charCount++;
        }
    }
    return charCount;
}

- (BOOL)isValidAge
{
    NSInteger age = [self getAge];
    if (age >= 180000) {
        return YES;
    }
    else{
        return NO;
    }
}

- (NSInteger)getAge
{
    NSInteger curDate = [NSString getCurrentDate];
    NSInteger csrq = [[self substringWithRange:NSMakeRange(6,8)] intValue];
    return curDate-csrq;
}

+ (NSInteger)getCurrentDate
{
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *d = [cal components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    NSInteger year = [d year];
    NSInteger month = [d month];
    NSInteger day = [d day];
    NSInteger curDate = year*10000+month*100+day;
    return curDate;
}

- (BOOL)isValidZipCode
{
    if (self.length != 6) {
        return NO;
    }
    char c =  [self characterAtIndex:0];
    for (int i=1; i<self.length; i++) {
        if (c != [self characterAtIndex:i]) {
            return YES;
        }
    }
    return NO;
}

+(NSString *)getStringWithRange:(NSString *)str Value1:(NSInteger)value1 Value2:(NSInteger )value2;
{
    return [str substringWithRange:NSMakeRange(value1,value2)];
}
/**
 * 功能:判断是否在地区码内
 * 参数:地区码
 */
+(BOOL)areaCode:(NSString *)code
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"北京" forKey:@"11"];
    [dic setObject:@"天津" forKey:@"12"];
    [dic setObject:@"河北" forKey:@"13"];
    [dic setObject:@"山西" forKey:@"14"];
    [dic setObject:@"内蒙古" forKey:@"15"];
    [dic setObject:@"辽宁" forKey:@"21"];
    [dic setObject:@"吉林" forKey:@"22"];
    [dic setObject:@"黑龙江" forKey:@"23"];
    [dic setObject:@"上海" forKey:@"31"];
    [dic setObject:@"江苏" forKey:@"32"];
    [dic setObject:@"浙江" forKey:@"33"];
    [dic setObject:@"安徽" forKey:@"34"];
    [dic setObject:@"福建" forKey:@"35"];
    [dic setObject:@"江西" forKey:@"36"];
    [dic setObject:@"山东" forKey:@"37"];
    [dic setObject:@"河南" forKey:@"41"];
    [dic setObject:@"湖北" forKey:@"42"];
    [dic setObject:@"湖南" forKey:@"43"];
    [dic setObject:@"广东" forKey:@"44"];
    [dic setObject:@"广西" forKey:@"45"];
    [dic setObject:@"海南" forKey:@"46"];
    [dic setObject:@"重庆" forKey:@"50"];
    [dic setObject:@"四川" forKey:@"51"];
    [dic setObject:@"贵州" forKey:@"52"];
    [dic setObject:@"云南" forKey:@"53"];
    [dic setObject:@"西藏" forKey:@"54"];
    [dic setObject:@"陕西" forKey:@"61"];
    [dic setObject:@"甘肃" forKey:@"62"];
    [dic setObject:@"青海" forKey:@"63"];
    [dic setObject:@"宁夏" forKey:@"64"];
    [dic setObject:@"新疆" forKey:@"65"];
    [dic setObject:@"台湾" forKey:@"71"];
    [dic setObject:@"香港" forKey:@"81"];
    [dic setObject:@"澳门" forKey:@"82"];
    [dic setObject:@"国外" forKey:@"91"];
    
    if ([dic objectForKey:code] == nil) {
        
        return NO;
    }
    return YES;
}

- (BOOL) isvalidID
{
    //判断位数
    if ([self length] < 15 ||[self length] > 18) {
        
        return NO;
    }
    
    NSString *carid = self;
    long lSumQT =0;
    //加权因子
    int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    //校验码
    unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
    
    //将15位身份证号转换成18位
    
    NSMutableString *mString = [NSMutableString stringWithString:self];
    if ([self length] == 15) {
        
        [mString insertString:@"19" atIndex:6];
        long p = 0;
        const char *pid = [mString UTF8String];
        for (int i=0; i<=16; i++)
        {
            p += (pid[i]-48) * R[i];
        }
        
        int o = p%11;
        NSString *string_content = [NSString stringWithFormat:@"%c",sChecker[o]];
        [mString insertString:string_content atIndex:[mString length]];
        carid = mString;
    }
    
    //判断地区码
    NSString * sProvince = [carid substringToIndex:2];
    
    if (![NSString areaCode:sProvince]) {
        
        return NO;
    }
    
    //判断年月日是否有效
    
    //年份
    int strYear = [[NSString getStringWithRange:carid Value1:6 Value2:4] intValue];
    //月份
    int strMonth = [[NSString getStringWithRange:carid Value1:10 Value2:2] intValue];
    //日
    int strDay = [[NSString getStringWithRange:carid Value1:12 Value2:2] intValue];
    
    
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:localZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",strYear,strMonth,strDay]];
    if (date == nil) {
        
        return NO;
    }
    
    const char *PaperId  = [carid UTF8String];
    
    //检验长度
    if( 18 != strlen(PaperId)) return -1;
    //校验数字
    for (int i=0; i<18; i++)
    {
        if ( !isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i) )
        {
            return NO;
        }
    }
    //验证最末的校验码
    for (int i=0; i<=16; i++)
    {
        lSumQT += (PaperId[i]-48) * R[i];
    }
    if (sChecker[lSumQT%11] != PaperId[17] )
    {
        return NO;
    }
    
    return YES;
}

+ (NSString *)removePhone:(NSString *)phoneMumber prefixAndSepareateMark:(NSString *)mark
{
    phoneMumber =  [phoneMumber stringByReplacingOccurrencesOfString:mark withString:@""];
    if ([phoneMumber hasPrefix:@"+86"]) {
        phoneMumber =[phoneMumber substringFromIndex:3];
    }
    return phoneMumber;
}
@end
