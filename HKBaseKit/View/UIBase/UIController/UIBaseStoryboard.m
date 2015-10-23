//
//  UIBaseStoryboard.m
//  XinLing
//
//  Created by 利 韩 on 14/12/10.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import "UIBaseStoryboard.h"
#import "SkinControllerCenter.h"

@implementation UIBaseStoryboard

+ (id)loadControllerWithIdName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil identifier:(NSString *)identifier
{
    UIStoryboard* storyboard = (UIStoryboard*)[UIStoryboard storyboardWithName:name bundle:storyboardBundleOrNil];
    id uiBaseViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
//    if (uiBaseViewController != nil)
//    {
//        if ([uiBaseViewController isKindOfClass:[UIViewController class]])
//        {
//            UIViewController *uiViewController = (UIViewController*)uiBaseViewController;
//            [uiViewController setWantsFullScreenLayout:YES];
//            
//            float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
//            if (systemVersion >= 7.0f)
//            {
//                if ([uiBaseViewController isKindOfClass:[UIViewController class]])
//                {
//                    UIViewController *uiViewController = (UIViewController*)uiBaseViewController;
//                    uiViewController.edgesForExtendedLayout = UIRectEdgeNone;
//                }
//            }
//            else
//            {
//                
//            }
//        }
//    }
    return uiBaseViewController;
}

+ (id)loadControllerWithNib:(NSString *)className nameNib:(NSString *)nibname
{
    //1.通过xib创建控制器
    id uiBaseViewController= [[NSClassFromString(className) alloc] initWithNibName:nibname bundle:nil];
//    if (uiBaseViewController != nil)
//    {
//        if ([uiBaseViewController isKindOfClass:[UIViewController class]])
//        {
//            UIViewController *uiViewController = (UIViewController*)uiBaseViewController;
//            [uiViewController setWantsFullScreenLayout:YES];
//            
//            float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
//            if (systemVersion >= 7.0f)
//            {
//                if ([uiBaseViewController isKindOfClass:[UIViewController class]])
//                {
//                    UIViewController *uiViewController = (UIViewController*)uiBaseViewController;
//                    uiViewController.edgesForExtendedLayout = UIRectEdgeNone;
//                }
//            }
//            else
//            {
//                
//            }
//        }
//    }
    return uiBaseViewController;
}
@end
