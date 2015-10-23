//
//  ClassOperation.h
//  XinLing
//
//  Created by 利 韩 on 15/1/26.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassUtils : NSObject

/////////////////////////////////////////////////////////////////////////////////////////////
// 获取对象的所有属性，不包括属性值
+ (NSArray *)getAllProperties:(id)target;

/////////////////////////////////////////////////////////////////////////////////////////////
// 获取对象的所有属性 以及属性值
+ (NSDictionary *)getPropertiesAps:(id)target;

/////////////////////////////////////////////////////////////////////////////////////////////
// 获取对象的所有方法
+ (void)getMothedList:(id)target;

@end