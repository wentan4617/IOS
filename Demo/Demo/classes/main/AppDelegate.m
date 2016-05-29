//
//  AppDelegate.m
//  demo3
//
//  Created by went_macbook on 16/5/22.
//  Copyright © 2016年 went. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "NewFeatureViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
//    MainTabBarController *tbController = [[MainTabBarController alloc]init];
    
//    self.window.rootViewController = tbController;
    
//    NewFeatureViewController *newFeature = [[NewFeatureViewController alloc]init];
//    self.window.rootViewController = newFeature;
    NSString *key = @"CFBundleVersion";
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    NSLog(@"%@   %@",lastVersion,currentVersion);
    
    
    if ([lastVersion isEqualToString:currentVersion]) {
        MainTabBarController *tbController = [[MainTabBarController alloc]init];
        self.window.rootViewController = tbController;
    } else {
        NewFeatureViewController *newFeature = [[NewFeatureViewController alloc]init];
        self.window.rootViewController = newFeature;
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
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
