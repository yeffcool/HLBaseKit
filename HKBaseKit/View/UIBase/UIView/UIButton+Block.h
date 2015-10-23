//
//  UIButton+Block.h
//  iMiao
//
//  Created by 利 韩 on 15/7/13.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton* btn);

@interface UIButton (Block)

- (void)addAction:(ButtonBlock)block;
- (void)addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;

@end