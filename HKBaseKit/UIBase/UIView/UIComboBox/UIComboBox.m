//
//  THComboBox.m
//  THComboBoxExample
//
//  Created by wujy on 15/7/8.
//  Copyright (c) 2015年 清华大学. All rights reserved.
//

#import "UIComboBox.h"

@interface UIComboBox()
{
    CGFloat             heightDrop;
}
@end

@implementation UIComboBox
/**
 *  运行时初始化
 *
 *  @param aDecoder aDecoder description
 *
 *  @return return value description
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

/**
 *  <#Description#>
 */
-(void)setup
{
    [self addTarget:self action:@selector(dropdownClick:) forControlEvents:UIControlEventTouchDown];
    
    CGFloat arrowHeight = CGRectGetHeight(self.frame);
    CGFloat arrowWidth = arrowHeight* 4.0f / 3.0f;
    self.buttonDropArrow      = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - arrowWidth, 0, arrowWidth, arrowHeight)];
    [self.buttonDropArrow addTarget:self action:@selector(dropdownClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.buttonDropArrow];
    
    self.buttonContent = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.frame) - arrowWidth - 20, CGRectGetHeight(self.frame))];
    [self.buttonContent.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self.buttonContent setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonContent setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self.buttonContent setTitle:@"" forState:UIControlStateNormal];
    CGFloat fontsize = ( self.buttonContent.bounds.size.height * 3.0f / 7.0f);
    [self.buttonContent.titleLabel setFont:[UIFont systemFontOfSize:(CGFloat)fontsize]];
    [self.buttonContent addTarget:self action:@selector(dropdownClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.buttonContent];
    
    //
    
    //下拉框设置
    self.tableViewDropList = [[UITableView alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, CGRectGetWidth(self.bounds), 0)];
    self.tableViewDropList.layer.borderWidth = 1.0;
    self.tableViewDropList.layer.borderColor = [[UIColor blackColor] CGColor];
    self.tableViewDropList.rowHeight = self.buttonContent.bounds.size.height;
    self.tableViewDropList.delegate = self;
    self.tableViewDropList.dataSource = self;
//    [self addSubview:self.tableViewDropList];
//    [self.superview insertSubview:self.tableViewDropList belowSubview:self];
    
    if ([self.tableViewDropList respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableViewDropList setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableViewDropList respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableViewDropList setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat arrowHeight = CGRectGetHeight(self.frame);
    CGFloat arrowWidth = arrowHeight* 4.0f / 3.0f;
    [self.buttonDropArrow setFrame:CGRectMake(CGRectGetWidth(self.frame) - arrowWidth, 0, arrowWidth, arrowHeight)];
    //
    [self.buttonContent setFrame:CGRectMake(10, 0, CGRectGetWidth(self.frame) - arrowWidth - 20, CGRectGetHeight(self.frame))];
    //
    [self.tableViewDropList setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, CGRectGetWidth(self.frame), self.tableViewDropList.frame.size.height)];
}

/**
 *  下拉事件
 *
 *  @param sender <#sender description#>
 */
-(void)dropdownClick:(id)sender
{
    if (!_maxRows)
    {
        heightDrop = _listItems.count > 5 ? (5 * self.tableViewDropList.rowHeight + .2f * self.buttonContent.bounds.size.height) : (self.tableViewDropList.rowHeight * _listItems.count + .2f * self.buttonContent.bounds.size.height);
    }
    if (self.tableViewDropList.frame.size.height == 0)
    {
        [self.tableViewDropList removeFromSuperview];
        [self.superview addSubview:self.tableViewDropList];
        [self.tableViewDropList reloadData];
        [UIView animateWithDuration:.25 animations:^{
            [self.tableViewDropList setFrame:CGRectMake(self.tableViewDropList.frame.origin.x, self.tableViewDropList.frame.origin.y, self.tableViewDropList.frame.size.width, heightDrop)];
//            CGRect frameTemp = self.frame;
//            frameTemp.size.height = self.buttonContent.frame.size.height + heightDrop;
//            self.frame = frameTemp;
        }completion:^(BOOL finished){
            
        }];
    }
    else
    {
        [UIView animateWithDuration:.25 animations:^{
            [self.tableViewDropList setFrame:CGRectMake(self.tableViewDropList.frame.origin.x, self.tableViewDropList.frame.origin.y, self.tableViewDropList.frame.size.width, 0)];
//            CGRect frameTemp = self.frame;
//            frameTemp.size.height = self.buttonContent.frame.size.height + 0;
//            self.frame = frameTemp;
        }completion:^(BOOL finished){
            [self.tableViewDropList removeFromSuperview];
        }];
    }
}

/**
 *  IB调试初始化
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

/**
 *  改变frame时会调用，方便IB中调试
 */
-(void)prepareForInterfaceBuilder
{
    [self updateFrame];
}

/**
 *  用于IB中调试
 */
- (void)updateFrame
{
    [self.buttonContent setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame) - CGRectGetHeight(self.frame), CGRectGetHeight(self.frame))];
    [self.buttonDropArrow setFrame: CGRectMake(CGRectGetWidth(self.frame) - CGRectGetHeight(self.frame), 0, CGRectGetHeight(self.frame), CGRectGetHeight(self.frame))];
    CGFloat vInset = self.bounds.size.height / 5;
    CGFloat hInset = self.bounds.size.height / 8;
    self.buttonDropArrow.imageEdgeInsets = UIEdgeInsetsMake(vInset, hInset, vInset, hInset);
    CGFloat fontsize = ( self.buttonContent.bounds.size.height * 3.0f / 7.0f);
    [self.buttonContent.titleLabel setFont:[UIFont systemFontOfSize:(CGFloat)fontsize]];
}

