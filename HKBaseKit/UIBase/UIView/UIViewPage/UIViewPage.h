//
//  SGFocusImageFrame.h
//  ScrollViewLoop
//
//  Created by Vincent Tang on 13-7-18.
//  Copyright (c) 2013年 Vincent Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UIViewPageItem;
@class UIViewPage;

#pragma mark - SGFocusImageFrameDelegate
@protocol UIViewPageDelegate <NSObject>
@optional
- (void)initViewPageImageView:(UIImageView*)uiImageView item:(UIViewPageItem *)item;
- (void)viewPage:(UIViewPage *)uiViewPage didSelectItem:(UIViewPageItem *)item;
- (void)viewPage:(UIViewPage *)uiViewPage currentItem:(NSInteger)index;

@end


@interface UIViewPage : UIView <UIGestureRecognizerDelegate, UIScrollViewDelegate>
{
//    BOOL isInitialization;
    NSTimer *timerSwitchPage;
    
    UIScrollView *scrollViewPage;
    UIPageControl *pageControl;
}

//- (id)initWithFrame:(CGRect)frame delegate:(id<UIViewPageDelegate>)delegate pageItem:(UIViewPageItem *)items, ... NS_REQUIRES_NIL_TERMINATION;
//- (id)initWithFrame:(CGRect)frame delegate:(id<UIViewPageDelegate>)delegate pageItems:(NSArray *)items isAuto:(BOOL)isAuto;
//- (id)initWithFrame:(CGRect)frame delegate:(id<UIViewPageDelegate>)delegate pageItems:(NSArray *)items;

- (void)updatePageItems:(NSArray *)items;
- (void)scrollToIndex:(NSInteger)aIndex;


@property (nonatomic, assign) id<UIViewPageDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *arrayPageItems;
@property (nonatomic, strong) NSMutableArray *arrayImageViews;


@end
