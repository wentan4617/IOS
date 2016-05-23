//
//  MainTabBarController.m
//  Demo
//
//  Created by went_macbook on 16/5/23.
//  Copyright © 2016年 went. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTabBar{
    HomeTableViewController *home = [[HomeTableViewController alloc]init];
    [self addVc:home withTitle:@"home" withImage:@"tabbar_home" withSelectedImage:@"tabbar_home_highlighted"];
    MessageTableViewController *message = [[MessageTableViewController alloc]init];
    [self addVc:message withTitle:@"message" withImage:@"tabbar_message_center" withSelectedImage:@"tabbar_message_center_highlighted"];
    
    DiscoverTableViewController *discover = [[DiscoverTableViewController alloc]init];
    [self addVc:discover withTitle:@"discover" withImage:@"tabbar_discover" withSelectedImage:@"tabbar_discover_highlighted"];
    
    ProfileTableViewController *profile = [[ProfileTableViewController alloc]init];
    [self addVc:profile withTitle:@"profile" withImage:@"tabbar_profile"withSelectedImage:@"tabbar_profile_highlighted"];
}


-(void)addVc:(UIViewController *)childController withTitle:(NSString *)title withImage:(NSString *)image withSelectedImage:(NSString *)selectedImage{
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textDic = [[NSMutableDictionary alloc]init];
    textDic[NSForegroundColorAttributeName] = RGBColor(123, 123, 123);
    [childController.tabBarItem setTitleTextAttributes:textDic forState:UIControlStateNormal];
    NSMutableDictionary *selectTextDIc = [[NSMutableDictionary alloc]init];
    selectTextDIc[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childController.tabBarItem setTitleTextAttributes:selectTextDIc forState:UIControlStateSelected];
    
    MainNavigationController *navController = [[MainNavigationController alloc]initWithRootViewController:childController];
    
    [self addChildViewController:navController];
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
