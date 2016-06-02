//
//  MyNavigationController.m
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

+ (void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([self childViewControllers].count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *back = [[UIButton alloc]init];
        [back setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [back setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [back setTitle:@"Back" forState:UIControlStateNormal];
        [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [back setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        back.size = CGSizeMake(70, 30);
        back.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        back.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:back];
        
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

@end
