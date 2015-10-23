//
//  THComboBox.h
//  THComboBoxExample
//
//  Created by wujy on 15/7/8.
//  Copyright (c) 2015年 清华大学. All rights reserved.
//

#import <UIKit/UIKit.h>

//委托协议
@class UIComboBox;
@protocol UIComboBoxDelegate <NSObject>
-(void)comboBox:(UIComboBox*)comboBox didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

IB_DESIGNABLE
@interface UIComboBox : UIControl<UITableViewDataSource,UITableViewDelegate>
//可在IB中属性调整
@property (nonatomic        ) IBInspectable CGFloat            cornerRadius;
@property (nonatomic        ) IBInspectable CGFloat            borderWidth;
@property (nonatomic        ) IBInspectable UIColor            *borderColor;
@property (nonatomic        ) IBInspectable UIImage            *arrowImage;
@property (nonatomic        ) IBInspectable UIColor            *textColor;
@property (nonatomic        ) IBInspectable NSString           *testString;

@property (nonatomic        ) IBInspectable CGFloat            textContentSize;
@property (nonatomic        ) IBInspectable CGFloat            textListSize;

@property (strong, nonatomic) UIButton           *buttonContent;
@property (strong, nonatomic) UIButton           *buttonDropArrow;
@property (strong, nonatomic) UITableView        *tableViewDropList;

@property (nonatomic        ) NSInteger          maxRows;
@property (strong, nonatomic) NSArray            *listItems;
@property (strong, nonatomic) id<           UIComboBoxDelegate> delegate;

@property (nonatomic        ) NSInteger          indexSelected;
@end
