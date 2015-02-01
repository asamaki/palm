//
//  CategoryModel.h
//  palm
//
//  Created by Ikai Masahiro on 2015/02/01.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCategoryModel.h"

@interface CategoryModel : BaseCategoryModel

@property(nonatomic) NSString *masterId;
@property(nonatomic) NSString *title;
@property(nonatomic) NSInteger type;

@end
