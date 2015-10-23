//
//  SkinControllerConter.m
//  XinLing
//
//  Created by 利 韩 on 14/12/9.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import "SkinControllerCenter.h"

@implementation SkinControllerCenter

@synthesize skinDelegate = _skinDelegate;
@synthesize arrayDelegate = _arrayDelegate;

static SkinControllerCenter * sharedSingleton = nil;

+ (SkinControllerCenter*) sharedInstance
{
    if (sharedSingleton == nil) {
        sharedSingleton = [[SkinControllerCenter alloc] initControllerCenter];
    }
    return sharedSingleton;
}

- (id)initControllerCenter
{
    self = [super init];
    self.arrayDelegate = [[NSMutableArray alloc] init];
    [self setDefaultBackgroundColorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:255.0/255.0];
    [self setDefaultBackgroundImageWithString:@""];
    [self setDefaultForegroundColorWithRed:33.0/255.0 green:41.0/255.0 blue:44.0/255.0 alpha:255.0/255.0];
    [self setDefaultForegroundImageWithString:@""];
    [self setDefaultFontColorWithRed:249.0/255.0 green:82.0/255.0 blue:54.0/255.0 alpha:255.0/255.0];
    return self;
}

- (void)addDelegate:(id)delegate isOnlyExist:(BOOL)isOnly
{
    if(delegate != nil && NSNotFound == [self.arrayDelegate indexOfObject:delegate])
    {
        if (isOnly == YES && self.arrayDelegate != nil && [self.arrayDelegate count] > 0)
        {
            NSMutableArray *arrayRemoveElements = [[NSMutableArray alloc] init];
            for (int i=0; i<[self.arrayDelegate count]; i++)
            {
                id delegateObject = [self.arrayDelegate objectAtIndex:i];
                if (delegateObject != nil && [delegateObject isKindOfClass:[delegate class]])
                {
                    [arrayRemoveElements addObject:delegateObject];
                }
            }
            
            for (int j=0; j < [arrayRemoveElements count]; j++)
            {
                id delegateObject = [arrayRemoveElements objectAtIndex:j];
                if (delegateObject != nil)
                {
                    [self removeDelegate:delegateObject];
                }
            }
        }
        
        [self.arrayDelegate addObject:delegate];
    }
}

- (void)removeDelegate:(id)delegate
{
    if(NSNotFound != [self.arrayDelegate indexOfObject:delegate])
    {
        [self.arrayDelegate removeObject:delegate];
    }
}

- (SkinObject*)getCurrentSkinObject
{
    SkinObject *skinObject = [[SkinObject alloc] init];
    skinObject.backgroundColor = [self loadSkinBackgroundColor];
    skinObject.backgroundImage = [self loadSkinBackgroundImage];
    skinObject.foregroundColor = [self loadSkinForegroundColor];
    skinObject.foregroundImage = [self loadSkinForegroundImage];
    skinObject.fontColor = [self loadSkinFontColor];
    
    return skinObject;
}

- (void)updateSkinBackgroundColor:(UIColor*)bgColor
{
    [self saveSkinBackgroundColor:bgColor];
    
    SkinObject *skinObject = [self getCurrentSkinObject];
    for (int i=0; i<[self.arrayDelegate count]; i++)
    {
        @try
        {
            [[self.arrayDelegate objectAtIndex:i] updateViewControllerSkin:skinObject];
        }
        @catch (NSException *exception)
        {
            //
        }
        @finally
        {
            //
        }
    }
}

- (void)updateSkinBackgroundImage:(NSString*)imageName
{
    [self saveSkinBackgroundImage:imageName];
    
    SkinObject *skinObject = [self getCurrentSkinObject];
    for (int i=0; i<[self.arrayDelegate count]; i++)
    {
        @try {
            [[self.arrayDelegate objectAtIndex:i] updateViewControllerSkin:skinObject];
        }
        @catch (NSException *exception) {
            //
        }
        @finally {
            //
        }
    }
}

