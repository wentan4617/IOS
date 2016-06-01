//
//  AppDelegate.m
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UIViewController *uv = [[UIViewController alloc]init];
    [uv.view setBackgroundColor:[UIColor whiteColor]];
    
    self.window.rootViewController = uv;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
