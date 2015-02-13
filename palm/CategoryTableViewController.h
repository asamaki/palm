//
//  CategoryTableViewController.h
//  palm
//
//  Created by Ikai Masahiro on 2015/02/11.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectCategoryDelegate;

@interface CategoryTableViewController : UITableViewController

@property (weak, nonatomic) id<selectCategoryDelegate> delegate;

// イニシャライザ
- (id)init;

//「おくる」側で値をセットするための関数
- (void) setCategoryWithCategoryMasterId:(NSString*)categoryMasterId;


@end

@protocol selectCategoryDelegate
// 「もらう」で呼び出すためのメソッド「おくる」、ここでは送る値はNSString
- (void)send:(NSString*)str;
@end
