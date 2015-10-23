//
//  SGFocusImageItem.h
//  ScrollViewLoop
//
//  Created by Vincent Tang on 13-7-18.
//  Copyright (c) 2013年 Vincent Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewPageItem : NSObject

@property (nonatomic, retain)  NSString      *strTitle;
@property (nonatomic, retain)  NSString      *strImage;
@property (nonatomic, assign)  NSInteger     iTag;

- (id)initWithTitle:(NSString *)title image:(NSString *)image tag:(NSInteger)tag;
@end
