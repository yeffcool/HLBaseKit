//
//  UIBaseTableViewCell.m
//  iMiao
//
//  Created by 利 韩 on 15/7/14.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "UIBaseCollectionViewCell.h"

@implementation UIBaseCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (CGSize)getCellSize
{
    CGSize size = CGSizeMake(self.contentView.frame.size.width, self.contentView.frame.size.height);
    return size;
}

@end
