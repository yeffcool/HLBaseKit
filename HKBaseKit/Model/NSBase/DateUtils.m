//
//  DateUtils.m
//  iMiao
//
//  Created by 利 韩 on 15/8/21.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils

+ (NSDate*)stringFormatToDate:(NSString*)strFormat time:(NSString*)strDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormat];
    NSDate *date = [dateFormatter dateFromString:strDate];
    return date;
}

+ (NSString*)dateToFormatString:(NSString*)strFormat date:(NSDate*)dateObject
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormat];
    NSString *strDate = [dateFormatter stringFromDate:dateObject];
    return strDate;
}

+ (NSTimeInterval)distanceNowTimeInterval:(NSTimeInterval)timeInterval
{
    NSTimeInterval nowTimeInterval = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeIntervalDistance = nowTimeInterval - timeInterval;
    return timeIntervalDistance;
}

+ (NSString*)distanceNowTimeString:(NSTimeInterval)timeInterval
{
    NSTimeInterval timeIntervalDistance = [self distanceNowTimeInterval:timeInterval];
    if (timeIntervalDistance <= 0)
    {
        return @"0分钟";
    }
    
    // 大约4天取时间
    if (timeIntervalDistance > 4 * 24 * 60 * 60)
    {
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        return [self dateToFormatString:@"yyyy-MM-dd" date:date];
    }
    // 3天
    if (timeIntervalDistance > 3 * 24 * 60 * 60)
    {
        return @"3天前";
    }
    // 2天
    if (timeIntervalDistance > 2 * 24 * 60 * 60)
    {
        return @"2天前";
    }
    
    // 1天
    if (timeIntervalDistance > 1 * 24 * 60 * 60)
    {
        return @"1天前";
    }
    
    // 小时
    if (timeIntervalDistance > 60 * 60)
    {
        int hour = ceil(timeIntervalDistance / 60 / 60);
        return [NSString stringWithFormat:@"%d小时前", hour];
    }
    
    // 分钟
    if (timeIntervalDistance > 0)
    {
        int minute = ceil(timeIntervalDistance / 60);
        return [NSString stringWithFormat:@"%d分钟前", minute];
    }
    
    return @"0分钟前";
}

@end
