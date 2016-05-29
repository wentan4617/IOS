//
//  MyTabBar.m
//  Demo
//
//  Created by went_macbook on 16/5/28.
//  Copyright © 2016年 went. All rights reserved.
//

#import "MyTabBar.h"

@interface MyTabBar()

@property(nonatomic,weak) UIButton *plusBtn;

@end

@implementation MyTabBar


- (instancetype)init{
    self = [super init];
    if (self) {
        
        UIButton *plusBtn = [[UIButton alloc]init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateSelected];
        
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        
        [plusBtn addTarget:self action:@selector(btnOnclick) forControlEvents:UIControlEventTouchUpInside];
        
        self.plusBtn = plusBtn;
        [self addSubview:plusBtn];
        
        
    }
    
    return self;
}

- (void) btnOnclick{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClick:)]) {
        [self.delegate tabBarDidClick:self];
    }

}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.plusBtn.centerX = self.frame.size.width/2;
    self.plusBtn.centerY = self.height/2;
    CGFloat width = self.frame.size.width/5;
    int index = 0;
    
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.x = width * index;
            child.width = width;
            
            index++;
            if(index == 2){
                index ++;
            }

        }
        
        
    }
    
    
    
}


@end
