//
//  modelUtil.h
//  palm
//
//  Created by Ikai Masahiro on 2015/01/24.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface modelUtil : NSObject


+ (NSDictionary*) searchWithDictionary:(NSDictionary*)dictionary;
+ (NSArray*)searchWithArray:(NSArray*)array key:(NSString*)key value:(NSString*)value;


@end
