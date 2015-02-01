//
//  CategoryModel.h
//  palm
//
//  Created by Ikai Masahiro on 2015/02/01.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoriesModel : NSObject

@property(nonatomic) NSString *str;
@property(nonatomic) NSArray *categoriesArray;
@property(nonatomic) NSArray *subCategoriesArray;
@property(nonatomic) NSMutableArray *parsedCategoriesArray;

+ (CategoriesModel*)sharedInstance;

@end
