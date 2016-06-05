//
//  RecommendTagsTableViewCell.m
//  Demo2
//
//  Created by went_macbook on 16/6/5.
//  Copyright © 2016年 went. All rights reserved.
//

#import "RecommendTagsTableViewCell.h"
#import "RecommendTagsModel.h"
#import "UIImageView+WebCache.h"

@interface RecommendTagsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *list_image;
@property (weak, nonatomic) IBOutlet UILabel *theme_name;
@property (weak, nonatomic) IBOutlet UILabel *sub_number;

@end
@implementation RecommendTagsTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTagModel:(RecommendTagsModel *)tagModel{
    [self.list_image sd_setImageWithURL:[NSURL URLWithString:tagModel.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.sub_number.text = [NSString stringWithFormat:@"%zd",tagModel.sub_number];
    self.theme_name.text = tagModel.theme_name;
    
}

- (void)setFrame:(CGRect)frame{
    
    frame.origin.x = 5;
    frame.size.width -= 2* frame.origin.x;
    frame.size.height -= 2;
    [super setFrame:frame];
}

@end
