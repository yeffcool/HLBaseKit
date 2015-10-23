//
//  ImageProcess.h
//  XinLing
//
//  Created by 利 韩 on 14/12/9.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageUtils : NSObject

+ (UIImage*)initWithColor:(UIColor*)color rect:(CGRect)rect;

+ (UIImage*)addImage:(UIImage *)image1 toImage:(UIImage *)image2;

+ (UIImage*)getColorImage:(UIImage*)img colorValue:(UIColor*)color;

+ (UIImage*)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
@end
