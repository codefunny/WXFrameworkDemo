//
//  WXBaseViewController.m
//  TestBundle
//
//  Created by wenchao on 16/2/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "WXFrameBaseViewController.h"
#import "WXFrameBundleManager.h"

@interface WXFrameBaseViewController ()

@property (nonatomic,strong)WXFrameBundleManager* bundleMgr;

@end

@implementation WXFrameBaseViewController

+ (id)wxNibViewController {
    
    return [self wxNibViewControllerWithBundleManager:nil];
}

+ (id)wxNibViewControllerWithBundleManager:(WXFrameBundleManager *)bundleMgr {
    
    WXFrameBaseViewController* controller = [[self alloc] initWithNibBundleManager:bundleMgr];
    
    return controller;
}

- (id)initWithNibBundleManager:(WXFrameBundleManager*)bundleMgr {
    self.bundleMgr = bundleMgr;
    if (!bundleMgr) {
        self.bundleMgr = [WXFrameBundleManager shareInstance];
    }
    
    NSBundle* bundle = [self xibBundle];
    NSAssert(bundle, @"WXBundleManager bundlePath should not be nil");
    self =[super initWithNibName:NSStringFromClass([self class]) bundle:bundle];
    
    return self;
}

- (WXFrameBundleManager*)bundleMgr {
    if (!_bundleMgr) {
        _bundleMgr = [WXFrameBundleManager shareInstance];
    }
    
    return _bundleMgr;
}

- (NSBundle*)xibBundle {
    return [NSBundle bundleWithPath:[self bundlePath]];
}

- (NSString*)bundlePath {
    return self.bundleMgr.bundlePath;
}

- (NSString*)resourcePath {
    return self.bundleMgr.resourcePath ;
}

- (UIImage*) imageWithNamed:(NSString*) named {
    NSString* imagePath = [NSString stringWithFormat:@"%@/%@",self.resourcePath,named];
    return [UIImage imageNamed:imagePath];
}

@end
