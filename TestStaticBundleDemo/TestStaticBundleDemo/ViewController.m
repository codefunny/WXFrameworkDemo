//
//  ViewController.m
//  TestStaticBundleDemo
//
//  Created by wenchao on 16/2/23.
//  Copyright © 2016年 wenchao. All rights reserved.
//

#import "ViewController.h"
#import "WXTestController.h"
#import "WXBundleManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showToast:(UIButton*)sender {
    WXTestController* controller = [[WXTestController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
    WXBundleManager* mgr = [WXBundleManager shareInstance];
    NSLog(@"%@",mgr.bundlePath);
}

@end
