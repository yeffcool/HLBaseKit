//
//  UIKeyBoard.h
//  iMiao
//
//  Created by 利 韩 on 15/7/13.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIKeyBoard : NSObject

+ (void)addKeyBoardRightTopButton:(UITextField *)textField title:(NSString*)textTitle;

+ (void)addKeyBoardRightTopButton:(UITextField *)textField frameToolbar:(CGRect)rectToolbar frameButton:(CGRect)rectButton title:(NSString*)textTitle;

+ (void)addKeyBoardRightTopButton:(UITextField *)textField frameToolbar:(CGRect)rectToolbar button:(UIButton*)buttonRightTop title:(NSString*)textTitle;

+ (void)addKeyBoardRightTopButtonTextView:(UITextView *)textView title:(NSString*)textTitle;

+ (void)addKeyBoardRightTopButtonTextView:(UITextView *)textView frameToolbar:(CGRect)rectToolbar frameButton:(CGRect)rectButton title:(NSString*)textTitle;

+ (void)addKeyBoardRightTopButtonTextView:(UITextView *)textView frameToolbar:(CGRect)rectToolbar button:(UIButton*)buttonRightTop title:(NSString*)textTitle;
@end
