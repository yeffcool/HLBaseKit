//
//  CustomTabBar.h
//  CustomTabBarController
//
//  Created by Levey Zhu on 12/15/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatasTabBarItem : NSObject
@property (nonatomic, retain) UIImage *itemBgNormal;
@property (nonatomic, retain) UIImage *itemBgPress;
@property (nonatomic, retain) UIImage *itemIconNormal;
@property (nonatomic, retain) UIImage *itemIconHighlighted;
@property (nonatomic, retain) UIImage *itemIconSelected;
@property (nonatomic, retain) NSString *itemTitleText;
@property (nonatomic, retain) UIColor *itemTitleColorNormal;
@property (nonatomic, retain) UIColor *itemTitleColorSelected;
@end

@interface TabBarItem : UIControl
@property (nonatomic, retain) UIImageView *uiImageViewBgNormal;
@property (nonatomic, retain) UIImageView *uiImageViewBgPress;
@property (nonatomic, retain) UIButton *uiButtonIcon;
@property (nonatomic, retain) UILabel *uiLabelTitle;
@end

@protocol UIBaseTabBarViewDelegate;

@interface UIBaseTabBarView : UIView
{
    __unsafe_unretained id<UIBaseTabBarViewDelegate> _delegate;
	UIImageView *_backgroundView;
	NSMutableArray *_arrayItemDatas;
    NSMutableArray *_arrayTabBarItems;
}

@property (nonatomic, assign) id<UIBaseTabBarViewDelegate> delegate;
@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, retain) NSMutableArray *arrayItemDatas;
@property (nonatomic, retain) NSMutableArray *arrayTabBarItems;

- (id)initWithFrame:(id<UIBaseTabBarViewDelegate>)tabBarDelegate rectTabBar:(CGRect)frame itemsDatas:(NSArray*)arrayDatas;
- (void)setBackgroundImage:(UIImage*)imageBackground;
- (void)selectTabAtIndex:(NSInteger)index;
- (void)removeTabAtIndex:(NSInteger)index;
- (void)insertTabAtIndex:(DatasTabBarItem*)datasTabBarItem atIndex:(NSUInteger)index;

@end

@protocol UIBaseTabBarViewDelegate<NSObject>
@optional
- (void)initTabBarItem:(UIBaseTabBarView *)uiBaseTabBarView item:(TabBarItem*)tabBarItem indexCurrent:(NSInteger)index;
- (void)removeTabBarItem:(UIBaseTabBarView *)uiBaseTabBarView item:(TabBarItem*)tabBarItem indexCurrent:(NSInteger)index;
- (void)didSelectTabBarItem:(UIBaseTabBarView *)uiBaseTabBarView item:(TabBarItem*)tabBarItem didSelectIndex:(NSInteger)index;
@end
