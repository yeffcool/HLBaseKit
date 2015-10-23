//
//  ClassOperation.m
//  XinLing
//
//  Created by 利 韩 on 15/1/26.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "ClassOperation.h"
#import <objc/runtime.h>

@implementation ClassOperation

/////////////////////////////////////////////////////////////////////////////////////////////
// 获取对象的所有属性，不包括属性值
+ (NSArray*)getAllProperties:(id)target
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([target class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}

/////////////////////////////////////////////////////////////////////////////////////////////
// 获取对象的所有属性 以及属性值
+ (NSDictionary*)getPropertiesAps:(id)target
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([target class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [target valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

/////////////////////////////////////////////////////////////////////////////////////////////
// 获取对象的所有方法
+ (void)getMothedList:(id)target
{
    unsigned int mothCout_f =0;
    Method* mothList_f = class_copyMethodList([target class], &mothCout_f);
    for(int i=0;i<mothCout_f;i++)
    {
        Method temp_f = mothList_f[i];
//        IMP imp_f = method_getImplementation(temp_f);
//        SEL name_f = method_getName(temp_f);
        const char* name_s =sel_getName(method_getName(temp_f));
        int arguments = method_getNumberOfArguments(temp_f);
        const char* encoding =method_getTypeEncoding(temp_f);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,[NSString stringWithUTF8String:encoding]);
    }
    free(mothList_f);
}

@end
