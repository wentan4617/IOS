//
//  MyTabBar.h
//  Demo
//
//  Created by went_macbook on 16/5/28.
//  Copyright © 2016年 went. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyTabBar;

@protocol MyTabBarDelegate <UITabBarDelegate>

-(void)tabBarDidClick:(MyTabBar *)tabBar;

@end

@interface MyTabBar : UITabBar

@property(nonatomic,weak) id<MyTabBarDelegate> delegate;

@end
