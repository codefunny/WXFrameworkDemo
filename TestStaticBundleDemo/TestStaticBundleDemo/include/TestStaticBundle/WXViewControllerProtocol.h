//
//  WXViewControllerProtocol.h
//  TestBundle
//
//  Created by wenchao on 16/2/22.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol WXViewControllerProtocol <NSObject>

+ (id)wxViewController ;

@optional
+ (id)wxViewControllerWithBundle:(NSBundle*)bundle;

@end
