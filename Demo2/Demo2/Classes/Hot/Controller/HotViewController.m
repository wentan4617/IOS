//
//  HotViewController.m
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import "HotViewController.h"
#import "RecommendTagsViewController.h"

@interface HotViewController ()

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GlobalBgColor;
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:@"MainTagSubIcon" selectedImage:@"MainTagSubIconClick" target:self action:@selector(leftDidClick)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIViewController *red = [[UIViewController alloc]init];
    [red.view setBackgroundColor:[UIColor redColor]];
    [self.navigationController pushViewController:red animated:YES];
}

- (void)leftDidClick{
    RecommendTagsViewController *recommendTags = [[RecommendTagsViewController alloc]init];
    [self.navigationController pushViewController:recommendTags animated:YES];
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
