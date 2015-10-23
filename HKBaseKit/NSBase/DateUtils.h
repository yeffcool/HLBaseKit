//
//  DateUtils.h
//  iMiao
//
//  Created by 利 韩 on 15/8/21.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateUtils : NSObject

+ (NSDate*)stringFormatToDate:(NSString*)strFormat time:(NSString*)strDate;

+ (NSString*)dateToFormatString:(NSString*)strFormat date:(NSDate*)dateObject;

+ (NSString*)distanceNowTimeString:(NSTimeInterval)timeInterval;

@end
