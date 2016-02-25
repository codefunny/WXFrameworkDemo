//
//  ViewController.m
//  WXTestBundleDemo
//
//  Created by wenchao on 16/2/22.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "ViewController.h"
#import <TestBundle/TestBundle.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button1 = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"push" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor cyanColor]];
        button;
    });
    
    button1.frame = CGRectMake(30, 100, 80, 40);
    [button1 addTarget:self action:@selector(showToast:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIImageView* imageView1 = ({
        UIImageView* imgView = [[UIImageView alloc] init];
        imageView1.contentMode = UIViewContentModeScaleToFill;
        
        imgView;
    });
    //    NSString*filePath = [[WXBundleManager shareInstance] bundlePath];
    //    filePath = [filePath stringByAppendingPathComponent:@"Images"];
    //    NSLog(@"path:%@",[filePath stringByAppendingString: @"/yy_icon"]);
    imageView1.image = [UIImage imageNamed:@"TestBundle.Bundle/about_yy_logo"];
    imageView1.frame = CGRectMake(20, 250, 100, 100);
    [self.view addSubview:imageView1];
}

- (void)showToast:(UIButton *)sender {

    [[WXFrameBundleManager shareInstance] setResourcePath:@"TestBundle.Bundle"];
    WXTestController* controller = [WXTestController wxNibViewController];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
