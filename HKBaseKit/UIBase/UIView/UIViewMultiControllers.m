//
//  UIViewMultiControllers.m
//  iMiao
//
//  Created by 利 韩 on 15/9/4.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "UIViewMultiControllers.h"

@implementation UIViewMultiControllers

- (id)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    
    return self;
}

#pragma mark - private methods
- (void)initialization
{
    self.arrayControllers = [[NSMutableArray alloc] init];
    self.isScrollingAnimationActive = NO;
    
    self.scrollViewContent = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self.scrollViewContent setShowsHorizontalScrollIndicator:NO];
    [self.scrollViewContent setShowsVerticalScrollIndicator:NO];
    [self.scrollViewContent setDelegate:self];
    [self.scrollViewContent setBounces:NO];
    [self.scrollViewContent setPagingEnabled:YES];
    [self addSubview:self.scrollViewContent];
}

/**
 *  <#Description#>
 *
 *  @param controllers <#controllers description#>
 */
- (void)setControllers:(NSArray*)controllers
{
    //    [self initialization];
    [self.arrayControllers removeAllObjects];
    
    //
    for (UIView * subview in [self.scrollViewContent subviews])
    {
        if(![subview isKindOfClass:[UIImageView class]])
            continue;
        [subview removeFromSuperview];
    }
    
    if (controllers == nil || [controllers count] == 0)
    {
        return;
    }
    
    [self.arrayControllers addObjectsFromArray:controllers];
    
    self.scrollViewContent.contentSize = CGSizeMake(self.scrollViewContent.frame.size.width * [self.arrayControllers count], self.scrollViewContent.frame.size.height);
    
    for (int i = 0; i < [self.arrayControllers count]; i++)
    {
        UIView *viewPage = nil;
        id objectId = [self.arrayControllers objectAtIndex:i];
        if (objectId == nil)
        {
            continue;
        }
        if ([objectId isKindOfClass:[UIViewController class]])
        {
            viewPage = ((UIViewController*)objectId).view;
        }
        else if ([objectId isKindOfClass:[UIView class]])
        {
            viewPage = ((UIView*)objectId);
        }
        
        [viewPage setFrame:CGRectMake(i * self.scrollViewContent.frame.size.width, 0, self.scrollViewContent.frame.size.width, self.scrollViewContent.frame.size.height)];
        
        [self.scrollViewContent addSubview:viewPage];
    }
}

/**
 *  <#Description#>
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.scrollViewContent setFrame:self.bounds];
    
    
    self.scrollViewContent.contentSize = CGSizeMake(self.scrollViewContent.frame.size.width * [self.arrayControllers count], self.scrollViewContent.frame.size.height);
    
    for (int i = 0; i < [self.arrayControllers count]; i++)
    {
        UIView *viewPage = nil;
        id objectId = [self.arrayControllers objectAtIndex:i];
        if (objectId == nil)
        {
            continue;
        }
        if ([objectId isKindOfClass:[UIViewController class]])
        {
            viewPage = ((UIViewController*)objectId).view;
        }
        else if ([objectId isKindOfClass:[UIView class]])
        {
            viewPage = ((UIView*)objectId);
        }
        
        [viewPage setFrame:CGRectMake(i * self.scrollViewContent.frame.size.width, 0, self.scrollViewContent.frame.size.width, self.scrollViewContent.frame.size.height)];
    }
}

/**
 *  <#Description#>
 *
 *  @param index <#index description#>
 */
- (void)setContentIndex:(NSUInteger)index
{
    [self.scrollViewContent setContentOffset:CGPointMake(index * self.scrollViewContent.frame.size.width, 0) animated:YES];
    self.isScrollingAnimationActive = YES;
}

- (NSUInteger)getCurrentIndexIndex
{
    return roundf(self.scrollViewContent.contentOffset.x / self.scrollViewContent.frame.size.width);
}

#pragma mark UIScrollView delegate
/**
 *  滚动动画停止时执行,代码改变时触发,也就是setContentOffset改变时
 *
 *  @param scrollView <#scrollView description#>
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    self.isScrollingAnimationActive = NO;
}

/**
 *  只要滚动了就会触发
 *
 *  @param scrollView <#scrollView description#>
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(viewMultiControllers:scrollViewDidScroll:)]) {
        [self.delegate viewMultiControllers:self scrollViewDidScroll:scrollView];
    }
//    if (!self.isScrollingAnimationActive)
//    {
//        CGRect rectViewSelection = _viewSelection.frame;
//        rectViewSelection.origin.x = scrollView.contentOffset.x / scrollView.contentSize.width * _viewButtons.frame.size.width;
//        [_viewSelection setFrame:rectViewSelection];
//        
//        if (scrollView.contentOffset.x >= 0 && scrollView.contentOffset.x <= scrollView.contentSize.width) {
//            [self rearrangeRelatedButtonColor:scrollView.contentOffset.x];
//        }
//    }
}

@end
