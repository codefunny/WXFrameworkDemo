//
//  WXFrameViewControllerProtocol.h
//  TestBundle
//
//  Created by wenchao on 16/2/22.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WXFrameBundleManager;
@protocol WXFrameViewControllerProtocol <NSObject>

//通过Xib方式创建UIViewController
+ (id)wxNibViewController ;

@optional
+ (id)wxNibViewControllerWithBundleManager:(WXFrameBundleManager*)bundleMgr;

@end
