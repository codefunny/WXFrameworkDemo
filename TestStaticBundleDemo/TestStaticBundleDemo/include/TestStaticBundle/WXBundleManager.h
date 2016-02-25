//
//  WXBundleManager.h
//  TestBundle
//
//  Created by wenchao on 16/2/22.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXBundleManager : NSObject

@property(nonatomic,readwrite) NSString*    bundlePath;

+ (instancetype)shareInstance ;
+ (NSBundle*)frameBundle ;

@end
