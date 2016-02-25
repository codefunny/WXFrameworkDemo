//
//  WXBundleManager.h
//  TestBundle
//
//  Created by wenchao on 16/2/22.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* const kFrameworkName = @"TestBundle.framework";
static NSString* const kResourceBundleName = @"TestBundle.Bundle";

@interface WXFrameBundleManager : NSObject

@property(nonatomic,readwrite) NSString*    bundlePath;
@property(nonatomic,readwrite) NSString*    resourcePath;

+ (instancetype)shareInstance ;
+ (NSBundle*)frameBundle ;

@end
