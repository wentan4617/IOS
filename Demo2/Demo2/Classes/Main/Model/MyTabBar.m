//
//  MyTabBaar.m
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import "MyTabBar.h"

@interface MyTabBar ()


@property(nonatomic,strong) UIButton *plus;

@end

@implementation MyTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        
        UIButton *plus = [UIButton buttonWithType:UIButtonTypeCustom];
       
        [plus setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
      
        [plus setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        plus.size = plus.currentBackgroundImage.size;
        [plus addTarget:self action:@selector(plusDidClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plus];
        self.plus = plus;
    }
    return self;
}

- (void) plusDidClick{
    LogFunction;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    int index = 0;
    CGFloat width = self.frame.size.width/5;
    
    self.plus.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    for (UIView *uv in self.subviews) {
        if (uv != self.plus && [uv isKindOfClass:[UIControl class]]){
            
            uv.X = (index>1?(index+1):index) * width;
            uv.Y = 0;
            uv.width = width;
            index ++;
        }
    }
    
}

@end
