//
//  UITableView+Line.h
//  TourGuide
//
//  Created by 利 韩 on 15/9/7.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, kCALayer_Border) {
    CALayer_Border_None                     = 0,
    CALayer_Border_Left                     = 1 << 0,
    CALayer_Border_Right                    = 1 << 1,
    CALayer_Border_Top                      = 1 << 2,
    CALayer_Border_Bottom                   = 1 << 3
};

@interface UIView(Border)

@property (nonatomic, copy) CALayer *layerBorderLeft;
@property (nonatomic, copy) CALayer *layerBorderRight;
@property (nonatomic, copy) CALayer *layerBorderTop;
@property (nonatomic, copy) CALayer *layerBorderBottom;

- (void)showBorder:(kCALayer_Border)lineEdge lineWidth:(CGFloat)lineWidth colorLine:(UIColor*)colorLine;

- (void)hideBorder:(kCALayer_Border)lineEdge;

- (void)setCornerRadius:(CGFloat)radius;

- (void)setBorderWidth:(CGFloat)width borderColor:(UIColor*)borderColor;

@end
