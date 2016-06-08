//
//  FriendViewController.m
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import "FriendViewController.h"
#import "RecommendViewController.h"
#import "LoginRigisterViewController.h"

@interface FriendViewController ()

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GlobalBgColor;
    
    self.navigationItem.title = @"Subscribs";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:@"friendsRecommentIcon" selectedImage:@"friendsRecommentIcon-click" target:self action:@selector(leftDidClick)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftDidClick{
    RecommendViewController *recommend = [[RecommendViewController alloc]init];
    [self.navigationController pushViewController:recommend animated:YES];
}
- (IBAction)loginOrRigister:(id)sender {
    LoginRigisterViewController *vc = [[LoginRigisterViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
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
