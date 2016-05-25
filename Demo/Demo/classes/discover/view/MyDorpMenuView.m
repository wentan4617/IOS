//
//  MyDorpMenuView.m
//  Demo
//
//  Created by went_macbook on 16/5/25.
//  Copyright © 2016年 went. All rights reserved.
//

#import "MyDorpMenuView.h"

@interface MyDorpMenuView()

@property(nonatomic,weak) UIImageView *containerView;



@end

@implementation MyDorpMenuView

-(UIImageView *)containerView{
    if (!_containerView) {
        UIImageView *containerView = [[UIImageView alloc]init];
        
        UIImage *bgImage = [UIImage imageNamed:@"popover_background"];
        
        containerView.image = bgImage;
        
        containerView.userInteractionEnabled = YES;
        
        [self addSubview:containerView];
        
        _containerView = containerView;
    }
    
    
    return _containerView;
}

+ (instancetype)menu{
    MyDorpMenuView *view =  [[MyDorpMenuView alloc]init];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

- (void)setContent:(UIView *)content{
    //test if necessay?
    _content = content;
    
   
//        
    self.content.frame = CGRectMake(10, 15, content.frame.size.width, content.frame.size.height);
    
    
    self.containerView.frame = CGRectMake(0, 0, self.content.frame.size.width+20, self.content.frame.size.height+26);
    
    // 调整内容的位置
//    content.x = 10;
//    content.y = 15;
//    
//    // 调整内容的宽度
//    //    content.width = self.containerView.width - 2 * content.x;
//    
//    // 设置灰色的高度
//    self.containerView.height = CGRectGetMaxY(content.frame) + 11;
//    // 设置灰色的宽度
//    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    [self.containerView addSubview:content];
    
    
}

- (void)setContentController:(UIViewController *)contentController{
   //test if necessary?
    _contentController = contentController;
    self.content = self.contentController.view;
}


-(void)showMenu:(UIView *)from{
    UIWindow *window = [[UIApplication sharedApplication] windows].lastObject;
    
    
    
    [window addSubview:self];
  
    
    self.frame = window.bounds;
    
    
    CGRect newFrame = [from convertRect:from.bounds toView:window];
   
    
    
    self.containerView.center = CGPointMake(CGRectGetMidX(newFrame), self.containerView.center.y);
    self.containerView.frame = CGRectMake(self.containerView.frame.origin.x, CGRectGetMaxY(newFrame),self.containerView.frame.size.width,self.content.frame.size.height);
//
//    self.containerView.centerX = CGRectGetMidX(newFrame);
//    self.containerView.y = CGRectGetMaxY(newFrame);
    if ([self.delegate respondsToSelector:@selector(arrowUp:)]) {
        [self.delegate arrowUp:self];
    }
    
 }


- (void)dismiss{
    [self removeFromSuperview];
    if ([self.delegate respondsToSelector:@selector(arrowDown:)]) {
        [self.delegate arrowDown:self];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}








@end
