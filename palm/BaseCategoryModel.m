//
//  BaseCategoryModel.m
//  palm
//
//  Created by Ikai Masahiro on 2015/02/01.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "BaseCategoryModel.h"

@implementation BaseCategoryModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self configureValuesWithDictionary:dictionary];
    }
    return self;
}

- (void)configureValuesWithDictionary:(NSDictionary *)dictionary
{
    for (NSString *key in dictionary) {
        if ([self respondsToSelector:NSSelectorFromString(key)]) {
            [self setValue:dictionary[key] forKeyPath:key];
        }
    }
}

@end
