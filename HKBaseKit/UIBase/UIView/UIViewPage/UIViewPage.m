//
//  SGFocusImageFrame.m
//  ScrollViewLoop
//
//  Created by Vincent Tang on 13-7-18.
//  Copyright (c) 2013年 Vincent Tang. All rights reserved.
//

#import "UIViewPage.h"
#import "UIViewPageItem.h"
#import <objc/runtime.h>

#define RateSize                                            9.0f/16.0f
#define HeightPageControl                                   26
#define SWITCH_FOCUS_PICTURE_INTERVAL                       5.0

@interface UIViewPage () {
}

- (void)initialization;
@end

@implementation UIViewPage
@synthesize delegate = _delegate;

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
    scrollViewPage = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollViewPage.showsHorizontalScrollIndicator = NO;
    scrollViewPage.showsVerticalScrollIndicator = NO;
    scrollViewPage.pagingEnabled = YES;
    scrollViewPage.bounces = NO;
    [self addSubview:scrollViewPage];
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - HeightPageControl, self.frame.size.width, HeightPageControl)];
    pageControl.userInteractionEnabled = NO;
    [self addSubview:pageControl];
}

- (void)updatePageItems:(NSArray *)items
{
//    [self initialization];
    if (timerSwitchPage != nil)
    {
        [timerSwitchPage invalidate];
        timerSwitchPage = nil;
    }
    scrollViewPage.delegate = nil;
    
    if (self.arrayPageItems == nil)
    {
        self. arrayPageItems = [[NSMutableArray alloc] init];
    }
    [self. arrayPageItems removeAllObjects];
    
    //
    for (UIView * subview in [scrollViewPage subviews])
    {
        if(![subview isKindOfClass:[UIImageView class]])
            continue;
        [subview removeFromSuperview];
    }
    //
    pageControl.numberOfPages = 0;
    
    
    if (items == nil || [items count] == 0)
    {
        return;
    }
    
    UIViewPageItem *viewPageItemLast = [items objectAtIndex:[items count] - 1];
    UIViewPageItem *viewPageItemStart = [[UIViewPageItem alloc] initWithTitle:viewPageItemLast.strTitle image:viewPageItemLast.strImage tag:-1];
    
    UIViewPageItem *viewPageItemFirst = [items objectAtIndex:0];
    UIViewPageItem *viewPageItemEnd = [[UIViewPageItem alloc] initWithTitle:viewPageItemFirst.strTitle image:viewPageItemFirst.strImage tag:[items count]];

    [self.arrayPageItems addObject:viewPageItemStart];
    [self.arrayPageItems addObjectsFromArray:items];
    [self.arrayPageItems addObject:viewPageItemEnd];
    
    
    pageControl.numberOfPages = [self.arrayPageItems count]>1 ? [self.arrayPageItems count] -2 : [self.arrayPageItems count];
    pageControl.currentPage = 0;
    
 
    scrollViewPage.contentSize = CGSizeMake(scrollViewPage.frame.size.width * [self.arrayPageItems count], scrollViewPage.frame.size.height);
    for (int i = 0; i < [self.arrayPageItems count]; i++)
    {
        UIViewPageItem *viewPageItem = [self.arrayPageItems objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * scrollViewPage.frame.size.width, 0, scrollViewPage.frame.size.width, scrollViewPage.frame.size.height);
        [imageView setContentMode:UIViewContentModeScaleToFill];
        
        if (self.delegate != nil)
        {
            [self.delegate initViewPageImageView:imageView item:viewPageItem];
        }
        
        [scrollViewPage addSubview:imageView];
    }
    
    if ([self.arrayPageItems count] > 1)
    {
        [scrollViewPage setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO] ;
        timerSwitchPage = [NSTimer scheduledTimerWithTimeInterval:SWITCH_FOCUS_PICTURE_INTERVAL target:self selector:@selector(switchPageItems:) userInfo:nil repeats:YES];
    }
    
    scrollViewPage.delegate = self;
    
    // single tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [scrollViewPage addGestureRecognizer:tapGestureRecognize];
}

- (void)switchPageItems:(NSTimer *)timer
{
    if (self.arrayPageItems == nil || [self.arrayPageItems count] == 0)
    {
        if (timerSwitchPage != nil )
        {
            [timerSwitchPage invalidate];
            timerSwitchPage = nil;
        }
        return;
    }
    
    CGFloat targetX = scrollViewPage.contentOffset.x + scrollViewPage.frame.size.width;
    targetX = (int)(targetX/self.frame.size.width) * self.frame.size.width;
    [self moveToTargetPosition:targetX];
    
}

- (void)singleTapGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.arrayPageItems == nil || [self.arrayPageItems count] == 0)
    {
        return;
    }
    
    int page = (int)(scrollViewPage.contentOffset.x / scrollViewPage.frame.size.width);
    if (page > -1 && page < [self.arrayPageItems count]) {
        UIViewPageItem *viewPageItem = [self.arrayPageItems objectAtIndex:page];
        if ([self.delegate respondsToSelector:@selector(viewPage:didSelectItem:)])
        {
            [self.delegate viewPage:self didSelectItem:viewPageItem];
        }
    }
}

- (void)moveToTargetPosition:(CGFloat)targetX
{
    if (self.arrayPageItems == nil || [self.arrayPageItems count] == 0)
    {
        return;
    }
    BOOL animated = YES;
    [scrollViewPage setContentOffset:CGPointMake(targetX, 0) animated:animated];
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.arrayPageItems == nil || [self.arrayPageItems count] == 0)
    {
        return;
    }
    float targetX = scrollView.contentOffset.x;
    if ([self.arrayPageItems count] >=3 )
    {
        if (targetX >= self.frame.size.width * ([self.arrayPageItems count] -1)) {
            targetX = self.frame.size.width;
            [scrollView setContentOffset:CGPointMake(targetX, 0) animated:NO];
        }
        else if(targetX <= 0)
        {
            targetX = self.frame.size.width *([self.arrayPageItems count]-2);
            [scrollView setContentOffset:CGPointMake(targetX, 0) animated:NO];
        }
    }
    NSInteger pageIndex = (scrollView.contentOffset.x + self.frame.size.width/2.0) / self.frame.size.width;
    if ([self.arrayPageItems count] > 1)
    {
        pageIndex --;
        if (pageIndex >= pageControl.numberOfPages)
        {
            pageIndex = 0;
        }else if(pageIndex <0)
        {
            pageIndex = pageControl.numberOfPages -1;
        }
    }
    if (pageIndex != pageControl.currentPage)
    {
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(viewPage:currentItem:)])
        {
            [self.delegate viewPage:self currentItem:pageIndex];
        }
    }
    pageControl.currentPage = pageIndex;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.arrayPageItems == nil || [self.arrayPageItems count] == 0)
    {
        return;
    }
    if (!decelerate)
    {
        CGFloat targetX = scrollView.contentOffset.x + scrollView.frame.size.width;
        targetX = (int)(targetX/self.frame.size.width) * self.frame.size.width;
        [self moveToTargetPosition:targetX];
    }
}


- (void)scrollToIndex:(NSInteger)aIndex
{
    if (self.arrayPageItems == nil || [self.arrayPageItems count] == 0)
    {
        return;
    }
    
    if ([self.arrayPageItems count]>1)
    {
        if (aIndex >= ([self.arrayPageItems count] - 2))
        {
            aIndex = [self.arrayPageItems count] -3;
        }
        [self moveToTargetPosition:self.frame.size.width*(aIndex+1)];
    }else
    {
        [self moveToTargetPosition:0];
    }
    [self scrollViewDidScroll:scrollViewPage];
    
}
@end