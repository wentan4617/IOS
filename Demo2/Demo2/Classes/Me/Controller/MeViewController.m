//
//  MeViewController.m
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GlobalBgColor;
    
    self.navigationItem.title = @"ME";
    
    UIBarButtonItem *mine = [UIBarButtonItem barButtonItemWith:@"mine-setting-icon" selectedImage:@"mine-setting-icon-click" target:self action:@selector(mineDidClick)];
    UIBarButtonItem *moon = [UIBarButtonItem barButtonItemWith:@"mine-moon-icon" selectedImage:@"mine-moon-icon-click" target:self action:@selector(moonDidClick)];
    
    self.navigationItem.rightBarButtonItems = @[mine,moon];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mineDidClick{
    LogFunction;
}
- (void)moonDidClick{
    LogFunction;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
