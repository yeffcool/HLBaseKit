//
//  ConvertObject.h
//  XinLing
//
//  Created by 利 韩 on 14/12/13.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConvertObject : NSObject

+ (NSDate*)convertStringToDate:(NSString*)strFormat time:(NSString*)strDate;

+ (NSString*)convertDateToString:(NSString*)strFormat date:(NSDate*)dateObject;

+ (NSString*) convertDataToStringUTF8:(NSData*)data;

+ (NSString*) convertDataToStringGB2312:(NSData*)data;

+ (NSData*) convertStringUTF8ToData:(NSString*)string;

+ (NSData*)convertIdToJsonData:(id)obj;

+ (NSString*)convertIdToJsonString:(id)obj;

+ (NSString*) convertIdToString:(id)object;

+ (int)convertStringToInt:(id)object;

+ (long)convertStringToLong:(id)object;

+ (int)convertStringToFloat:(id)object;

+ (double)convertStringToDouble:(id)object;

+ (BOOL)convertStringToBool:(id)object;

+ (int)convertIdToInt:(id)object;

+ (long)convertIdToLong:(id)object;

+ (float)convertIdToFloat:(id)object;

+ (BOOL)convertIdToBool:(id)object;

+ (NSDictionary*) convertIdToDictionary:(id)object;

+ (NSMutableArray*) convertIdToArray:(id)object;

+ (int) getValueIntFromDictionary:(NSDictionary*)object keyField:(NSString*)key;

+ (BOOL) getValueBoolFromDictionary:(NSDictionary*)object keyField:(NSString*)key;


+ (NSDictionary*) getValueDictionaryFromDictionary:(NSDictionary*)object keyField:(NSString*)key;

+ (NSMutableArray*) getValueArrayFromDictionary:(NSDictionary*)object keyField:(NSString*)key;

+ (NSDictionary*) getValueFirstDictionaryFromDictionary:(NSDictionary*)object keyField:(NSString*)key;


+ (BOOL)isPureInt:(NSString *)string;

+ (BOOL)isPureInteger:(NSString *)string;

+ (BOOL)isPureLongLong:(NSString *)string;

+ (NSString*)unicodeDecode:(NSString *)unicodeStr;

+ (NSString*)unicodeEncode:(NSString *)string;


+ (NSUInteger)calcAgeWithDate:(NSDate*)dateBirth;

/**
 *  <#Description#>
 *
 *  @param dateBirth <#dateBirth description#>
 *
 *  @return <#return value description#>
 */
+ (NSUInteger)calcConstellationWithDate:(NSDate*)dateBirth;

/**
 *  <#Description#>
 *
 *  @param month <#month description#>
 *  @param day   <#day description#>
 *
 *  @return <#return value description#>
 */
+ (NSUInteger)calcConstellationValueWithMonth:(NSInteger)month day:(NSInteger)day;

/**
 *  <#Description#>
 *
 *  @param constellation <#constellation description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)calcConstellationCN:(NSInteger)constellation;

/**
 *  <#Description#>
 *
 *  @param constellation <#constellation description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)calcConstellationEN:(NSInteger)constellation;

/**
 *  <#Description#>
 *
 *  @param colorValue <#colorValue description#>
 *  @param plusValue  <#plusValue description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)calcColor:(UIColor*)colorValue plus:(NSInteger)plusValue;

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
+ (UIColor*)calcColor:(UIColor*)colorValue plusR:(NSInteger)plusRValue plusg:(NSInteger)plusGValue plusB:(NSInteger)plusBValue plusA:(NSInteger)plusAValue;

/**
 *  <#Description#>
 *
 *  @param strHexColor <#strHexColor description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)convertStringToColor:(NSString*)strHexColor;

/**
 *  <#Description#>
 *
 *  @param hexColor <#hexColor description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)colorWithHex:(long)hexColor;;

/**
 *  <#Description#>
 *
 *  @param hexColor <#hexColor description#>
 *  @param opacity  <#opacity description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor*)colorWithHex:(long)hexColor alpha:(float)opacity;

/**
 *  <#Description#>
 *
 *  @param value <#value description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)lengthUnitFormat:(NSInteger)value;

@end
