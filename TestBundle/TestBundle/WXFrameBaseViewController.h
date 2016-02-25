//
//  WXBaseViewController.h
//  TestBundle
//
//  Created by wenchao on 16/2/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXFrameViewControllerProtocol.h"

#define WXImageNamed(named) [self imageWithNamed:(named)]

@interface WXFrameBaseViewController : UIViewController <WXFrameViewControllerProtocol>

@property (nonatomic,readonly)NSString* bundlePath;
@property (nonatomic,readonly)NSString* resourcePath;

- (UIImage*) imageWithNamed:(NSString*) named;

@end
