//
//  CategoriesModel.m
//  palm
//
//  Created by Ikai Masahiro on 2015/02/01.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "CategoriesModel.h"
#import "CategoryModel.h"

@implementation CategoriesModel

+ (CategoriesModel*)sharedInstance {
    static CategoriesModel* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CategoriesModel alloc]
                     initSharedInstance];
        NSLog(@"%@", @"dispatch_once");

    });
    NSLog(@"%@", @"return _instance");
    return _instance;
}

- (id)initSharedInstance {
    self = [super init];
    if (self) {
        [self load];
    }
    return self;
}

- (id)init {
    [self doesNotRecognizeSelector:_cmd]; // init を直接呼ぼうとしたらエラーを発生させる
    return nil;
}

- (void) load{
    NSLog(@"%@", @"load");
    _parsedCategoriesArray  = [@[] mutableCopy];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"category" ofType:@"plist"];
    _categoriesArray = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    if (_categoriesArray) {
        for (NSDictionary *dictionary in _categoriesArray) {
            CategoryModel *category = [[CategoryModel alloc]initWithDictionary:dictionary];
            [_parsedCategoriesArray addObject:category];
        }
    }
    else {
        NSLog(@"%@", @"データがありません。");
    }
    


    
    filePath = [bundle pathForResource:@"subCategories" ofType:@"plist"];
    _subCategoriesArray = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    //NSArray  *array = [modelUtil searchWithArray:_subCategoriesArray key:@"masterId" value:_mainCategoriesMasterId];
    
    //NSLog(@"%@", _parsedCategoriesArray);
    
    //NSLog(@"%@", _str);
}



@end
