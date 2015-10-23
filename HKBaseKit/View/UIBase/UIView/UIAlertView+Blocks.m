//
//  UIAlertView+Blocks.m
//  iMiao
//
//  Created by 利 韩 on 15/7/8.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "UIAlertView+Blocks.h"

static DismissBlock _dismissBlock;
static CancelBlock _cancelBlock;

@implementation UIAlertView (Blocks)

+ (UIAlertView*) showAlertViewWithTitle:(NSString*) title
                                message:(NSString*) message
                      cancelButtonTitle:(NSString*) cancelButtonTitle
                      otherButtonTitles:(NSArray*) otherButtons
                              onDismiss:(DismissBlock) dismissed
                               onCancel:(CancelBlock) cancelled {
    if (cancelled != nil)
    {
        _cancelBlock  = [cancelled copy];
    }
    else
    {
        _cancelBlock  = nil;
    }
    
    if (dismissed != nil)
    {
        _dismissBlock  = [dismissed copy];
    }
    else
    {
        _dismissBlock  = nil;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[self self]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtons)
        [alert addButtonWithTitle:buttonTitle];
    
    [alert show];
    return alert;
}

+ (void)alertView:(UIAlertView*) alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
    
    if(buttonIndex == [alertView cancelButtonIndex])
    {
        if (_cancelBlock != nil)
        {
            _cancelBlock();
        }
    }
    else
    {
        if (_dismissBlock != nil)
        {
            _dismissBlock(buttonIndex - 1); // cancel button is button 0
        }
    }  
}


@end