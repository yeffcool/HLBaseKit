//
//  TimeProcess.m
//  XinLing
//
//  Created by 利 韩 on 14/12/13.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import "TimeUtils.h"

@implementation TimeUtils

+ (NSString *)GetCurrentTime:(NSString*)format
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString* dateTime =[dateFormatter stringFromDate:[NSDate date]];

    return dateTime;
}

+ (NSString *)GetCurrentTime
{
    return [TimeUtils GetCurrentTime:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSTimeInterval)GetCurrentTimeInterval
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* date = [dateFormatter dateFromString:[TimeUtils GetCurrentTime]];
    
    return [date timeIntervalSince1970];
}

@end
