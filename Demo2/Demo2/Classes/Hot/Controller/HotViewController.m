//
//  HotViewController.m
//  Demo2
//
//  Created by went_macbook on 16/6/1.
//  Copyright © 2016年 went. All rights reserved.
//

#import "HotViewController.h"
#import "RecommendTagsViewController.h"
#import "AllViewController.h"
#import "VideoViewController.h"
#import "VoiceViewController.h"
#import "WordViewController.h"
#import "PictureViewController.h"


@interface HotViewController () <UIScrollViewDelegate>

@property(nonatomic,strong) UIButton *currentBtn;
@property(nonatomic,strong) UIView *indicator;
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIView *topicBar;


@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNav];
    
    [self setupTopic];
    
    [self setupChildControllers];
    
    [self setupScrollView];
    
}



- (void)setupNav{
    
    self.view.backgroundColor = GlobalBgColor;
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:@"MainTagSubIcon" selectedImage:@"MainTagSubIconClick" target:self action:@selector(leftDidClick)];
    
}

- (void)setupTopic{
    
    NSArray *topics = @[@"All",@"Video",@"Voice",@"Picture",@"Word"];

    //在navigationbar下面放一个白色透明的工具栏
    UIView *topicBar = [[UIView alloc]init];
    self.topicBar = topicBar;
    topicBar.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.8];
    topicBar.Y = 64;
    topicBar.width = self.view.width;
    topicBar.height = 35;
    
    //设置选中按钮的indicator
    UIView *indicator = [[UIView alloc]init];
    indicator.backgroundColor = [UIColor redColor];
    indicator.height = 2;
    indicator.Y = topicBar.height - indicator.height;
    self.indicator = indicator;
    
    
    //初始化topic按钮
    CGFloat width = self.view.width / topics.count;
    CGFloat height = topicBar.height;
    for (int i = 0; i < topics.count; i++) {
        UIButton *topic = [[UIButton alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
        topic.tag = i;
        [topic setTitle:topics[i] forState:UIControlStateNormal];
        [topic setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [topic setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [topic addTarget:self action:@selector(topicDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        if (i == 0) {
            topic.enabled = NO;
            self.currentBtn = topic;
            
            //强制计算号titleLable的值
            [topic.titleLabel sizeToFit];
            //给选中按钮加上indicator
            indicator.width = topic.titleLabel.width;
            indicator.centerX = topic.centerX;
            
        }
        [topicBar addSubview:topic];
    }
    [topicBar addSubview:indicator];
    [self.view addSubview:topicBar];
    
    
    
}

- (void)setupChildControllers{
    AllViewController *all = [[AllViewController alloc]init];
    VoiceViewController *voice = [[VoiceViewController alloc]init];
    VideoViewController *video = [[VideoViewController alloc]init];
    WordViewController *word = [[WordViewController alloc]init];
    PictureViewController *picture = [[PictureViewController alloc]init];
    
    [self setValue:@[all,video,voice,picture,word] forKey:@"childViewControllers"];
    
    
    
    
}

- (void)setupScrollView{
    //取消自动调整内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = CGSizeMake(scrollView.width * self.childViewControllers.count, 0);
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    self.scrollView = scrollView;
    //将scrollView加到首层
    [self.view insertSubview:scrollView atIndex:0];
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    
}

- (void)topicDidClick:(UIButton *)btn{
    //设置选中按钮的字体为红色，并禁止继续点击
    self.currentBtn.enabled = YES;
    btn.enabled = NO;
    self.currentBtn = btn;
    
    //给选中按钮加上indicator
    
    [UIView animateWithDuration:0.5 animations:^{
        self.indicator.width = btn.titleLabel.width;
        self.indicator.centerX = btn.centerX;
    }];
    
    //滚动到相应的页面 显示内容
    [self.scrollView setContentOffset:CGPointMake(self.view.width * btn.tag, 0) animated:YES];
//    [self scrollViewDidEndScrollingAnimation:self.scrollView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIViewController *red = [[UIViewController alloc]init];
//    [red.view setBackgroundColor:[UIColor redColor]];
//    [self.navigationController pushViewController:red animated:YES];
//}

- (void)leftDidClick{
    RecommendTagsViewController *recommendTags = [[RecommendTagsViewController alloc]init];
    [self.navigationController pushViewController:recommendTags animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
   
    
    [self topicDidClick:self.topicBar.subviews[index]];
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / self.view.width;
    
    UITableViewController *tableVC = self.childViewControllers[index];
    tableVC.view.X = scrollView.contentOffset.x;
    tableVC.view.Y = 0;
    tableVC.view.width = scrollView.width;
    
    tableVC.view.height = scrollView.height;
    
    tableVC.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.topicBar.frame), 0, self.tabBarController.tabBar.height, 0);
    tableVC.tableView.scrollIndicatorInsets = tableVC.tableView.contentInset;
    
    
    [scrollView addSubview:tableVC.view];
    
    
}









@end