- (void)updateSkinForegroundColor:(UIColor*)bgColor
{
    [self saveSkinForegroundColor:bgColor];
    
    SkinObject *skinObject = [self getCurrentSkinObject];
    for (int i=0; i<[self.arrayDelegate count]; i++)
    {
        @try {
            [[self.arrayDelegate objectAtIndex:i] updateViewControllerSkin:skinObject];
        }
        @catch (NSException *exception) {
            //
        }
        @finally {
            //
        }
    }
}

- (void)updateSkinForegroundImage:(NSString*)imageName
{
    [self saveSkinForegroundImage:imageName];
    
    SkinObject *skinObject = [self getCurrentSkinObject];
    for (int i=0; i<[self.arrayDelegate count]; i++)
    {
        @try {
            [[self.arrayDelegate objectAtIndex:i] updateViewControllerSkin:skinObject];
        }
        @catch (NSException *exception) {
            //
        }
        @finally {
            //
        }
    }
}

- (void)updateSkinFontColor:(UIColor*)bgColor
{
    [self saveSkinFontColor:bgColor];
    
    SkinObject *skinObject = [self getCurrentSkinObject];
    for (int i=0; i<[self.arrayDelegate count]; i++)
    {
        @try {
            [[self.arrayDelegate objectAtIndex:i] updateViewControllerSkin:skinObject];
        }
        @catch (NSException *exception) {
            //
        }
        @finally {
            //
        }
    }
}

- (void)setDefaultBackgroundColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    self.defaultBgColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor*)loadSkinBackgroundColor
{
    UIColor *colorBg = self.defaultBgColor;
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            if ([userDefaults objectForKey:@"Skin_Bg_Color_R"] != nil)
            {
                CGFloat colorR = [userDefaults floatForKey:@"Skin_Bg_Color_R"];
                CGFloat colorG = [userDefaults floatForKey:@"Skin_Bg_Color_G"];
                CGFloat colorB = [userDefaults floatForKey:@"Skin_Bg_Color_B"];
                CGFloat colorA = [userDefaults floatForKey:@"Skin_Bg_Color_A"];
                colorBg = [UIColor colorWithRed:colorR green:colorG blue:colorB alpha:colorA];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return colorBg;
}

- (void)saveSkinBackgroundColor:(UIColor*)colorValue
{
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            CGColorRef color = [colorValue CGColor];
            size_t numComponents = CGColorGetNumberOfComponents(color);
            if (numComponents >= 3)
            {
                const CGFloat *tmComponents = CGColorGetComponents(color);
                [userDefaults setFloat:tmComponents[0] forKey:@"Skin_Bg_Color_R"];
                [userDefaults setFloat:tmComponents[1] forKey:@"Skin_Bg_Color_G"];
                [userDefaults setFloat:tmComponents[2] forKey:@"Skin_Bg_Color_B"];
                [userDefaults setFloat:tmComponents[3] forKey:@"Skin_Bg_Color_A"];
                [userDefaults synchronize];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"当前皮肤类型失败");
    }
    @finally {
        
    }
}

- (void)setDefaultBackgroundImageWithString:(NSString*)imageName
{
    self.defaultBgImage = imageName;
}

- (NSString*)loadSkinBackgroundImage
{
    NSString *strBgImage = self.defaultBgImage;
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            if ([userDefaults objectForKey:@"Skin_Bg_Image"] != nil)
            {
                strBgImage = [userDefaults stringForKey:@"Skin_Bg_Image"];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return strBgImage;
}

- (void)saveSkinBackgroundImage:(NSString*)bgImage
{
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            [userDefaults setValue:bgImage forKey:@"Skin_Bg_Image"];
            [userDefaults synchronize];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"当前皮肤类型失败");
    }
    @finally {
        
    }
}

