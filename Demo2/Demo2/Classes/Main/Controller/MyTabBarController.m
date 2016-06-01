//
//  MyTabBarController.m
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import "MyTabBarController.h"
#import "HotViewController.h"
#import "FriendViewController.h"
#import "NewViewController.h"
#import "MeViewController.h"
#import "MyNavigationController.h"
#import "MyTabBar.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabBar];
    
    [self setupTabBarApparance];
    
    MyTabBar *tabBar = [[MyTabBar alloc]init];
    [self setValue:tabBar forKey:@"tabBar"];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTabBar{
    
    
    HotViewController *hot = [[HotViewController alloc]init];
    [self addController:hot withImageName:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" tabBarName:@"HOT" navName:@"HOT"];
    NewViewController *new = [[NewViewController alloc]init];
    [self addController:new withImageName:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" tabBarName:@"NEW" navName:@"NEW"];
    FriendViewController *friend = [[FriendViewController alloc]init];
    [self addController:friend withImageName:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" tabBarName:@"Friend" navName:@"Friend"];
    MeViewController *me = [[MeViewController alloc]init];
    [self addController:me withImageName:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" tabBarName:@"ME" navName:@"ME"];
    
    
    
}

- (void)addController:(UIViewController *)controller withImageName:(NSString *)image selectedImage:(NSString *)selecedImage tabBarName:(NSString *)tabBarName navName:(NSString *)navName{
    
    [controller.tabBarItem setImage:[UIImage imageNamed:image]];
    [controller.tabBarItem setSelectedImage:[UIImage imageNamed:selecedImage]];
    controller.tabBarItem.title = tabBarName;
    controller.navigationItem.title = navName;
    
    MyNavigationController *nav = [[MyNavigationController alloc]initWithRootViewController:controller];
   
 
    
    [self addChildViewController:nav];
}

- (void)setupTabBarApparance{
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    NSMutableDictionary *nomalDic = [[NSMutableDictionary alloc]init];
    nomalDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    nomalDic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [item setTitleTextAttributes:nomalDic forState:UIControlStateNormal];
    
    NSMutableDictionary *clickDic = [[NSMutableDictionary alloc]init];
    clickDic[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    [item setTitleTextAttributes:clickDic forState:UIControlStateSelected];
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
