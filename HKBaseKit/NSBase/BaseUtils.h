//
//  BaseUtils.h
//  iMiao
//
//  Created by 利 韩 on 15/8/3.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseUtils : NSObject

+ (BOOL)isEmpty:(id)obj;

+ (BOOL)isEmptyString:(id)string;

+ (NSString*)getTrimString:(NSString *)string;

@end