- (void)setDefaultForegroundColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    self.defaultFgColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor*)loadSkinForegroundColor
{
    UIColor *colorFg = self.defaultFgColor;
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            if ([userDefaults objectForKey:@"Skin_Fg_Color_R"] != nil)
            {
                CGFloat colorR = [userDefaults floatForKey:@"Skin_Fg_Color_R"];
                CGFloat colorG = [userDefaults floatForKey:@"Skin_Fg_Color_G"];
                CGFloat colorB = [userDefaults floatForKey:@"Skin_Fg_Color_B"];
                CGFloat colorA = [userDefaults floatForKey:@"Skin_Fg_Color_A"];
                colorFg = [UIColor colorWithRed:colorR green:colorG blue:colorB alpha:colorA];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return colorFg;
}

- (void)saveSkinForegroundColor:(UIColor*)colorValue
{
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            CGColorRef color = [colorValue CGColor];
            size_t numComponents = CGColorGetNumberOfComponents(color);
            if (numComponents >= 3)
            {
                const CGFloat *tmComponents = CGColorGetComponents(color);
                [userDefaults setFloat:tmComponents[0] forKey:@"Skin_Fg_Color_R"];
                [userDefaults setFloat:tmComponents[1] forKey:@"Skin_Fg_Color_G"];
                [userDefaults setFloat:tmComponents[2] forKey:@"Skin_Fg_Color_B"];
                [userDefaults setFloat:tmComponents[3] forKey:@"Skin_Fg_Color_A"];
                [userDefaults synchronize];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"当前皮肤类型失败");
    }
    @finally {
        
    }
}

- (void)setDefaultForegroundImageWithString:(NSString*)imageName
{
    self.defaultFgImage = imageName;
}

- (NSString*)loadSkinForegroundImage
{
    NSString *strFgImage = self.defaultFgImage;
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            if ([userDefaults objectForKey:@"Skin_Fg_Image"] != nil)
            {
                strFgImage = [userDefaults stringForKey:@"Skin_Fg_Image"];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return strFgImage;
}

- (void)saveSkinForegroundImage:(NSString*)bgImage
{
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            [userDefaults setValue:bgImage forKey:@"Skin_Fg_Image"];
            [userDefaults synchronize];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"当前皮肤类型失败");
    }
    @finally {
        
    }
}

- (void)setDefaultFontColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    self.defaultFontColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor*)loadSkinFontColor
{
    UIColor *colorFont = self.defaultFontColor;
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            if ([userDefaults objectForKey:@"Skin_Font_Color_R"] != nil)
            {
                CGFloat colorR = [userDefaults floatForKey:@"Skin_Font_Color_R"];
                CGFloat colorG = [userDefaults floatForKey:@"Skin_Font_Color_G"];
                CGFloat colorB = [userDefaults floatForKey:@"Skin_Font_Color_B"];
                CGFloat colorA = [userDefaults floatForKey:@"Skin_Font_Color_A"];
                colorFont = [UIColor colorWithRed:colorR green:colorG blue:colorB alpha:colorA];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return colorFont;
}

- (void)saveSkinFontColor:(UIColor*)colorValue
{
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if (userDefaults != nil)
        {
            CGColorRef color = [colorValue CGColor];
            size_t numComponents = CGColorGetNumberOfComponents(color);
            if (numComponents >= 3)
            {
                const CGFloat *tmComponents = CGColorGetComponents(color);
                [userDefaults setFloat:tmComponents[0] forKey:@"Skin_Font_Color_R"];
                [userDefaults setFloat:tmComponents[1] forKey:@"Skin_Font_Color_G"];
                [userDefaults setFloat:tmComponents[2] forKey:@"Skin_Font_Color_B"];
                [userDefaults setFloat:tmComponents[3] forKey:@"Skin_Font_Color_A"];
                [userDefaults synchronize];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"当前皮肤类型失败");
    }
    @finally {
        
    }
}

@end
