//
//  UITableView+Line.m
//  TourGuide
//
//  Created by 利 韩 on 15/9/7.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "UIView+Border.h"
#import <objc/runtime.h>

static const void *externKeyBorderLeft          = &externKeyBorderLeft;
static const void *externKeyBorderRight         = &externKeyBorderRight;
static const void *externKeyBorderTop           = &externKeyBorderTop;
static const void *externKeyBorderBottom        = &externKeyBorderBottom;

@implementation UIView(Border)

@dynamic layerBorderLeft;
@dynamic layerBorderRight;
@dynamic layerBorderTop;
@dynamic layerBorderBottom;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
- (id)layerBorderLeft
{
    return objc_getAssociatedObject(self, externKeyBorderLeft);
}
- (void)setLayerBorderLeft:(id)layerBorderLeft
{
    objc_setAssociatedObject(self, externKeyBorderLeft, layerBorderLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)layerBorderRight
{
    return objc_getAssociatedObject(self, externKeyBorderRight);
}
- (void)setLayerBorderRight:(id)layerBorderRight
{
    objc_setAssociatedObject(self, externKeyBorderRight, layerBorderRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)layerBorderTop
{
    return objc_getAssociatedObject(self, externKeyBorderTop);
}
- (void)setLayerBorderTop:(id)layerBorderTop
{
    objc_setAssociatedObject(self, externKeyBorderTop, layerBorderTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)layerBorderBottom
{
    return objc_getAssociatedObject(self, externKeyBorderBottom);
}
- (void)setLayerBorderBottom:(id)layerBorderBottom
{
    objc_setAssociatedObject(self, externKeyBorderBottom, layerBorderBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showBorder:(kCALayer_Border)lineEdge lineWidth:(CGFloat)lineWidth colorLine:(UIColor*)colorLine
{
    if ((lineEdge & CALayer_Border_Left))
    {
        if (self.layerBorderLeft == nil)
        {
            self.layerBorderLeft = [CALayer layer];        }
        if (![self.layer.sublayers containsObject:self.layerBorderLeft])
        {
            [self.layer addSublayer:self.layerBorderLeft];
        }
        float height = self.frame.size.height;
        self.layerBorderLeft.frame = CGRectMake(0.0f, 0.0f, lineWidth, height);
        self.layerBorderLeft.backgroundColor = colorLine.CGColor;
    }
    if ((lineEdge & CALayer_Border_Right))
    {
        if (self.layerBorderRight == nil)
        {
            self.layerBorderRight = [CALayer layer];
        }
        if (![self.layer.sublayers containsObject:self.layerBorderRight])
        {
            [self.layer addSublayer:self.layerBorderRight];
        }
        float height = self.frame.size.height;
        float width = self.frame.size.width - lineWidth;
        self.layerBorderRight.frame = CGRectMake(width, 0.0f, lineWidth, height);
        self.layerBorderRight.backgroundColor = colorLine.CGColor;
    }
    if ((lineEdge & CALayer_Border_Top))
    {
        if (self.layerBorderTop == nil)
        {
            self.layerBorderTop = [CALayer layer];
           
        }
        if (![self.layer.sublayers containsObject:self.layerBorderTop])
        {
            [self.layer addSublayer:self.layerBorderTop];
        }
        float width = self.frame.size.width;
        self.layerBorderTop.frame = CGRectMake(0.0f, 0.0f, width, lineWidth);
        self.layerBorderTop.backgroundColor = colorLine.CGColor;
    }
    if ((lineEdge & CALayer_Border_Bottom))
    {
        if (self.layerBorderBottom == nil)
        {
            self.layerBorderBottom = [CALayer layer];
        }
        if (![self.layer.sublayers containsObject:self.layerBorderBottom])
        {
            [self.layer addSublayer:self.layerBorderBottom];
        }
        float height = self.frame.size.height - lineWidth;
        float width = self.frame.size.width;
        self.layerBorderBottom.frame = CGRectMake(0.0f, height, width, lineWidth);
        self.layerBorderBottom.backgroundColor = colorLine.CGColor;
    }
}

- (void)hideBorder:(kCALayer_Border)lineEdge
{
    if ((lineEdge & CALayer_Border_Left))
    {
        if (self.layerBorderLeft != nil)
        {
            [self.layerBorderLeft removeFromSuperlayer];
        }
    }
    if ((lineEdge & CALayer_Border_Right))
    {
        if (self.layerBorderRight != nil)
        {
            [self.layerBorderRight removeFromSuperlayer];
        }
    }
    if ((lineEdge & CALayer_Border_Top))
    {
        if (self.layerBorderTop != nil)
        {
            [self.layerBorderTop removeFromSuperlayer];
        }
    }
    if ((lineEdge & CALayer_Border_Bottom))
    {
        if (self.layerBorderBottom != nil)
        {
            [self.layerBorderBottom removeFromSuperlayer];
        }
    }
}

- (void)setCornerRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void)setBorderWidth:(CGFloat)width borderColor:(UIColor*)borderColor
{
    self.layer.borderWidth = width;
    self.layer.borderColor = borderColor.CGColor;
}
@end
