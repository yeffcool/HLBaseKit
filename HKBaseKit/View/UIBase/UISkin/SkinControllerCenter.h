//
//  SkinControllerConter.h
//  XinLing
//
//  Created by 利 韩 on 14/12/9.
//  Copyright (c) 2014年 利 韩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkinObject.h"
#import "SkinDelegate.h"
#import "SkinConfig.h"


@interface SkinControllerCenter : NSObject{
    //这个类包含该接口
    id<SkinDelegate> _skinDelegate;
    NSMutableArray* _arrayDelegate;
}

+ (SkinControllerCenter*)sharedInstance;

//接口变量delegate作为类SkinControllerCenter的属性
@property(nonatomic,retain)id skinDelegate;
@property (nonatomic, retain) NSMutableArray* arrayDelegate;

- (void)addDelegate:(id)delegate isOnlyExist:(BOOL)isOnly;

- (void)removeDelegate:(id)delegate;

- (SkinObject*)getCurrentSkinObject;

- (void)updateSkinBackgroundColor:(UIColor*)bgColor;

- (void)updateSkinBackgroundImage:(NSString*)imageName;

@end
