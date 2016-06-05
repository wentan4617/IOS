//
//  RecommendTagsViewController.m
//  Demo2
//
//  Created by went_macbook on 16/6/5.
//  Copyright © 2016年 went. All rights reserved.
//

#import "RecommendTagsViewController.h"
#import <AFNetWorking.h>
#import "RecommendTagsTableViewCell.h"
#import <MJExtension.h>
#import "RecommendTagsModel.h"
#import <SVProgressHUD.h>


@interface RecommendTagsViewController ()

@property(nonatomic,strong) NSMutableArray *recommendTags;

@end

@implementation RecommendTagsViewController
static NSString * const tagId = @"RecommendTag";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    
    [self loadData];
    
}

-(void)setupTableView{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendTagsTableViewCell class]) bundle:nil] forCellReuseIdentifier:tagId];
    self.title = @"Recommend Tags";
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = GlobalBgColor;
    [SVProgressHUD showWithStatus:@"loading"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
   
}

- (void)loadData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.recommendTags = [RecommendTagsModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
        [SVProgressHUD showErrorWithStatus:@"faliure"];
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return self.recommendTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RecommendTagsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tagId forIndexPath:indexPath];
    cell.tagModel = self.recommendTags[indexPath.row];
    return cell;
}

@end
