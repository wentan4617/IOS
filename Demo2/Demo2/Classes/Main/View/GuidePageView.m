//
//  GuidePageView.m
//  Demo2
//
//  Created by went_macbook on 16/6/8.
//  Copyright © 2016年 went. All rights reserved.
//

#import "GuidePageView.h"

@implementation GuidePageView

//版本号对应的key
static NSString * const key = @"CFBundleShortVersionString";

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)guidePage{
    GuidePageView *guidePage = [[[NSBundle mainBundle] loadNibNamed:@"GuidePageView" owner:nil options:nil] lastObject];
    return guidePage;
}

+ (void)show{
    // 获取当前软件版本
    NSString *currentVision = [NSBundle mainBundle].infoDictionary[key];
    
    
    //获取沙盒软件版本
    NSString *sandBoxVision = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    //逻辑判读
    if (![currentVision isEqualToString:sandBoxVision]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        GuidePageView *guidePage = [GuidePageView guidePage];
        guidePage.frame = window.bounds;
        [window addSubview:guidePage];
        [[NSUserDefaults standardUserDefaults] setObject:currentVision forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}
- (IBAction)dismiss {
    
    [self removeFromSuperview];
    
}



@end
