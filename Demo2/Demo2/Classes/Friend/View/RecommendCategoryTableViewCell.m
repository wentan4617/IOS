//
//  RecommandCategoryTableViewCell.m
//  Demo2
//
//  Created by went_macbook on 16/6/2.
//  Copyright © 2016年 went. All rights reserved.
//

#import "RecommendCategoryTableViewCell.h"
#import "RecommendCategoryModel.h"

@interface RecommendCategoryTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;


@end

@implementation RecommendCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = RGBColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = RGBColor(219, 31, 26);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected?self.selectedIndicator.backgroundColor:RGBColor(78, 78, 78);

    // Configure the view for the selected state
}

- (void)setCategory:(RecommendCategoryModel *)category{
    _category = category;
    self.textLabel.text = category.name;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.Y = 2;
    self.textLabel.height = self.contentView.height - 2*self.textLabel.Y;
}

@end
