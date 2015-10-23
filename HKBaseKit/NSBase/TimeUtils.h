//
//  TimeProcess.h
//  XinLing
//
//  Created by 利 韩 on 14/12/13.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject

+ (NSString *)GetCurrentTime:(NSString*)format;

+ (NSString *)GetCurrentTime;

+ (NSTimeInterval)GetCurrentTimeInterval;

@end
