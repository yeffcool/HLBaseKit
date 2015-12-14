//
//  CustomTabBarControllerViewController.m
//  CustomTabBarController
//
//  Created by Levey Zhu on 12/15/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import "UIBaseCustomTabBarController.h"
#import "UIBaseTabBarView.h"

#define kTabBarHeight 50

static UIBaseCustomTabBarController *customTabBarController;

@implementation UIViewController (CustomTabBarControllerSupport)

- (UIBaseCustomTabBarController *)customTabBarController
{
	return customTabBarController;
}

@end

@interface UIBaseCustomTabBarController (private)
- (void)displayViewAtIndex:(NSUInteger)index;
@end

@implementation UIBaseCustomTabBarController
@synthesize delegate = _delegate;
@synthesize selectedViewController = _selectedViewController;
@synthesize viewControllers = _viewControllers;
@synthesize selectedIndex = _selectedIndex;
@synthesize tabBarHidden = _tabBarHidden;
@synthesize uiBaseTabBarView = _uiBaseTabBarView;

#pragma mark -
#pragma mark lifecycle
- (void)initWithViewControllers:(NSArray *)arrayViewControllers itemDatas:(NSArray *)arrayItemDatas
{
    _viewControllers = [NSMutableArray arrayWithArray:arrayViewControllers] ;
    
    _containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _containerView.frame.size.width, _containerView.frame.size.height - [self getTabBarHeight])];
    _transitionView.backgroundColor =  [UIColor groupTableViewBackgroundColor];
    
    _uiBaseTabBarView = [[UIBaseTabBarView alloc] initWithFrame:self rectTabBar:CGRectMake(0, _containerView.frame.size.height - [self getTabBarHeight], _containerView.frame.size.width, [self getTabBarHeight]) itemsDatas:arrayItemDatas];
    
    customTabBarController = self;
}

- (void)loadView
{
	[super loadView];
	
	[_containerView addSubview:_transitionView];
	[_containerView addSubview:_uiBaseTabBarView];
	self.view = _containerView;
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
    self.selectedIndex = 0;
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	
	_uiBaseTabBarView = nil;
	_viewControllers = nil;
}

- (void)dealloc 
{
    _uiBaseTabBarView.delegate = nil;
}

#pragma mark - instant methods

- (UIBaseTabBarView*)uiBaseTabBarView
{
	return _uiBaseTabBarView;
}

- (BOOL)tabBarTransparent
{
	return _tabBarTransparent;
}

- (NSUInteger)getTabBarHeight
{
    return kTabBarHeight;
}

- (void)setTabBarTransparent:(BOOL)yesOrNo
{
	if (yesOrNo == YES)
	{
		_transitionView.frame = _containerView.bounds;
	}
	else
	{
		_transitionView.frame = CGRectMake(0, 0, _containerView.frame.size.width, _containerView.frame.size.height - [self getTabBarHeight]);
	}

}

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
{
	if (yesOrNO == YES)
	{
		if (self.uiBaseTabBarView.frame.origin.y == self.view.frame.size.height)
		{
			return;
		}
	}
	else 
	{
		if (self.uiBaseTabBarView.frame.origin.y == self.view.frame.size.height - [self getTabBarHeight])
		{
			return;
		}
	}
	
	if (animated == YES)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3f];
		if (yesOrNO == YES)
		{
			self.uiBaseTabBarView.frame = CGRectMake(self.uiBaseTabBarView.frame.origin.x, self.uiBaseTabBarView.frame.origin.y + [self getTabBarHeight], self.uiBaseTabBarView.frame.size.width, self.uiBaseTabBarView.frame.size.height);
		}
		else 
		{
			self.uiBaseTabBarView.frame = CGRectMake(self.uiBaseTabBarView.frame.origin.x, self.uiBaseTabBarView.frame.origin.y - [self getTabBarHeight], self.uiBaseTabBarView.frame.size.width, self.uiBaseTabBarView.frame.size.height);
		}
		[UIView commitAnimations];
	}
	else 
	{
		if (yesOrNO == YES)
		{
			self.uiBaseTabBarView.frame = CGRectMake(self.uiBaseTabBarView.frame.origin.x, self.uiBaseTabBarView.frame.origin.y + [self getTabBarHeight], self.uiBaseTabBarView.frame.size.width, self.uiBaseTabBarView.frame.size.height);
		}
		else 
		{
			self.uiBaseTabBarView.frame = CGRectMake(self.uiBaseTabBarView.frame.origin.x, self.uiBaseTabBarView.frame.origin.y - [self getTabBarHeight], self.uiBaseTabBarView.frame.size.width, self.uiBaseTabBarView.frame.size.height);
		}
	}
}

- (NSUInteger)selectedIndex
{
	return _selectedIndex;
}
- (UIViewController*)selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    [self displayViewAtIndex:index];
    [_uiBaseTabBarView selectTabAtIndex:index];
}

- (void)removeViewControllerAtIndex:(NSUInteger)index
{
    if (index >= [_viewControllers count])
    {
        return;
    }
    // Remove view from superview.
    [[(UIViewController *)[_viewControllers objectAtIndex:index] view] removeFromSuperview];
    // Remove viewcontroller in array.
    [_viewControllers removeObjectAtIndex:index];
    // Remove tab from tabbar.
    [_uiBaseTabBarView removeTabAtIndex:index];
}

- (void)insertViewController:(UIViewController*)viewController withImageDic:(DatasTabBarItem*)datasTabBarItem atIndex:(NSUInteger)index
{
    [_viewControllers insertObject:viewController atIndex:index];
    [_uiBaseTabBarView insertTabAtIndex:datasTabBarItem atIndex:index];
}


#pragma mark - Private methods
- (void)displayViewAtIndex:(NSUInteger)index
{
    // Before changing index, ask the delegate should change the index.
    if ([_delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)]) 
    {
        if (![_delegate tabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index]])
        {
            return;
        }
    }
    
    UIViewController *targetViewController = [self.viewControllers objectAtIndex:index];

    // If target index is equal to current index.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0) 
    {
        if ([targetViewController isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController*)targetViewController popToRootViewControllerAnimated:YES];
        }
        return;
    }
    _selectedIndex = index;
    
	[_transitionView.subviews makeObjectsPerformSelector:@selector(setHidden:) withObject:(id)[NSNumber numberWithBool:YES]];
    targetViewController.view.hidden = NO;
	targetViewController.view.frame = _transitionView.frame;
	if ([targetViewController.view isDescendantOfView:_transitionView]) 
	{
		[_transitionView bringSubviewToFront:targetViewController.view];
	}
	else
	{
		[_transitionView addSubview:targetViewController.view];
	}
    
    // Notify the delegate, the viewcontroller has been changed.
    if ([_delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) 
    {
        [_delegate tabBarController:self didSelectViewController:targetViewController];
    }
}

#pragma mark -
#pragma mark tabBar delegates
- (void)initTabBarItem:(UIBaseTabBarView *)uiBaseTabBarView item:(TabBarItem*)tabBarItem indexCurrent:(NSInteger)index
{
    
}

- (void)removeTabBarItem:(UIBaseTabBarView *)uiBaseTabBarView item:(TabBarItem*)tabBarItem indexCurrent:(NSInteger)index
{
    
}

- (void)didSelectTabBarItem:(UIBaseTabBarView *)uiBaseTabBarView item:(TabBarItem*)tabBarItem didSelectIndex:(NSInteger)index
{
	[self displayViewAtIndex:index];
}

@end
