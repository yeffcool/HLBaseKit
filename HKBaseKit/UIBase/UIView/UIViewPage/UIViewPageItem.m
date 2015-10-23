//
//  SGFocusImageItem.m
//  ScrollViewLoop
//
//  Created by Vincent Tang on 13-7-18.
//  Copyright (c) 2013年 Vincent Tang. All rights reserved.
//

#import "UIViewPageItem.h"

@implementation UIViewPageItem
@synthesize strTitle = _strTitle;
@synthesize strImage = _strImage;
@synthesize iTag = _iTag;

- (id)initWithTitle:(NSString *)title image:(NSString *)image tag:(NSInteger)tag
{
    self = [super init];
    if (self) {
        self.strTitle = title;
        self.strImage = image;
        self.iTag = tag;
    }
    
    return self;
}
@end
