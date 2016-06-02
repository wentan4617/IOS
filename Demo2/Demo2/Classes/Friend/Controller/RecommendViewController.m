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
#import "RecommandCategoryModel.h"
#import "RecommandCategoryTableViewCell.h"

@interface RecommendViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property(nonatomic,strong) NSMutableArray *categories;

@end

@implementation RecommendViewController

static NSString * const LeftCategoryID = @"leftCategoryID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommandCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:LeftCategoryID];
  
    self.leftTableView.tableFooterView = [[UIView alloc]init];
    self.leftTableView.backgroundColor = GlobalBgColor;
    
    
    self.navigationItem.title = @"Recommend";
    self.view.backgroundColor = GlobalBgColor;
    
    [SVProgressHUD showWithStatus:@"loading..."];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            self.categories = [RecommandCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            [self.leftTableView reloadData];
            
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
            
            [SVProgressHUD dismiss];
        }
     
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"errors"];
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
    return  self.categories.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecommandCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LeftCategoryID];
    cell.category = self.categories[indexPath.row];
    return cell;
}


@end
