//
//  CustomTabBar.m
//  CustomTabBarController
//
//  Created by Levey Zhu on 12/15/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import "UIBaseTabBarView.h"

#define ScaleHeightIcon                                 5/7
#define ScaleHeightTitle                                2/7

#define IconPaddingLeft                                 0
#define IconPaddingRight                                0
#define IconPaddingTop                                  5
#define IconPaddingBottom                               5

#define TitlePaddingLeft                                0
#define TitlePaddingRight                               0
#define TitlePaddingTop                                 0
#define TitlePaddingBottom                              5

@implementation DatasTabBarItem
@end

@implementation TabBarItem
@end

@implementation UIBaseTabBarView

@synthesize backgroundView = _backgroundView;
@synthesize delegate = _delegate;
@synthesize arrayItemDatas = _arrayItemDatas;
@synthesize arrayTabBarItems = _arrayTabBarItems;

- (id)initWithFrame:(id<UIBaseTabBarViewDelegate>)tabBarDelegate rectTabBar:(CGRect)frame itemsDatas:(NSArray*)arrayDatas
{
    self = [super initWithFrame:frame];
    if (self)
	{
        self.delegate = tabBarDelegate;
        
		self.backgroundColor = [UIColor whiteColor];
		_backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
		[self addSubview:_backgroundView];
        
        if (arrayDatas != nil)
        {
            self.arrayItemDatas = [[NSMutableArray alloc] init];
            [self.arrayItemDatas addObjectsFromArray:arrayDatas];
            
            [self initItems];
        }
    }
    return self;
}

- (void)initItems
{
    self.arrayTabBarItems = [[NSMutableArray alloc] init];
    CGFloat width = self.frame.size.width / [self.arrayItemDatas count];
    for (int i = 0; i < [self.arrayItemDatas count]; i++)
    {
        DatasTabBarItem *datasTabBarItem = [self.arrayItemDatas objectAtIndex:i];
        
        if (datasTabBarItem == nil) {
            continue;
        }
        
        TabBarItem *tabBarItem = [[TabBarItem alloc] initWithFrame:CGRectMake(width * i, 0, width, self.frame.size.height)];
        tabBarItem.backgroundColor = [UIColor clearColor];
        tabBarItem.tag = i;
        [tabBarItem addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchDown];
        
        tabBarItem.uiImageViewBgNormal = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, self.frame.size.height)];
        [tabBarItem.uiImageViewBgNormal setImage:datasTabBarItem.itemBgNormal];
        [tabBarItem addSubview:tabBarItem.uiImageViewBgNormal];
        
        tabBarItem.uiImageViewBgPress = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, self.frame.size.height)];
        [tabBarItem.uiImageViewBgPress setImage:datasTabBarItem.itemBgPress];
        [tabBarItem addSubview:tabBarItem.uiImageViewBgPress];
        
        tabBarItem.uiButtonIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBarItem.uiButtonIcon.imageView.contentMode = UIViewContentModeScaleAspectFit;
        tabBarItem.uiButtonIcon.tag = i;
        tabBarItem.uiButtonIcon.frame = CGRectMake(0+IconPaddingLeft,
                                                   0+IconPaddingTop,
                                                   width - IconPaddingLeft - IconPaddingRight,
                                                   self.frame.size.height * ScaleHeightIcon - IconPaddingTop - IconPaddingBottom);
        [tabBarItem.uiButtonIcon setImage:datasTabBarItem.itemIconNormal forState:UIControlStateNormal];
        [tabBarItem.uiButtonIcon setImage:datasTabBarItem.itemIconHighlighted forState:UIControlStateHighlighted];
        [tabBarItem.uiButtonIcon setImage:datasTabBarItem.itemIconSelected forState:UIControlStateSelected];
        [tabBarItem.uiButtonIcon setUserInteractionEnabled:NO];
        [tabBarItem addSubview:tabBarItem.uiButtonIcon];
        
        CGRect rectTitle = CGRectMake(0 + TitlePaddingLeft,
                                      self.frame.size.height - self.frame.size.height * ScaleHeightTitle + TitlePaddingTop,
                                      width - TitlePaddingLeft - TitlePaddingRight,
                                      self.frame.size.height * ScaleHeightTitle - TitlePaddingTop - TitlePaddingBottom);
        tabBarItem.uiLabelTitle = [[UILabel alloc] initWithFrame:rectTitle];
        tabBarItem.uiLabelTitle.textAlignment = NSTextAlignmentCenter;
        tabBarItem.uiLabelTitle.text = datasTabBarItem.itemTitleText;
        tabBarItem.uiLabelTitle.textColor = datasTabBarItem.itemTitleColorNormal;
        tabBarItem.uiLabelTitle.font = [UIFont systemFontOfSize:12];
        [tabBarItem addSubview:tabBarItem.uiLabelTitle];
        
        [self addSubview:tabBarItem];
        [self.arrayTabBarItems addObject:tabBarItem];
        
        if (self.delegate != nil && [_delegate respondsToSelector:@selector(initTabBarItem:item:indexCurrent:)])
        {
            [self.delegate initTabBarItem:self item:tabBarItem indexCurrent:i];
        }
    }
}

