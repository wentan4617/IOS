//
//  MyDorpMenuView.h
//  Demo
//
//  Created by went_macbook on 16/5/25.
//  Copyright © 2016年 went. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyDorpMenuView;

@protocol DropMenuDelegate <NSObject>

-(void)arrowUp:(MyDorpMenuView *)menu;

-(void)arrowDown:(MyDorpMenuView *)menu;

@end

@interface MyDorpMenuView : UIView

@property(nonatomic,weak) id<DropMenuDelegate> delegate;

@property(nonatomic,strong) UIViewController *contentController;
@property(nonatomic,strong)UIView *content;

+(instancetype) menu;



-(void)showMenu:(UIView *)from;

-(void)dismiss;

@end
