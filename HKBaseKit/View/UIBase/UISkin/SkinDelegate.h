//
//  ISkinObserver.h
//  XinLing
//
//  Created by 利 韩 on 14/12/9.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkinObject.h"

@protocol SkinDelegate <NSObject>

@required
- (void) updateViewControllerSkin:(SkinObject*)skinObject;

@end