- (void)setBackgroundImage:(UIImage*)imageBackground
{
	[_backgroundView setImage:imageBackground];
}

- (void)tabBarButtonClicked:(id)sender
{
	UIButton *btn = sender;
	[self selectTabAtIndex:btn.tag];
}

- (void)selectTabAtIndex:(NSInteger)index
{
    for (int i = 0; i < [self.arrayTabBarItems count]; i++)
    {
        DatasTabBarItem *datasTabBarItem = [self.arrayItemDatas objectAtIndex:i];
        
        if (datasTabBarItem == nil) {
            continue;
        }
        
        TabBarItem *tabBarItem = [self.arrayTabBarItems objectAtIndex:i];
        if (tabBarItem == nil) {
            continue;
        }
        
        if (i == index)
        {
            [tabBarItem.uiImageViewBgNormal setHidden:YES];
            [tabBarItem.uiImageViewBgPress setHidden:NO];
            
            [tabBarItem.uiButtonIcon setSelected:YES];
            
            [tabBarItem.uiLabelTitle setTextColor:datasTabBarItem.itemTitleColorSelected];
            
            if (_delegate != nil && [_delegate respondsToSelector:@selector(didSelectTabBarItem:item:didSelectIndex:)])
            {
                [_delegate didSelectTabBarItem:self item:tabBarItem didSelectIndex:tabBarItem.uiButtonIcon.tag];
            }
        }
		else
        {
            [tabBarItem.uiImageViewBgNormal setHidden:NO];
            [tabBarItem.uiImageViewBgPress setHidden:YES];
            
            [tabBarItem.uiButtonIcon setSelected:NO];
            
            [tabBarItem.uiLabelTitle setTextColor:datasTabBarItem.itemTitleColorNormal];
        }
	}
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [self.arrayItemDatas removeObjectAtIndex:index];

    for (int i = 0; i<[self.arrayItemDatas count]; i++) {
        TabBarItem *tabBarItem = [self.arrayTabBarItems objectAtIndex:index];
        if (tabBarItem == nil)
        {
            continue;
        }
        
        if (self.delegate != nil && [_delegate respondsToSelector:@selector(removeTabBarItem:item:indexCurrent:)])
        {
            [self.delegate removeTabBarItem:self item:tabBarItem indexCurrent:i];
        }
        
        [tabBarItem.uiImageViewBgNormal removeFromSuperview];
        [tabBarItem.uiImageViewBgPress removeFromSuperview];
        [tabBarItem.uiButtonIcon removeFromSuperview];
        [tabBarItem.uiLabelTitle removeFromSuperview];
        [tabBarItem removeFromSuperview];
    }
   
    [self initItems];
}

- (void)insertTabAtIndex:(DatasTabBarItem*)datasTabBarItem atIndex:(NSUInteger)index
{
    [self.arrayItemDatas insertObject:datasTabBarItem atIndex:index];
    
    for (int i = 0; i<[self.arrayItemDatas count]; i++)
    {
        TabBarItem *tabBarItem = [self.arrayTabBarItems objectAtIndex:index];
        if (tabBarItem == nil)
        {
            continue;
        }
        
        if (self.delegate != nil && [_delegate respondsToSelector:@selector(removeTabBarItem:item:indexCurrent:)])
        {
            [self.delegate removeTabBarItem:self item:tabBarItem indexCurrent:i];
        }
        
        [tabBarItem.uiImageViewBgNormal removeFromSuperview];
        [tabBarItem.uiImageViewBgPress removeFromSuperview];
        [tabBarItem.uiButtonIcon removeFromSuperview];
        [tabBarItem.uiLabelTitle removeFromSuperview];
        [tabBarItem removeFromSuperview];
    }
    
    [self initItems];
}

@end
