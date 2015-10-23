//
//  UIBaseViewController.m
//  XinLing
//
//  Created by 利 韩 on 14/12/9.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import "UIBaseViewController.h"

@interface UIBaseViewController ()

@end

@implementation UIBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    return [super init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    SkinObject *skinObject = [[SkinControllerCenter sharedInstance] getCurrentSkinObject];
    if (self.navigationController != nil && self.navigationController.navigationBar != nil)
    {
        UIImage *imageBackground = [UIImage imageNamed:@"image_transparent"];
        [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
        [self.navigationController.navigationBar setBackgroundImage:imageBackground forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setTranslucent:YES];
        
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        
        [self.navigationController.navigationBar setBarTintColor:[self updateNavigationBarTintColor:self.navigationController.navigationBar]];
        
        [self.navigationController.navigationBar setTitleTextAttributes:[self updateNavigationBarTitleTextAttributes:self.navigationController.navigationBar]];
        
        [self updateNavigationBar:self.navigationController.navigationBar];
    }
    
    
    // Do any additional setup after loading the view.// Navigation
    [[SkinControllerCenter sharedInstance] addDelegate:self isOnlyExist:YES];
    
    //
    [self registerForKeyboardNotifications];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 初始化皮肤
    SkinObject *skinObject = [[SkinControllerCenter sharedInstance] getCurrentSkinObject];
    if (skinObject != nil)
    {
        [self updateViewControllerSkin:skinObject];
    }
    
//    NSString *strClassName = [NSString stringWithFormat:@"%@", self.class];
//    [MobClick beginLogPageView:strClassName];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    NSString *strClassName = [NSString stringWithFormat:@"%@", self.class];
//    [MobClick endLogPageView:strClassName];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
//    [[SkinControllerCenter sharedInstance] removeDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [[SkinControllerCenter sharedInstance] removeDelegate:self];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)updateViewControllerSkin:(SkinObject*)skinObject
{
    [self.view setBackgroundColor:skinObject.backgroundColor];
}

- (void)updateNavigationBar:(UINavigationBar*)navigationBar
{
    
}

- (UIColor*)updateNavigationTintColor:(UINavigationBar*)navigationBar
{
    return [UIColor whiteColor];
}

- (UIColor*)updateNavigationBarTintColor:(UINavigationBar*)navigationBar
{
    SkinObject *skinObject = [[SkinControllerCenter sharedInstance] getCurrentSkinObject];
    return skinObject.backgroundColor;
}

- (NSDictionary*)updateNavigationBarTitleTextAttributes:(UINavigationBar*)navigationBar
{
    return @{NSFontAttributeName:[self updateNavigationBarTitleTextFont:navigationBar], NSForegroundColorAttributeName:[self updateNavigationBarTitleTextColor:navigationBar]};
}

- (UIFont*)updateNavigationBarTitleTextFont:(UINavigationBar*)navigationBar
{
    return [UIFont boldSystemFontOfSize:[self updateNavigationBarTitleTextFontSize:navigationBar]];
}

- (CGFloat)updateNavigationBarTitleTextFontSize:(UINavigationBar*)navigationBar
{
    return 19;
}

- (UIColor*)updateNavigationBarTitleTextColor:(UINavigationBar*)navigationBar
{
    return [UIColor whiteColor];
}


- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];  ;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)notification
{
    if (notification == nil)
    {
        return ;
    }
        
    NSDictionary *dictionaryUserInfo = [notification userInfo];
    if (dictionaryUserInfo == nil)
    {
        return ;
    }
    NSValue *valueKeyBoardFrame = [dictionaryUserInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    if (valueKeyBoardFrame == nil)
    {
        return ;
    }
    CGSize keyboardSizeTemp = [valueKeyBoardFrame CGRectValue].size;
    keyboardSize.width = keyboardSizeTemp.width;
    keyboardSize.height = keyboardSizeTemp.height;
    
    isKeyBoardShowed = YES;
}
- (void) keyboardWasHidden:(NSNotification*)notification
{
    if (notification == nil)
    {
        return ;
    }
    
    NSDictionary *dictionaryUserInfo = [notification userInfo];
    if (dictionaryUserInfo == nil)
    {
        return ;
    }
    NSValue *valueKeyBoardFrame = [dictionaryUserInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    if (valueKeyBoardFrame == nil)
    {
        return ;
    }
    CGSize keyboardSizeTemp = [valueKeyBoardFrame CGRectValue].size;
    keyboardSize.width = keyboardSizeTemp.width;
    keyboardSize.height = keyboardSizeTemp.height;
    
    isKeyBoardShowed = NO;
}

@end
