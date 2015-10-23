//
//  SkinControllerConter.h
//  XinLing
//
//  Created by 利 韩 on 14/12/9.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkinObject.h"
#import "SkinDelegate.h"


@interface SkinControllerCenter : NSObject{
    //这个类包含该接口
    id<SkinDelegate> _skinDelegate;
    NSMutableArray* _arrayDelegate;
    
    
}

+ (SkinControllerCenter*)sharedInstance;

//接口变量delegate作为类SkinControllerCenter的属性
@property (nonatomic, retain) id             skinDelegate;
@property (nonatomic, retain) NSMutableArray * arrayDelegate;
@property (nonatomic, strong) UIColor        *defaultBgColor;
@property (nonatomic, strong) NSString       *defaultBgImage;
@property (nonatomic, strong) UIColor        *defaultFgColor;
@property (nonatomic, strong) NSString       *defaultFgImage;
@property (nonatomic, strong) UIColor        *defaultFontColor;

- (void)addDelegate:(id)delegate isOnlyExist:(BOOL)isOnly;

- (void)removeDelegate:(id)delegate;

- (SkinObject*)getCurrentSkinObject;

- (void)updateSkinBackgroundColor:(UIColor*)bgColor;

- (void)updateSkinBackgroundImage:(NSString*)imageName;

- (void)updateSkinForegroundColor:(UIColor*)bgColor;

- (void)updateSkinForegroundImage:(NSString*)imageName;

- (void)updateSkinFontColor:(UIColor*)bgColor;

- (void)setDefaultBackgroundColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

- (UIColor*)loadSkinBackgroundColor;

- (void)saveSkinBackgroundColor:(UIColor*)colorValue;

- (void)setDefaultBackgroundImageWithString:(NSString*)imageName;

- (NSString*)loadSkinBackgroundImage;

- (void)saveSkinBackgroundImage:(NSString*)bgImage;

- (void)setDefaultForegroundColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

- (UIColor*)loadSkinForegroundColor;

- (void)saveSkinForegroundColor:(UIColor*)colorValue;

- (void)setDefaultForegroundImageWithString:(NSString*)imageName;

- (NSString*)loadSkinForegroundImage;

- (void)saveSkinForegroundImage:(NSString*)bgImage;

- (void)setDefaultFontColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

- (UIColor*)loadSkinFontColor;

- (void)saveSkinFontColor:(UIColor*)colorValue;

@end
