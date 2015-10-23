//
//  UIBaseStoryboard.h
//  XinLing
//
//  Created by 利 韩 on 14/12/10.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBaseStoryboard : NSObject

+ (id)loadControllerWithIdName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil identifier:(NSString *)identifier;

+ (id)loadControllerWithNib:(NSString *)className nameNib:(NSString *)nibname;

@end
