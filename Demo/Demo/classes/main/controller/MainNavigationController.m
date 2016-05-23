//
//  MainNavigationController.m
//  Demo
//
//  Created by went_macbook on 16/5/23.
//  Copyright © 2016年 went. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)initialize{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *textDic = [[NSMutableDictionary alloc]init];
    textDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textDic[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    NSMutableDictionary *disableDic = [[NSMutableDictionary alloc]init];
    disableDic[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableDic[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    [item setTitleTextAttributes:textDic forState:UIControlStateNormal];
    [item setTitleTextAttributes:disableDic forState:UIControlStateDisabled];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if(self.childViewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
       
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(back) image:@"navigationbar_back" selectedImage:@"navigationbar_back_highlighted"];
      
       
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(backToHome) image:@"navigationbar_more" selectedImage:@"navigationbar_more_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

-(void)backToHome{
    [self popToRootViewControllerAnimated:YES];
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
