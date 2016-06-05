//
//  RecommandCategoryModel.m
//  Demo2
//
//  Created by went_macbook on 16/6/2.
//  Copyright © 2016年 went. All rights reserved.
//

#import "RecommendCategoryModel.h"

@implementation RecommendCategoryModel

- (NSMutableArray *)usersArray{
    if (!_usersArray) {
        _usersArray = [NSMutableArray array];
        
    }
    return _usersArray;
}

@end