#pragma mark - Property Settings
/**
 *  设置圆角属性
 *
 *  @param cornerRadius 圆角半径
 */
-(void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0?true:false;
}

/**
 *  设置下拉框最大行数
 *
 *  @param maxRows <#maxRows description#>
 */
-(void)setMaxRows:(NSInteger)maxRows
{
    _maxRows = maxRows;
    if (!_maxRows) {
        _maxRows = _listItems.count;
    }
    if (_maxRows <= _listItems.count) {
        heightDrop = self.tableViewDropList.rowHeight * _maxRows + .2f * self.buttonContent.bounds.size.height;
    }else{
        heightDrop = self.tableViewDropList.rowHeight * _listItems.count + .2f * self.buttonContent.bounds.size.height;
    }
}

/**
 *  设置下拉按钮图像
 *
 *  @param arrowImage <#arrowImage description#>
 */
-(void)setArrowImage:(UIImage *)arrowImage
{
    _arrowImage = arrowImage;
    [self.buttonDropArrow setImage:arrowImage forState:UIControlStateNormal];
}

/**
 *  设置边界线线宽
 *
 *  @param borderWidth <#borderWidth description#>
 */
-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
//    self.layer.borderWidth = borderWidth;
    self.tableViewDropList.layer.borderWidth = _borderWidth;
}

/**
 *  设置边界线颜色
 *
 *  @param borderColor <#borderColor description#>
 */
-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
//    self.layer.borderColor = _borderColor.CGColor;
    self.tableViewDropList.layer.borderColor = _borderColor.CGColor;
}

/**
 *  设置下拉菜单内容
 *
 *  @param listItems <#listItems description#>
 */
-(void)setListItems:(NSArray*)listItems
{
    _listItems = listItems;
    if (_listItems != nil && [_listItems count] > 0)
    {
        self.indexSelected = 0;
        [self.buttonContent setTitle:[_listItems objectAtIndex:0] forState:UIControlStateNormal];
    }
}

/**
 *  设置文本颜色
 *
 *  @param textColor <#textColor description#>
 */
-(void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    [self.buttonContent setTitleColor:_textColor forState:UIControlStateNormal];
}

/**
 *  调试文本
 *
 *  @param testString <#testString description#>
 */
-(void)setTestString:(NSString *)testString
{
    _testString = testString;
    [self.buttonContent setTitle:_testString forState:UIControlStateNormal];
}

-(void)setTextContentSize:(CGFloat)textContentSize
{
    _textContentSize = textContentSize;
}

-(void)setTextListSize:(CGFloat)textListSize
{
    _textListSize = textListSize;
    [self.buttonContent.titleLabel setFont:[UIFont systemFontOfSize:_textListSize]];
}

#pragma mark - tableview delegate and datasource
//section数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//section行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listItems.count;
}

//行元素
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ComboCell";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    //cell.textLabel.textAlignment = NSTextAlignmentCenter;
    [cell.textLabel setFont:[UIFont systemFontOfSize:_textContentSize]];
    cell.textLabel.text = _listItems[indexPath.row];
    
    return cell;
}

//选择事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.buttonContent setTitle:_listItems[indexPath.row] forState:UIControlStateNormal];
    [self dropdownClick:self.buttonDropArrow];
    [self.delegate comboBox:self didSelectRowAtIndexPath:indexPath];
    
    self.indexSelected = indexPath.row;
}

@end
