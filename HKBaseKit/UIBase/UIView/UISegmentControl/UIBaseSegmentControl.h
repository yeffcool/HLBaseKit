//
//  UIViewSegmentControl.h
//  iMiao
//
//  Created by 利 韩 on 15/9/4.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIBaseSegmentControlDelegate <NSObject>

-(void)segmentControlButtonTappedWithIndex:(NSUInteger)index;

@end

@interface UIBaseSegmentControl : UIView
{
    CGFloat selRed, selGreen, selBlue, selAlpha;
    CGFloat nonRed, nonGreen, nonBlue, nonAlpha;
}

@property (nonatomic, strong) IBInspectable UIColor *selTextColor;
@property (nonatomic, strong) IBInspectable UIColor *unselTextColor;
@property (nonatomic, strong) IBInspectable UIColor *selBgColor;
@property (nonatomic, strong) IBInspectable UIImage *selImage;
@property (nonatomic, assign) IBInspectable CGFloat textSize;
@property (nonatomic, assign) IBInspectable NSInteger isBold;

@property (strong, nonatomic) id <UIBaseSegmentControlDelegate> delegate;
@property (strong, nonatomic) NSMutableArray* arrayTitleButtons;
@property (strong, nonatomic) NSMutableArray* arrayTitleLabels;
@property (strong, nonatomic) UIImageView* viewSelection;
@property NSUInteger currentIndex;

/**
 *  <#Description#>
 *
 *  @param buttonsTitles <#buttonsTitles description#>
 */
- (void)setButtons:(NSArray *)buttonsTitles;

/**
 *  <#Description#>
 *
 *  @param indexOfButton <#indexOfButton description#>
 */
- (void)setSelectedIndex:(NSUInteger)indexOfButton;

/**
 *  <#Description#>
 *
 *  @param ratioContent <#ratioContent description#>
 */
-(void)rearrangeRelatedButtonColor:(float)ratioContent;

@end
