//
//  UIKeyBoard.m
//  iMiao
//
//  Created by 利 韩 on 15/7/13.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "UIKeyBoard.h"
#import "UIButton+Block.h"

@implementation UIKeyBoard

#define Height_Default_Toolbar                  38
#define Width_Default_Button                    60



+ (void)addKeyBoardRightTopButton:(UITextField *)textField title:(NSString*)textTitle
{
    [self addKeyBoardRightTopButton:textField frameToolbar:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_Default_Toolbar) frameButton:CGRectMake(0, 0, Width_Default_Button, Height_Default_Toolbar) title:textTitle];
}


+ (void)addKeyBoardRightTopButton:(UITextField *)textField frameToolbar:(CGRect)rectToolbar frameButton:(CGRect)rectButton title:(NSString*)textTitle
{
    UIButton *buttonPackUp = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPackUp.frame = rectButton;
//    [buttonPackUp addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
//    [buttonPackUp setImage:[UIImage imageNamed:@"shouqi"] forState:UIControlStateNormal];
//    [buttonPackUp setBackgroundColor:[UIColor redColor]];
    [buttonPackUp setTitle:textTitle forState:UIControlStateNormal];
    [buttonPackUp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonPackUp addAction:^(UIButton *btn) {
        [textField resignFirstResponder];
    }];
    
    [self addKeyBoardRightTopButton:textField frameToolbar:rectToolbar button:buttonPackUp title:textTitle];
}

+ (void)addKeyBoardRightTopButton:(UITextField *)textField frameToolbar:(CGRect)rectToolbar button:(UIButton*)buttonRightTop title:(NSString*)textTitle
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:rectToolbar];
    [topView setBarStyle:UIBarStyleDefault];
    
    UIBarButtonItem *buttonSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithCustomView:buttonRightTop];
    NSArray * buttonsArray = [NSArray arrayWithObjects:buttonSpace, doneBtn, nil];
    [topView setItems:buttonsArray];
    [textField setInputAccessoryView:topView];
}

+ (void)addKeyBoardRightTopButtonTextView:(UITextView *)textView title:(NSString*)textTitle
{
    [self addKeyBoardRightTopButtonTextView:textView frameToolbar:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_Default_Toolbar) frameButton:CGRectMake(0, 0, Width_Default_Button, Height_Default_Toolbar) title:textTitle];
}


+ (void)addKeyBoardRightTopButtonTextView:(UITextView *)textView frameToolbar:(CGRect)rectToolbar frameButton:(CGRect)rectButton title:(NSString*)textTitle
{
    UIButton *buttonPackUp = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPackUp.frame = rectButton;
    //    [buttonPackUp addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    //    [buttonPackUp setImage:[UIImage imageNamed:@"shouqi"] forState:UIControlStateNormal];
    //    [buttonPackUp setBackgroundColor:[UIColor redColor]];
    [buttonPackUp setTitle:textTitle forState:UIControlStateNormal];
    [buttonPackUp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonPackUp addAction:^(UIButton *btn) {
        [textView resignFirstResponder];
    }];
    
    [self addKeyBoardRightTopButtonTextView:textView frameToolbar:rectToolbar button:buttonPackUp title:textTitle];
}

+ (void)addKeyBoardRightTopButtonTextView:(UITextView *)textView frameToolbar:(CGRect)rectToolbar button:(UIButton*)buttonRightTop title:(NSString*)textTitle
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:rectToolbar];
    [topView setBarStyle:UIBarStyleDefault];
    
    UIBarButtonItem *buttonSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithCustomView:buttonRightTop];
    NSArray * buttonsArray = [NSArray arrayWithObjects:buttonSpace, doneBtn, nil];
    [topView setItems:buttonsArray];
    [textView setInputAccessoryView:topView];
}

@end
