//
//  UIView+Screenshot.m
//  TourGuide
//
//  Created by 利 韩 on 15/10/9.
//  Copyright © 2015年 利 韩. All rights reserved.
//

#import "UIView+Screenshot.h"

@implementation UIView(Screenshot)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIImage *)convertViewToImage:(CGRect)rect
{
//    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0);
//    [self drawViewHierarchyInRect:rect afterScreenUpdates:NO];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
//    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0);
//    [self drawViewHierarchyInRect:rect afterScreenUpdates:NO];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return image;
    
    UIImage* image = nil;
    UIGraphicsBeginImageContext(rect.size);
    {
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}

@end
