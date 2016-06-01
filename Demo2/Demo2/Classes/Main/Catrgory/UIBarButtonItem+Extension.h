//
//  UIBarButtonItem+Extension.h
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(instancetype) barButtonItemWith:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action;
@end
