//
//  UIBarButtonItem+Extention.m
//  Demo
//
//  Created by went_macbook on 16/5/23.
//  Copyright © 2016年 went. All rights reserved.
//

#import "UIBarButtonItem+Extention.h"

@implementation UIBarButtonItem (Extention)

+(UIBarButtonItem *) barButtonItemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

-(UIBarButtonItem *) itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage {
    return [UIBarButtonItem barButtonItemWithTarget:target action:action image:image selectedImage:selectedImage];
}

@end
