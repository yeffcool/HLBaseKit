//
//  UIViewSegmentControl.m
//  iMiao
//
//  Created by 利 韩 on 15/9/4.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "UIBaseSegmentControl.h"
#import <pop/POP.h>


@interface UIBaseSegmentControl ()

@end


@implementation UIBaseSegmentControl

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initDatas];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initDatas];
    }
    
    return self;
}

- (void)initDatas
{
    self.selTextColor = [UIColor whiteColor];
    self.unselTextColor = [UIColor darkGrayColor];
    self.selBgColor = [UIColor darkGrayColor];
    self.selImage = nil;
    self.textSize = 14.0f;
    
    self.arrayTitleButtons = [[NSMutableArray alloc] init];
    self.arrayTitleLabels = [[NSMutableArray alloc] init];
    
    self.currentIndex = 0;
    self.viewSelection = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:self.viewSelection];
    
    
}

/**
 *  <#Description#>
 *
 *  @param buttonsTitles <#buttonsTitles description#>
 */
- (void)setButtons:(NSArray *)buttonsTitles
{
    
    // remove buttons if exists on view
    if (self.arrayTitleButtons.count > 0) {
        for (UIButton* btn in self.arrayTitleButtons)
        {
            if ([btn.superview isEqual:self])
            {
                [btn removeFromSuperview];
            }
        }
        
        [self.arrayTitleButtons removeAllObjects];
    }
    
    if (self.arrayTitleLabels.count > 0) {
        for (UILabel* btn in self.arrayTitleLabels)
        {
            if ([btn.superview isEqual:self])
            {
                [btn removeFromSuperview];
            }
        }
        
        [self.arrayTitleLabels removeAllObjects];
    }
    
    // create new buttons
    if (buttonsTitles != nil)
    {
        for (int i = 0; i < buttonsTitles.count; i++)
        {
            CGRect rectBtnTitle = CGRectMake(i * (self.frame.size.width / buttonsTitles.count), 0, (self.frame.size.width / buttonsTitles.count), self.frame.size.height);
            UIButton* btnTitle = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnTitle setFrame:rectBtnTitle];
            [btnTitle setTitle:@"" forState:UIControlStateNormal];
            [btnTitle addTarget:self action:@selector(actionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
            UILabel* lblTitle = [[UILabel alloc] initWithFrame:rectBtnTitle];
            if (self.isBold > 0)
            {
                [lblTitle setFont:[UIFont boldSystemFontOfSize:self.textSize]];
            }
            else
            {
                [lblTitle setFont:[UIFont systemFontOfSize:self.textSize]];
            }
            [lblTitle setTextAlignment:NSTextAlignmentCenter];
            [lblTitle setText:[buttonsTitles objectAtIndex:i]];
            
            if (i == self.currentIndex) {
                [lblTitle setTextColor:self.selTextColor];
                
            } else {
                [lblTitle setTextColor:self.unselTextColor];
            }
            
            [self addSubview:btnTitle];
            [self addSubview:lblTitle];
            [self.arrayTitleButtons addObject:btnTitle];
            [self.arrayTitleLabels addObject:lblTitle];
        }
    }

    // selection
    [self.viewSelection setFrame:CGRectMake(0, 0, [self.arrayTitleLabels count] == 0 ? 0 : self.frame.size.width / self.arrayTitleLabels.count, self.frame.size.height)];
    [self.viewSelection setBackgroundColor:self.selBgColor];
    [self.viewSelection setContentMode:UIViewContentModeScaleToFill];
    [self.viewSelection setImage:self.selImage];
    
    //
    [self.selTextColor getRed:&selRed green:&selGreen blue:&selBlue alpha:&selAlpha];
    [self.unselTextColor getRed:&nonRed green:&nonGreen blue:&nonBlue alpha:&nonAlpha];
}

/**
 *  <#Description#>
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.arrayTitleButtons.count > 0)
    {
        for (int i = 0; i < self.arrayTitleButtons.count; i++)
        {
            UIButton* button = [self.arrayTitleButtons objectAtIndex:i];
            if (button == nil)
            {
                continue;
            }
            [button setFrame:CGRectMake(i * (self.frame.size.width / self.arrayTitleButtons.count), 0, (self.frame.size.width / self.arrayTitleButtons.count), self.frame.size.height)];
        }
    }
    
    if (self.arrayTitleLabels.count > 0)
    {
        for (int i = 0; i < self.arrayTitleLabels.count; i++)
        {
            UILabel* label = [self.arrayTitleLabels objectAtIndex:i];
            if (label == nil)
            {
                continue;
            }
            [label setFrame:CGRectMake(i * (self.frame.size.width / self.arrayTitleLabels.count), 0, (self.frame.size.width / self.arrayTitleLabels.count), self.frame.size.height)];
        }
    }
    
    // selection
    [self.viewSelection setFrame:CGRectMake(0, 0, [self.arrayTitleLabels count] == 0 ? 0 : self.frame.size.width / self.arrayTitleLabels.count, self.frame.size.height)];
}

/**
 *  <#Description#>
 *
 *  @param indexOfButton <#indexOfButton description#>
 */
- (void)setSelectedIndex:(NSUInteger)indexOfButton
{
    if (indexOfButton == self.currentIndex) {
        return;
    }
    
    if (self.viewSelection.pop_animationKeys.count > 0) {
        [self.viewSelection pop_removeAllAnimations];
    }
    
    [self animateSelectionViewToIndex:indexOfButton];
    self.currentIndex = indexOfButton;
}

- (void)actionButtonTapped:(UIButton*)sender
{
    NSUInteger indexOfButton = [self.arrayTitleButtons indexOfObject:sender];
    
    [self setSelectedIndex:indexOfButton];
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(segmentControlButtonTappedWithIndex:)]) {
        [self.delegate segmentControlButtonTappedWithIndex:indexOfButton];
    }
}

