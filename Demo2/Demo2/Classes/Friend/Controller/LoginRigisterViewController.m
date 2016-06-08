//
//  LoginRigisterViewController.m
//  Demo2
//
//  Created by went_macbook on 16/6/7.
//  Copyright © 2016年 went. All rights reserved.
//

#import "LoginRigisterViewController.h"

@interface LoginRigisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerLeading;


@end

@implementation LoginRigisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerDidClick:(id)sender {
    [self.view endEditing:YES];
    if (self.loginLeading.constant == 0) {
         self.loginLeading.constant = -self.view.width;
       
    } else {
        self.loginLeading.constant = 0;
        
    }
   
  [UIView animateWithDuration:0.2 animations:^{
      [self.view layoutIfNeeded];
  }];
    
    
}
- (IBAction)back:(id)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
