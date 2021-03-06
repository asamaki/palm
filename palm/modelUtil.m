//
//  modelUtil.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/24.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "modelUtil.h"

@implementation modelUtil

+ (void)savePlist {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths objectAtIndex:0];
    NSString *filePath = [directory stringByAppendingPathComponent:@"data.plist"];
    
    NSArray *array = [NSArray arrayWithObjects:@"東京", @"名古屋", @"大阪", nil];
    
    BOOL successful = [array writeToFile:filePath atomically:NO];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功");
    }
}

+ (NSDictionary*)searchWithDictionary:(NSDictionary*)dictionary{
    for (id key in dictionary) {
        NSLog(@"%@", key);
    }
    return dictionary;
}
+ (NSArray*)searchWithArray:(NSArray*)array key:(NSString*)key value:(NSString*)value{
    NSArray* resultArray = @[];
    
    NSLog(@"%@", key);
    NSLog(@"%@", value);
    
    for (id material in array) {
        if (material[key] == value) {
           NSLog(@"yes####################");
        }
        //NSLog(@"%@", value);
    }
    return array;
}


@end


