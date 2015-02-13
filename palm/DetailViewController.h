//
//  DetailViewController.h
//  palm
//
//  Created by Ikai Masahiro on 2015/01/27.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property(nonatomic) UIScrollView *scrollView;
@property(nonatomic) NSDictionary *subItemDictionary;
@property(nonatomic) NSString *masterId;
@property(nonatomic) NSString *masterIdPrefix;

@end
