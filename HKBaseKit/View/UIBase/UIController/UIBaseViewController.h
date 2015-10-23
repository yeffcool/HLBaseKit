//
//  UIBaseViewController.h
//  XinLing
//
//  Created by 利 韩 on 14/12/9.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkinControllerCenter.h"

@interface UIBaseViewController : UIViewController<SkinDelegate>
{
    CGSize keyboardSize;
    
    BOOL isKeyBoardShowed;
}

- (void)updateViewControllerSkin:(SkinObject*)skinObject;

- (void)updateNavigationBar:(UINavigationBar*)navigationBar;
- (UIColor*)updateNavigationTintColor:(UINavigationBar*)navigationBar;
- (UIColor*)updateNavigationBarTintColor:(UINavigationBar*)navigationBar;
- (NSDictionary*)updateNavigationBarTitleTextAttributes:(UINavigationBar*)navigationBar;
- (UIFont*)updateNavigationBarTitleTextFont:(UINavigationBar*)navigationBar;
- (CGFloat)updateNavigationBarTitleTextFontSize:(UINavigationBar*)navigationBar;
- (UIColor*)updateNavigationBarTitleTextColor:(UINavigationBar*)navigationBar;

- (void)keyboardWasShown:(NSNotification*)notification;
- (void)keyboardWasHidden:(NSNotification*)notification;

@end
