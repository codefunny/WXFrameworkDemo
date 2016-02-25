//
//  WXTestController.m
//  TestBundle
//
//  Created by wenchao on 16/2/22.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "WXTestController.h"

@interface WXTestController ()

@end

@implementation WXTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"click me" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor cyanColor]];
        button;
    });
    
    button1.frame = CGRectMake(10, 100, 80, 40);
    [button1 addTarget:self action:@selector(showToast:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIImageView* imageView = ({
        UIImageView* imgView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleToFill;
        
        imgView;
    });
    imageView.image = [UIImage imageNamed:@"TestBundle.Bundle/about_yy_logo"];
    imageView.frame = CGRectMake(20, 150, 100, 100);
    [self.view addSubview:imageView];
    
    UIImageView* imageView1 = ({
        UIImageView* imgView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleToFill;
        
        imgView;
    });

    imageView1.image = WXImageNamed(@"about_yy_logo");
    imageView1.frame = CGRectMake(20, 250, 100, 100);
    [self.view addSubview:imageView1];
}

- (void)showToast:(UIButton *)sender {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *filtPath = [fileMgr currentDirectoryPath];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"hello" message:filtPath preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
