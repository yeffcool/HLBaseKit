//
//  ConvertObject.m
//  XinLing
//
//  Created by 利 韩 on 14/12/13.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//
#include <objc/runtime.h>
#import "ConvertObject.h"

@implementation ConvertObject

+ (NSDate*)convertStringToDate:(NSString*)strFormat time:(NSString*)strDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormat];
    NSDate *date = [dateFormatter dateFromString:strDate];
    return date;
}

+ (NSString*)convertDateToString:(NSString*)strFormat date:(NSDate*)dateObject
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormat];
    NSString *strDate = [dateFormatter stringFromDate:dateObject];
    return strDate;
}

+ (NSString*) convertDataToStringUTF8:(NSData*)data
{
    NSString *string = @"";
    if (data != nil)
    {
        string = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
    }
    return string;
}

+ (NSString*) convertDataToStringGB2312:(NSData*)data
{
    NSString *string = @"";
    if (data != nil)
    {
        NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        string = [[NSString alloc] initWithData:data  encoding:encoding];
    }
    return string;
}

+ (NSData*) convertStringUTF8ToData:(NSString*)string
{
    NSData* data = [[NSData alloc] init];
    @try {
        if (string != nil)
        {
            data = [string dataUsingEncoding:NSUTF8StringEncoding];
        }
    }
    @catch (NSException *exception) {
    }
    
    return data;
}

+ (NSData*)convertIdToJsonData:(id)obj
{
    NSData* jsonData = nil;
    @try {
        if (obj != nil)
        {
            NSError *error = nil;
            jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
        }
    }
    @catch (NSException *exception) {
    }
    
    return jsonData;
}

+ (NSString*)convertIdToJsonString:(id)obj
{
    NSString *string = @"";
    @try
    {
        NSData *dataJson = [self convertIdToJsonData:obj];
        if (string != nil)
        {
            string = [self convertDataToStringUTF8:dataJson];
        }
    }
    @catch (NSException *exception) {
    }
    
    return string;
}

+ (NSString*) convertIdToString:(id)object
{
    NSString *string = @"";
    @try {
        if (object != nil && object != [NSNull null])
        {
            return [NSString stringWithFormat:@"%@", object];
        }
    }
    @catch (NSException *exception) {
        return string;
    }
    
    return string;
}

+ (int) convertStringToInt:(id)object
{
    @try {
        if (object != nil && object != [NSNull null])
        {
            return [[self convertIdToString:object] intValue];
        }
    }
    @catch (NSException *exception) {
        return -1;
    }
    
    return -1;
}

+ (long)convertStringToLong:(id)object
{
    @try {
        if (object != nil && object != [NSNull null])
        {
            return (long)[[self convertIdToString:object] longLongValue];
        }
    }
    @catch (NSException *exception) {
        return -1;
    }
    
    return -1;
}

+ (int) convertStringToFloat:(id)object
{
    @try {
        if (object != nil && object != [NSNull null])
        {
            return [[self convertIdToString:object] floatValue];
        }
    }
    @catch (NSException *exception) {
        return -1;
    }
    
    return -1;
}

+ (double) convertStringToDouble:(id)object
{
    @try {
        if (object != nil && object != [NSNull null])
        {
            return [[self convertIdToString:object] doubleValue];
        }
    }
    @catch (NSException *exception) {
        return -1;
    }
    
    return -1;
}

+ (BOOL) convertStringToBool:(id)object
{
    @try {
        if (object != nil && object != [NSNull null] && ![@"" isEqualToString:object])
        {
            NSString* temp = [[self convertIdToString:object] lowercaseString];
            return [temp boolValue];
        }
    }
    @catch (NSException *exception) {
        return false;
    }
    
    return false;
}

+ (int) convertIdToInt:(id)object
{
    @try {
        if (object != nil && object != [NSNull null])
        {
            return [object intValue];
        }
    }
    @catch (NSException *exception) {
        return -1;
    }
    
    return -1;
}

+ (long) convertIdToLong:(id)object
{
    @try {
        if (object != nil && object != [NSNull null])
        {
            return [object longValue];
        }
    }
    @catch (NSException *exception) {
        return -1;
    }
    
    return -1;
}

+ (float) convertIdToFloat:(id)object
{
    @try {
        if (object != nil && object != [NSNull null])
        {
            return [object floatValue];
        }
    }
    @catch (NSException *exception) {
        return 0;
    }
    
    return 0;
}

