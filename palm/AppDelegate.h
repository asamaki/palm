//
//  AppDelegate.h
//  palm
//
//  Created by Ikai Masahiro on 2015/01/24.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstTableViewController.h"
#import "SubItemCollectionViewController.h"
#import "SubItemCollectionViewFlowLayout.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) FirstTableViewController *firstTableViewCotroller;
@property (strong, nonatomic) SubItemCollectionViewController *subItemCollectionViewCotroller;
@property (strong, nonatomic) SubItemCollectionViewFlowLayout *subItemCollectionViewFlowLayout;


@end