- (void)animateSelectionViewToIndex:(NSUInteger)index
{
    
    float btnWidth = [self.arrayTitleLabels count] == 0 ? 0 : (self.frame.size.width / self.arrayTitleLabels.count);
    float animateToLocation = (int)index * btnWidth;
    
    UILabel* lblCurrent = [self.arrayTitleLabels objectAtIndex:self.currentIndex];
    UILabel* lblNext = [self.arrayTitleLabels objectAtIndex:index];
    
    // location change animation
    POPSpringAnimation *locAnimation = [POPSpringAnimation animation];
    locAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerPositionX];
    locAnimation.toValue = @(animateToLocation + btnWidth / 2);
    locAnimation.springBounciness = 10.0f;
    locAnimation.springSpeed = 5.0f;
    locAnimation.name = @"GotoLocation";
    locAnimation.delegate = self;
    
    // current label color change animation
    
    POPBasicAnimation* nextColorAnimation = [POPBasicAnimation animation];
    nextColorAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLabelTextColor];
    nextColorAnimation.toValue = self.selTextColor;
    nextColorAnimation.name = @"nextButtonColorChange";
    nextColorAnimation.delegate = self;
    
    // next label color change animation
    
    POPBasicAnimation* currColorAnimation = [POPBasicAnimation animation];
    currColorAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLabelTextColor];
    currColorAnimation.toValue = self.unselTextColor;
    currColorAnimation.name = @"currentButtonColorChange";
    currColorAnimation.delegate = self;
    
    [self.viewSelection pop_addAnimation:locAnimation forKey:locAnimation.name];
    [lblNext pop_addAnimation:nextColorAnimation forKey:nextColorAnimation.name];
    [lblCurrent pop_addAnimation:currColorAnimation forKey:currColorAnimation.name];
}

/**
 *  <#Description#>
 *
 *  @param ratioContent <#ratioContent description#>
 */
-(void)rearrangeRelatedButtonColor:(float)ratioContent
{
    float ratio = fmodf(ratioContent, 1);
    
    int prevIndex = floor(ratioContent);
    int nextIndex = ceil(ratioContent);
    
    if (prevIndex == nextIndex) {
        return;
    }
    
    UILabel* lblPrev;
    UILabel* lblNext;
    
    if (prevIndex >= 0) {
        lblPrev = [self.arrayTitleLabels objectAtIndex:prevIndex];
    }
    
    if (nextIndex < self.arrayTitleLabels.count)
    {
        lblNext = [self.arrayTitleLabels objectAtIndex:nextIndex];
    }
    
    // TODO: find a better and generic way to set colors
    
    if (lblPrev)
    {
        CGFloat pRed, pGreen, pBlue;
        pRed = (nonRed - selRed) * ratio + selRed;
        pGreen = (nonGreen - selGreen) * ratio + selGreen;
        pBlue = (nonBlue - selBlue) * ratio + selBlue;
        
        [lblPrev setTextColor:[UIColor colorWithRed:pRed green:pGreen blue:pBlue alpha:1]];
    }
    
    if (lblNext)
    {
        float nRed, nGreen, nBlue;
        
        nRed = (selRed - nonRed) * ratio + nonRed;
        nGreen = (selGreen - nonGreen) * ratio + nonGreen;
        nBlue = (selBlue - nonBlue) * ratio + nonBlue;
        
        [lblNext setTextColor:[UIColor colorWithRed:nRed green:nGreen blue:nBlue alpha:1]];
    }
}

@end
