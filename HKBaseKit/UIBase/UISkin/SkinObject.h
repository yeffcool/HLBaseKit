//
//  SkinObject.h
//  XinLing
//
//  Created by 利 韩 on 14/12/9.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SkinObject : NSObject
{
    
}

// background
@property (nonatomic, retain) UIColor* backgroundColor;
@property (nonatomic, retain) NSString* backgroundImage;
// foreground
@property (nonatomic, retain) UIColor* foregroundColor;
@property (nonatomic, retain) NSString* foregroundImage;
// font
@property (nonatomic, retain) UIColor* fontColor;

@end
