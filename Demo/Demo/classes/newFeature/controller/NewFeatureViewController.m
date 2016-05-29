//
//  NewFeatureViewController.m
//  Demo
//
//  Created by went_macbook on 16/5/29.
//  Copyright © 2016年 went. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "MainTabBarController.h"


@interface NewFeatureViewController()<UIScrollViewDelegate>

@property(nonatomic,weak) UIScrollView *sv;
@property(nonatomic,weak) UIPageControl *pc;

@end
@implementation NewFeatureViewController

static int totalPages = 4;
- (void)viewDidLoad{
  
    UIScrollView *sv = [[UIScrollView alloc]init];
    sv.frame = self.view.bounds;
    CGFloat width = sv.width;
    CGFloat height = sv.height;
    sv.contentSize = CGSizeMake(totalPages*width, 0);
    sv.bounces = NO;
    sv.pagingEnabled = YES;
    sv.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:sv];
    
    for (int i=0; i < totalPages; i++) {
        UIImageView *uv = [[UIImageView alloc]init];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        
        uv.image = image;
        uv.height = height;
        uv.width = width;
        uv.y = 0;
        uv.x = i * width;
        
        if (i == totalPages-1) {
            [self setupLastPage:uv];
        }
        
        [sv addSubview:uv];
    }
    _sv = sv;
    sv.delegate = self;
    
    UIPageControl *pc = [[UIPageControl alloc]init];
    pc.numberOfPages = totalPages;
//    pc.backgroundColor = [UIColor redColor];
    pc.pageIndicatorTintColor = RGBColor(253, 98, 42);
    pc.currentPageIndicatorTintColor = RGBColor(189, 189, 189);
    pc.centerX = 0.5 * width;
    pc.centerY = 0.95 * height;
    _pc = pc;
    [self.view addSubview:pc];
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    double page = scrollView.contentOffset.x / scrollView.width;
    
    self.pc.currentPage = (int)(page + 0.5) ;
    
    
}

- (void)setupLastPage:(UIImageView *)uv{
    uv.userInteractionEnabled = YES;
  
    UIButton *shareBtn = [[UIButton alloc]init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"share to friends" forState:UIControlStateNormal];
    shareBtn.width = 200;
    shareBtn.height = 30;
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    shareBtn.centerX = uv.width * 0.5;
    shareBtn.centerY = uv.height * 0.7;
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [shareBtn addTarget:self action:@selector(shareDidClicke:) forControlEvents:UIControlEventTouchUpInside];
    
    [uv addSubview:shareBtn];
    
    
    
    UIButton *goToBtn = [[UIButton alloc]init];
    [goToBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_button"] forState:UIControlStateNormal];
    [goToBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_button_highlighted"] forState:UIControlStateHighlighted];
    
    goToBtn.size = goToBtn.currentBackgroundImage.size;
    goToBtn.centerX = uv.width * 0.5;
    goToBtn.centerY = uv.height * 0.8;
    
    [goToBtn addTarget:self action:@selector(goToDidClicke) forControlEvents:UIControlEventTouchUpInside];
    
    [uv addSubview:goToBtn];

    
    
    
}






- (void)shareDidClicke:(UIButton *)btn{

    btn.selected = !btn.isSelected;
}

- (void)goToDidClicke{
   
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[MainTabBarController alloc]init];
    
}





@end
