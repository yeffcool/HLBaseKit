//
//  UIBaseTableViewCell.m
//  iMiao
//
//  Created by 利 韩 on 15/7/14.
//  Copyright (c) 2015年 利 韩. All rights reserved.
//

#import "UIBaseTableViewCell.h"

@implementation UIBaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (CGSize)getCellSize
{
    CGSize size = CGSizeMake(self.contentView.frame.size.width, self.contentView.frame.size.height);
    return size;
}

@end
