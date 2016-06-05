//
//  RecommandCategoryModel.h
//  Demo2
//
//  Created by went_macbook on 16/6/2.
//  Copyright © 2016年 went. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecommendUserModel.h"

@interface RecommendCategoryModel : NSObject

@property(nonatomic,assign) NSInteger id;
@property(nonatomic,assign) NSInteger count;
@property(nonatomic,copy) NSString *name;

@property(nonatomic,strong) NSMutableArray *usersArray;

@property(nonatomic,assign) NSInteger currentPage;
@property(nonatomic,assign) NSInteger totalUserCount;
@end
