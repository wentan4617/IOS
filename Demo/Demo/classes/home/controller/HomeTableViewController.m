//
//  HomeTableViewController.m
//  Demo
//
//  Created by went_macbook on 16/5/22.
//  Copyright © 2016年 went. All rights reserved.
//

#import "HomeTableViewController.h"
#import "FirstViewController.h"
#import "MyDorpMenuView.h"
#import "DropMenuTableViewController.h"

@interface HomeTableViewController () <DropMenuDelegate>


@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(searchFriends) image:@"navigationbar_friendsearch" selectedImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(scan) image:@"navigationbar_pop" selectedImage:@"navigationbar_pop_highlighted"];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    
    [btn setTitle:@"HOME" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
	
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
    
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = btn;
    
    
}

-(void)scan{
    
}
-(void)searchFriends{
    
}
-(void)onClick:(UIView *) btn{
    MyDorpMenuView *menuView = [MyDorpMenuView menu];
    menuView.delegate = self;
    
    DropMenuTableViewController *menu = [[DropMenuTableViewController alloc]init];
    
 
    menu.view.frame = CGRectMake(0, 0, 150, 180);
    
    menuView.contentController = menu;
     
    
    [menuView showMenu:btn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %ld",@"HOME TableView --------",indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstViewController *first = [[FirstViewController alloc]init];
//    NSLog(@"%ld",self.navigationController.childViewControllers.count);
//    if (self.navigationController.childViewControllers.count > 1) {
//        self.hidesBottomBarWhenPushed = YES;
//    }
//    first.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:first animated:YES];
    
}

- (void)arrowUp:(MyDorpMenuView *)menu{
    UIButton *btn = (UIButton *)self.navigationItem.titleView;
    btn.selected = YES;
    
}
- (void)arrowDown:(MyDorpMenuView *)menu{
    UIButton *btn = (UIButton *)self.navigationItem.titleView;
    btn.selected = NO;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:i forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
