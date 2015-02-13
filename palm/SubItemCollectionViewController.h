//
//  SubItemCollectionViewController.h
//  palm
//
//  Created by Ikai Masahiro on 2015/01/26.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubItemCollectionViewController : UICollectionViewController

@property(nonatomic) UICollectionViewFlowLayout* flowLayout;
@property(nonatomic) NSString* itemMasterId;
@property(nonatomic) NSString* masterIdPrefix;


@end
