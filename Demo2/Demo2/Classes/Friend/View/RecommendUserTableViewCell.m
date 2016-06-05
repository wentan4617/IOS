//
//  RecommendUserTableViewCell.m
//  Demo2
//
//  Created by went_macbook on 16/6/3.
//  Copyright © 2016年 went. All rights reserved.
//

#import "RecommendUserTableViewCell.h"
#import "RecommendUserModel.h"
#import <UIImageView+WebCache.h>

@interface RecommendUserTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userHeader;
@property (weak, nonatomic) IBOutlet UILabel *userScreenName;
@property (weak, nonatomic) IBOutlet UILabel *userFansNum;

@end
@implementation RecommendUserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUserModel:(RecommendUserModel *)userModel{
    _userModel = userModel;
    self.userFansNum.text = [NSString stringWithFormat:@"%zd",userModel.fans_count];
    self.userScreenName.text = userModel.screen_name;
    [self.userHeader sd_setImageWithURL:[NSURL URLWithString:userModel.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    
}

@end
