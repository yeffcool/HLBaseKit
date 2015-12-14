//
//  CustomTabBarControllerViewController.h
//  CustomTabBarController
//
//  Created by Levey Zhu on 12/15/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBaseController.h"
#import "UIBaseTabBarView.h"

@protocol CustomTabBarControllerDelegate;
@interface UIBaseCustomTabBarController : UIBaseViewController <UIBaseTabBarViewDelegate>
{
    __weak id<CustomTabBarControllerDelegate> _delegate;
	UIBaseTabBarView *_uiBaseTabBarView;
	UIView      *_containerView;
	UIView		*_transitionView;
	NSMutableArray *_viewControllers;
	NSUInteger _selectedIndex;
	
	BOOL _tabBarTransparent;
	BOOL _tabBarHidden;
}

@property(nonatomic, copy) NSMutableArray *viewControllers;
@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic) NSUInteger selectedIndex;

// Apple is readonly
@property (nonatomic, readonly) UIBaseTabBarView *uiBaseTabBarView;
@property(weak) id<CustomTabBarControllerDelegate> delegate;


// Default is NO, if set to YES, content will under tabbar
@property (nonatomic) BOOL tabBarTransparent;
@property (nonatomic) BOOL tabBarHidden;

- (void)initWithViewControllers:(NSArray *)arrayViewControllers itemDatas:(NSArray *)arrayItemDatas;

- (NSUInteger)getTabBarHeight;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;

- (UIViewController*)selectedViewController;

-(void)setSelectedIndex:(NSUInteger)index;

// Remove the viewcontroller at index of viewControllers.
- (void)removeViewControllerAtIndex:(NSUInteger)index;

// Insert an viewcontroller at index of viewControllers.
- (void)insertViewController:(UIViewController*)viewController withImageDic:(DatasTabBarItem*)datasTabBarItem atIndex:(NSUInteger)index;
@end


@protocol CustomTabBarControllerDelegate <NSObject>
@optional
- (BOOL)tabBarController:(UIBaseCustomTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(UIBaseCustomTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end

@interface UIViewController (CustomTabBarControllerSupport)
@property(nonatomic, retain, readonly) UIBaseCustomTabBarController *customTabBarController;
@end

