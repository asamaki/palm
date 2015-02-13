//
//  ItemModel.h
//  palm
//
//  Created by Ikai Masahiro on 2015/02/01.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainItemModel.h"
#import "SubItemModel.h"

@interface ItemsModel : NSObject

@property(nonatomic) NSArray *itemsArray;
@property(nonatomic) NSArray *subItemsArray;
@property(nonatomic) NSMutableArray *parsedItemsArray;
@property(nonatomic) NSMutableArray *parsedSubItemsArray;

+ (ItemsModel*)sharedInstance;
- (NSArray*) searchParsedSubItemsArrayWithMasterId:(NSString*)masterId;

- (SubItemModel*) searchParsedSubItemsArrayWithSubItemMasterId:(NSString*)masterId;
- (MainItemModel*) searchParsedItemsArrayWithItemMasterId:(NSString*)masterId;
@end
