//
//  WXBundleManager.m
//  TestBundle
//
//  Created by wenchao on 16/2/22.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "WXFrameBundleManager.h"

@interface WXFrameBundleManager ()


@end

@implementation WXFrameBundleManager
@synthesize bundlePath = _bundlePath;

+ (instancetype)shareInstance {
    static WXFrameBundleManager* instance = nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance ;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

+ (NSBundle*)frameBundle {
    NSString* path = [WXFrameBundleManager shareInstance].bundlePath;
    NSBundle* bundle = [NSBundle bundleWithPath:path];
    
    return bundle;
}

- (NSString*)bundlePath {
    if (!_bundlePath) {
        _bundlePath = [self defaultBundlePath];
    }
    
    return _bundlePath ;
}

- (NSString*)resourcePath {
    if (!_resourcePath) {
        _resourcePath = [self defaultResourceBundle];
    }
    
    return _resourcePath;
}

- (NSString*)defaultBundlePath {
    NSString* bundlePath = [NSBundle mainBundle].privateFrameworksPath;
    NSString* mainPath = [bundlePath stringByAppendingFormat:@"/%@",kFrameworkName];
    return mainPath;
}

- (NSString*)defaultResourceBundle {
    return kResourceBundleName;
}

@end
