//
//  AppDelegate.m
//  demo3
//
//  Created by went_macbook on 16/5/22.
//  Copyright © 2016年 went. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tbController = [[UITabBarController alloc]init];
    self.window.rootViewController = tbController;
    HomeTableViewController *home = [[HomeTableViewController alloc]init];
    [self addVc:home withTitle:@"home" withImage:@"tabbar_home" withSelectedImage:@"tabbar_home_highlighted"];
    MessageTableViewController *message = [[MessageTableViewController alloc]init];
    [self addVc:message withTitle:@"message" withImage:@"tabbar_message_center" withSelectedImage:@"tabbar_message_center_highlighted"];

    DiscoverTableViewController *discover = [[DiscoverTableViewController alloc]init];
    [self addVc:discover withTitle:@"discover" withImage:@"tabbar_discover" withSelectedImage:@"tabbar_discover_highlighted"];

    ProfileTableViewController *profile = [[ProfileTableViewController alloc]init];
    [self addVc:profile withTitle:@"profile" withImage:@"tabbar_profile" withSelectedImage:@"tabbar_profile_highlighted"];

    
    
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

-(void)addVc:(UIViewController *)childController withTitle:(NSString *)title withImage:(NSString *)image withSelectedImage:(NSString *)selectedImage{
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableDictionary *textDic = [[NSMutableDictionary alloc]init];
    textDic[NSForegroundColorAttributeName] = RGBColor(123, 123, 123);
    [childController.tabBarItem setTitleTextAttributes:textDic forState:UIControlStateNormal];
    NSMutableDictionary *selectTextDIc = [[NSMutableDictionary alloc]init];
    selectTextDIc[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childController.tabBarItem setTitleTextAttributes:selectTextDIc forState:UIControlStateSelected];
    [self.window.rootViewController addChildViewController:childController];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
