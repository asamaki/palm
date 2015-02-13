//
//  ItemModel.m
//  palm
//
//  Created by Ikai Masahiro on 2015/02/01.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "ItemsModel.h"
#import "MainItemModel.h"
#import "SubItemModel.h"

@implementation ItemsModel

+ (ItemsModel*)sharedInstance {
    static ItemsModel* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] initSharedInstance];
    });
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
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath;
    _parsedItemsArray  = [@[] mutableCopy];
    _parsedSubItemsArray  = [@[] mutableCopy];
   
     filePath = [bundle pathForResource:@"mainItem" ofType:@"plist"];
    _itemsArray = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    if (_itemsArray) {
        for (NSDictionary *dictionary in _itemsArray) {
            MainItemModel *item = [[MainItemModel alloc]initWithDictionary:dictionary];
            [_parsedItemsArray addObject:item];
        }
    }
    else {
        NSLog(@"%@", @"_itemsArrayが見つかりませんでした。");
    }
    
    filePath = [bundle pathForResource:@"subItem" ofType:@"plist"];
    _subItemsArray = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    if (_subItemsArray) {
        for (NSDictionary *dictionary in _subItemsArray) {
            SubItemModel *subItem = [[SubItemModel alloc]initWithDictionary:dictionary];
            [_parsedSubItemsArray addObject:subItem];
        }
    }
    else {
        NSLog(@"%@", @"_subItemArrayが見つかりませんでした。");
    }
}

- (NSArray*) searchParsedSubItemsArrayWithMasterId:(NSString*)masterId{
    NSLog(@"%@", masterId);

    NSMutableArray *parsedSubItemArray = [@[] mutableCopy];
    for (SubItemModel *subItem in _parsedSubItemsArray){
        if([masterId isEqualToString:subItem.itemMasterId]){
            [parsedSubItemArray addObject:subItem];
        }
    }
    
    return parsedSubItemArray;
}

//ItemとSubItemの両方から取得する
- (SubItemModel*) searchParsedSubItemsArrayWithSubItemMasterId:(NSString*)masterId {
    NSLog(@"%@", masterId);
    
    for (SubItemModel *subItem in _parsedSubItemsArray){
        if([masterId isEqualToString:subItem.masterId]){
            return subItem;
        }
    }
    
    return nil;
}

- (MainItemModel*) searchParsedItemsArrayWithItemMasterId:(NSString*)masterId {
    NSLog(@"%@", masterId);
    
    for (MainItemModel *item in _parsedItemsArray){
        if([masterId isEqualToString:item.masterId]){
            return item;
        }
    }
    
    return nil;
}



@end
