//
//  BaseUtils.m
//  iMiao
//
//  Created by 利 韩 on 15/8/3.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "BaseUtils.h"

@implementation BaseUtils

+ (BOOL)isEmpty:(id)obj
{
    if(obj == nil)
    {
        return YES;
    }
    return NO;
}

+ (BOOL)isEmptyString:(id)string
{
    if(string == nil)
    {
        return YES;
    }
    if([string isKindOfClass:[NSString class]] == NO)
    {
        return YES;
    }
    if(((NSString*)string).length == 0)
    {
        return YES;
    }
    return [[self getTrimString:string] isEqualToString:@""];
}

+ (NSString*)getTrimString:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
