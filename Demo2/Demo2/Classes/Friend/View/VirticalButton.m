//
//  VirticalButton.m
//  Demo2
//
//  Created by went_macbook on 16/6/7.
//  Copyright © 2016年 went. All rights reserved.
//

#import "VirticalButton.h"

@implementation VirticalButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.X = 0;
    self.imageView.Y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    self.titleLabel.X = 0;
    self.titleLabel.Y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}

@end
