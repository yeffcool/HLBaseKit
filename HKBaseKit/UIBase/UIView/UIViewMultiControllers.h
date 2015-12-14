//
//  UIViewMultiControllers.h
//  iMiao
//
//  Created by 利 韩 on 15/9/4.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIViewMultiControllers;

@protocol UIViewMultiControllerssDelegate <NSObject>

-(void)viewMultiControllers:(UIViewMultiControllers*)viewMultiControllers scrollViewDidScroll:(UIScrollView *)scrollView;

@end

@interface UIViewMultiControllers : UIView<UIScrollViewDelegate>

@property (strong, nonatomic) id <UIViewMultiControllerssDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scrollViewContent;
@property (nonatomic, strong) NSMutableArray *arrayControllers;
@property (nonatomic, assign) BOOL isScrollingAnimationActive;

/**
 *  <#Description#>
 *
 *  @param controllers <#controllers description#>
 */
- (void)setControllers:(NSArray*)controllers;

/**
 *  <#Description#>
 *
 *  @param index <#index description#>
 */
- (void)setContentIndex:(NSUInteger)index;

- (NSUInteger)getCurrentIndexIndex;

@end