+ (BOOL)convertIdToBool:(id)object
{
    @try {
        if (object != nil && object != [NSNull null])
        {
            return [object boolValue];
        }
    }
    @catch (NSException *exception) {
        return false;
    }
    
    return false;
}

+ (NSDictionary*) convertIdToDictionary:(id)object
{
    @try {
        if (object != nil && [object isKindOfClass:[NSDictionary class]])
        {
            return (NSDictionary*)object;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    
    return nil;
}

+ (NSMutableArray*) convertIdToArray:(id)object
{
    @try {
        if (object != nil && [object isKindOfClass:[NSMutableArray class]])
        {
            return (NSMutableArray*)object;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    
    return nil;
}

+ (int) getValueIntFromDictionary:(NSDictionary*)object keyField:(NSString*)key
{
    @try {
        if (object != nil)
        {
            return [ConvertObject convertStringToInt:[object objectForKey:key]];
        }
    }
    @catch (NSException *exception) {
        return -1;
    }
    
    return -1;
}

+ (BOOL) getValueBoolFromDictionary:(NSDictionary*)object keyField:(NSString*)key
{
    @try {
        if (object != nil)
        {
            return [ConvertObject convertStringToBool:[object objectForKey:key]];
        }
    }
    @catch (NSException *exception) {
        return false;
    }
    
    return false;
}

+ (NSDictionary*) getValueDictionaryFromDictionary:(NSDictionary*)object keyField:(NSString*)key
{
    @try {
        if (object != nil)
        {
            return [ConvertObject convertIdToDictionary:[object objectForKey:key]];
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    
    return nil;
}

+ (NSMutableArray*) getValueArrayFromDictionary:(NSDictionary*)object keyField:(NSString*)key
{
    @try {
        if (object != nil)
        {
            return [ConvertObject convertIdToArray:[object objectForKey:key]];
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    
    return nil;
}

+ (NSDictionary*)getValueFirstDictionaryFromDictionary:(NSDictionary*)object keyField:(NSString*)key
{
    @try {
        if (object != nil)
        {
            NSMutableArray* array = [ConvertObject getValueArrayFromDictionary:object keyField:key];
            if (array != nil && [array count] > 0)
            {
                id value = [array objectAtIndex:0];
                return [ConvertObject convertIdToDictionary:value];
            }
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    
    return nil;
}

+ (NSDictionary*)getValueDictionaryFromObject:(Class)cls object:(id)obj
{
    NSMutableDictionary *dictionaryFormat = [NSMutableDictionary dictionary];
    
    unsigned int ivarsCnt = 0;
    //　获取类成员变量列表，ivarsCnt为类成员数量
    Ivar *ivars = class_copyIvarList(cls, &ivarsCnt);
    
    //　遍历成员变量列表，其中每个变量都是Ivar类型的结构体
    for (const Ivar *p = ivars; p < ivars + ivarsCnt; ++p)
    {
        Ivar const ivar = *p;
        
        //　获取变量名
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 若此变量未在类结构体中声明而只声明为Property，则变量名加前缀 '_'下划线
        // 比如 @property(retain) NSString *abc;则 key == _abc;
        
        //　获取变量值
        id value = [obj valueForKey:key];
        
        //　取得变量类型
        // 通过 type[0]可以判断其具体的内置类型
        //const char *type = ivar_getTypeEncoding(ivar);
        
        if (value)
        {
            [dictionaryFormat setObject:value forKey:key];
        }
        else
        {
            [dictionaryFormat setObject:value forKey:key];
        }
    }
    return dictionaryFormat;
}

+ (BOOL)isPureInt:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int value;
    return [scan scanInt:&value] && [scan isAtEnd];
}

+ (BOOL)isPureInteger:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    NSInteger value;
    return [scan scanInteger:&value] && [scan isAtEnd];
}

+ (BOOL)isPureLongLong:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    long long value;
    return [scan scanLongLong:&value] && [scan isAtEnd];
}

+ (NSString*)unicodeDecode:(NSString *)unicodeStr
{
    NSString *result = @"";
    @try {
        NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
        NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
        NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
        NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
        NSString* returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:nil error:nil];
        result = [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
    return result;
}

+ (NSString*)unicodeEncode:(NSString *)string
{
    NSString *result = @"";
    @try {
        if (string != nil)
        {
            NSUInteger length = [string length];
            NSMutableString *mutableString = [NSMutableString stringWithCapacity:0];
            for (int i = 0;i < length; i++)
            {
                unichar _char = [string characterAtIndex:i];
                [mutableString appendFormat:@"\\u%04x", _char];
            }
            result = mutableString;
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
    return result;
}

+ (NSUInteger)calcAgeWithDate:(NSDate*)dateBirth
{
    NSUInteger age = 0;
    if (dateBirth != nil)
    {
        NSTimeInterval dateDiff = [dateBirth timeIntervalSinceNow];
        age = trunc(fabs(dateDiff)/(60*60*24))/365;
    }
    return age;
}

/**
 *  <#Description#>
 *
 *  @param dateBirth <#dateBirth description#>
 *
 *  @return <#return value description#>
 */
+ (NSUInteger)calcConstellationWithDate:(NSDate*)dateBirth
{
    NSUInteger constellation = 1;
    @try {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:dateBirth];
        constellation = [self calcConstellationValueWithMonth:dateComponent.month day:dateComponent.day];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return constellation;
}

/**
 *  <#Description#>
 *
 *  @param month <#month description#>
 *  @param day   <#day description#>
 *
 *  @return <#return value description#>
 */
+ (NSUInteger)calcConstellationValueWithMonth:(NSInteger)month day:(NSInteger)day
{
    NSUInteger resultConstellation = 1;
    
//    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroString = @"01020304050607080910111201";
    NSString *astroFormat = @"102123444543";
    
    if ( month<1 || month>12 || day<1 || day>31 )
    {
        return resultConstellation;
    }
    
    if( month==2 && day>29 )
    {
        return resultConstellation;
    }
    else if( month==4 || month==6 || month==9 || month==11)
    {
        if ( day>30 )
        {
            return resultConstellation;
        }
    }
    
    NSString *resultString = [NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(month*2-(day < [[astroFormat substringWithRange:NSMakeRange((month-1), 1)] intValue] - (-19))*2, 2)]];
    
    int constellationTemp = [ConvertObject convertStringToInt:resultString];
    if (constellationTemp <= 0 || constellationTemp > 12)
    {
        resultConstellation = 1;
    }
    else
    {
        resultConstellation = constellationTemp;
    }
    
    return resultConstellation;
}

/**
 *  <#Description#>
 *
 *  @param constellation <#constellation description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)calcConstellationCN:(NSInteger)constellation
{
    NSString *strConstellation = @"魔羯座";
    switch (constellation)
    {
        case 1:
            strConstellation = @"魔羯座";
            break;
        case 2:
            strConstellation = @"水瓶座";
            break;
        case 3:
            strConstellation = @"双鱼座";
            break;
        case 4:
            strConstellation = @"白羊座";
            break;
        case 5:
            strConstellation = @"金牛座";
            break;
        case 6:
            strConstellation = @"双子座";
            break;
        case 7:
            strConstellation = @"巨蟹座";
            break;
        case 8:
            strConstellation = @"狮子座";
            break;
        case 9:
            strConstellation = @"处女座";
            break;
        case 10:
            strConstellation = @"天秤座";
            break;
        case 11:
            strConstellation = @"天蝎座";
            break;
        case 12:
            strConstellation = @"射手座";
            break;
            
        default:
            strConstellation = @"魔羯座";
            break;
    }
    
    return strConstellation;
}

/**
 *  <#Description#>
 *
 *  @param constellation <#constellation description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)calcConstellationEN:(NSInteger)constellation
{
    NSString *strConstellation = @"Cap";
    switch (constellation)
    {
        case 1:
            strConstellation = @"Cap";
            break;
        case 2:
            strConstellation = @"Agr";
            break;
        case 3:
            strConstellation = @"Psc";
            break;
        case 4:
            strConstellation = @"Ari";
            break;
        case 5:
            strConstellation = @"Tau";
            break;
        case 6:
            strConstellation = @"Gem";
            break;
        case 7:
            strConstellation = @"Cnc";
            break;
        case 8:
            strConstellation = @"Leo";
            break;
        case 9:
            strConstellation = @"Vir";
            break;
        case 10:
            strConstellation = @"Lib";
            break;
        case 11:
            strConstellation = @"Sco";
            break;
        case 12:
            strConstellation = @"Sgr";
            break;
            
        default:
            strConstellation = @"Cap";
            break;
    }
    
    return strConstellation;
}

/**
 *  <#Description#>
 *
 *  @param colorValue <#colorValue description#>
 *  @param plusValue  <#plusValue description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)calcColor:(UIColor*)colorValue plus:(NSInteger)plusValue
{
    return [self calcColor:colorValue plusR:plusValue plusg:plusValue plusB:plusValue plusA:0];
}

/**
 *  <#Description#>
 *
 *  @param colorValue <#colorValue description#>
 *  @param plusRValue <#plusRValue description#>
 *  @param plusGValue <#plusGValue description#>
 *  @param plusBValue <#plusBValue description#>
 *  @param plusAValue <#plusAValue description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)calcColor:(UIColor*)colorValue plusR:(NSInteger)plusRValue plusg:(NSInteger)plusGValue plusB:(NSInteger)plusBValue plusA:(NSInteger)plusAValue
{
    UIColor *resultColor = colorValue;
    @try {
        CGColorRef color = [colorValue CGColor];
        size_t numComponents = CGColorGetNumberOfComponents(color);
        if (numComponents >= 3)
        {
            const CGFloat *tmComponents = CGColorGetComponents(color);
            NSInteger valueR = tmComponents[0] * 255 + plusRValue;
            NSInteger valueG = tmComponents[1] * 255 + plusGValue;
            NSInteger valueB = tmComponents[2] * 255 + plusBValue;
            NSInteger valueA = tmComponents[3] * 255 + plusAValue;
            if (valueR < 0)
            {
                valueR = 0;
            }
            if (valueR > 255)
            {
                valueR = 255;
            }
            if (valueG < 0)
            {
                valueG = 0;
            }
            if (valueG > 255)
            {
                valueG = 255;
            }
            if (valueB < 0)
            {
                valueB = 0;
            }
            if (valueB > 255)
            {
                valueB = 255;
            }
            if (valueA < 0)
            {
                valueA = 0;
            }
            if (valueA > 255)
            {
                valueA = 255;
            }
            
            resultColor = [UIColor colorWithRed:(CGFloat)valueR/255.0f green:(CGFloat)valueG/255.0f blue:(CGFloat)valueB/255.0f alpha:(CGFloat)valueA/255.0f];
        }
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
    
    return resultColor;
}

/**
 *  <#Description#>
 *
 *  @param strHexColor <#strHexColor description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)convertStringToColor:(NSString*)strHexColor
{
    if (strHexColor == nil || [strHexColor isEqualToString:@""])
    {
        return [UIColor clearColor];
    }
    
    @try {
        NSString *cString = [[strHexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        
        // String should be 6 or 8 characters
        if ([cString length] < 6)
        {
            return [UIColor clearColor];
        }
        
        // strip 0X if it appears
        if ([cString hasPrefix:@"0X"])
        {
            cString = [cString substringFromIndex:2];
        }
        if ([cString hasPrefix:@"#"])
        {
            cString = [cString substringFromIndex:1];
        }
        if ([cString length] != 6 && [cString length] != 8)
        {
            return [UIColor clearColor];
        }
        
        // Separate into r, g, b substrings
        NSRange range;
        range.length = 2;
        
        NSString *aString = @"FF";
        NSString *rString = @"FF";
        NSString *gString = @"FF";
        NSString *bString = @"FF";
        if ([cString length] == 8)
        {
            //a
            range.location = 0;
            aString = [cString substringWithRange:range];
            //r
            range.location = 2;
            rString = [cString substringWithRange:range];
            //g
            range.location = 4;
            gString = [cString substringWithRange:range];
            //b
            range.location = 6;
            bString = [cString substringWithRange:range];
        }
        else if ([cString length] == 6)
        {
            //r
            range.location = 0;
            rString = [cString substringWithRange:range];
            //g
            range.location = 2;
            gString = [cString substringWithRange:range];
            //b
            range.location = 4;
            bString = [cString substringWithRange:range];
        }
        
        // Scan values
        unsigned int a, r, g, b;
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:((float) a / 255.0f)];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return [UIColor clearColor];
}

/**
 *  <#Description#>
 *
 *  @param hexColor <#hexColor description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)colorWithHex:(long)hexColor;
{
    return [self colorWithHex:hexColor alpha:1.];
}

/**
 *  <#Description#>
 *
 *  @param hexColor <#hexColor description#>
 *  @param opacity  <#opacity description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

/**
 *  <#Description#>
 *
 *  @param value <#value description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)lengthUnitFormat:(NSInteger)value
{
    if (value >= 1000*10000)
    {
        return [NSString stringWithFormat:@"%0.2fwkm", (float)value/1000.0/10000.0];
    }
    
    if (value >= 1000)
    {
        return [NSString stringWithFormat:@"%0.2fkm", (float)value/1000.0];
    }
    
    if (value > 0)
    {
        return [NSString stringWithFormat:@"%ldm", (long)value];
    }
    
    return @"0m";
}
@end
