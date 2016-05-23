//
//  UIBarButtonItem+Extention.h
//  Demo
//
//  Created by went_macbook on 16/5/23.
//  Copyright © 2016年 went. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extention)

+(UIBarButtonItem *) barButtonItemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage;

-(UIBarButtonItem *) itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end
