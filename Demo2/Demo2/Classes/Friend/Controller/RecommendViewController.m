//
//  RecommendViewController.m
//  Demo2
//
//  Created by went_macbook on 16/6/2.
//  Copyright © 2016年 went. All rights reserved.
//

#import "RecommendViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RecommendCategoryModel.h"
#import "RecommendCategoryTableViewCell.h"
#import "RecommendUserModel.h"
#import "RecommendUserTableViewCell.h"
#import "MJRefresh.h"

#define currentSelectedCategory self.categories[self.leftTableView.indexPathForSelectedRow.row]

@interface RecommendViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property(nonatomic,strong) NSMutableArray *categories;
@property(nonatomic,strong) NSMutableDictionary *params;
@property(nonatomic,strong) AFHTTPSessionManager *afManager;


@end

@implementation RecommendViewController

static NSString * const LeftCategoryID = @"leftCategoryID";
static NSString * const RightUserID = @"RightUserID";


- (AFHTTPSessionManager *)afManager{
    if (_afManager) {
        return _afManager;
    }
    
    return _afManager = [AFHTTPSessionManager manager];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:LeftCategoryID];
   [self.rightTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendUserTableViewCell class]) bundle:nil] forCellReuseIdentifier:RightUserID];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.leftTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.rightTableView.contentInset = self.leftTableView.contentInset;
    self.rightTableView.rowHeight = 70;
    
    
    self.navigationItem.title = @"Recommend";
    self.view.backgroundColor = GlobalBgColor;
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"loading..."];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [self.afManager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            self.categories = [RecommendCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            [self.leftTableView reloadData];
            
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
            [self.rightTableView.mj_header beginRefreshing];
            [SVProgressHUD dismiss];
        }
     
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"errors"];
    }];
    
   
    [self setupRefresh];
    
}


#pragma mark - setup refresh header and footer

- (void)setupRefresh{
    self.rightTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadUsers)];
    
    self.rightTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
    self.rightTableView.mj_footer.hidden = YES;
    
}

- (void) checkFooterStatus{
    RecommendCategoryModel *category = currentSelectedCategory;
    self.rightTableView.mj_footer.hidden = (category.usersArray.count == 0);
    
    if(category.usersArray.count == category.totalUserCount) {
        [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.rightTableView.mj_footer endRefreshing];
    }
}

- (void) loadUsers{
    /**
     1 获取当前选择的category
    
     2 load new data
     
     3 check footer status
     
     4 end header refersh
    */
    
    RecommendCategoryModel *category = currentSelectedCategory;
    category.currentPage = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.id);
    params[@"page"] = @(category.currentPage);
    self.params = params;
    [self.afManager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // replace old data
            category.usersArray = [RecommendUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            category.totalUserCount = [responseObject[@"total"] integerValue];
            if (params != self.params) {
                return;
            }
            [self.rightTableView reloadData];
            [self.rightTableView.mj_header endRefreshing];
            [self checkFooterStatus];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
            [SVProgressHUD showErrorWithStatus:@"loading failure"];
            
    }];
    
    
}
- (void) loadMoreUsers{
    RecommendCategoryModel *category = currentSelectedCategory;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.id);
    params[@"page"] = @(++category.currentPage);
    self.params = params;
    [self.afManager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   
                   
                   
                   // replace old data
                   [category.usersArray addObjectsFromArray:[RecommendUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
                   if (params != self.params) {
                       return;
                   }
                   [self.rightTableView reloadData];
                   [self checkFooterStatus];
                   
                   
               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   
                   [SVProgressHUD showErrorWithStatus:@"loading failure"];
                   
               }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return  self.categories.count;
    }
    
        RecommendCategoryModel *category = currentSelectedCategory;
        return category.usersArray.count;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView) {
        RecommendCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LeftCategoryID];
        cell.category = self.categories[indexPath.row];
        return cell;
    } else {
        RecommendUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RightUserID];
        RecommendCategoryModel *c = currentSelectedCategory;
        NSMutableArray *users = c.usersArray;
        cell.userModel = users[indexPath.row];
        return cell;
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.rightTableView.mj_footer endRefreshing];
    [self.rightTableView.mj_header endRefreshing];
    self.rightTableView.mj_footer.hidden = YES;
    
    RecommendCategoryModel *category = currentSelectedCategory;
    if (category.usersArray.count) {
        [self.rightTableView reloadData];
        [self checkFooterStatus];
    }else{
        [self.rightTableView reloadData];
        [self.rightTableView.mj_header beginRefreshing];
        
    }
    
    
}

- (void)dealloc{
    [self.afManager.operationQueue cancelAllOperations];
}


@end
