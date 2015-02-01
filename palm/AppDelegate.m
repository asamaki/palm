//
//  AppDelegate.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/24.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "AppDelegate.h"
#import "CategoriesModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ///////////////////
    // SharedInstance
    ///////////////////
    CategoriesModel *categoriesModel = [CategoriesModel sharedInstance];
    NSLog(@"%@", categoriesModel.str);
    MYLog(@"hoge");
    //NSLog(@"%@" , [NSThread callStackSymbols]);
    //////////
    // tab1
    //////////
    self.firstTableViewCotroller = [[FirstTableViewController alloc]init];
    [self.firstTableViewCotroller setTitle:@"firstTitle"];
    UINavigationController* navigationController1 = [[UINavigationController alloc] initWithRootViewController:self.firstTableViewCotroller];
    
    UITabBarItem *tabItem1 = [[UITabBarItem alloc] initWithTitle:@"first"
                                                           image:[[UIImage alloc]
                                                                  initWithContentsOfFile:[[NSBundle mainBundle]
                                                                                          pathForResource:@""
                                                                                          ofType:@"png"]]
                                                             tag:0];
    self.firstTableViewCotroller.tabBarItem = tabItem1;
    
    //////////
    // tab2
    //////////
    
    //ここでflowlayout作ってControllerに受渡しているけど正しいのか？密結合になってるから美しくない。
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];

    self.subCategoryCollectionViewCotroller = [[SubCategoryCollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
    
    self.subCategoryCollectionViewCotroller.flowLayout = flowLayout;

    UINavigationController* navigationController2 = [[UINavigationController alloc] initWithRootViewController:self.subCategoryCollectionViewCotroller];
    [self.subCategoryCollectionViewCotroller setTitle:@"second"];
    UITabBarItem *tabItem2 = [[UITabBarItem alloc] initWithTitle:@"second"
                                                           image:[[UIImage alloc]
                                                                  initWithContentsOfFile:[[NSBundle mainBundle]
                                                                                          pathForResource:@""
                                                                                          ofType:@"png"]]
                                                             tag:0];
    self.subCategoryCollectionViewCotroller.tabBarItem = tabItem2;
    
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.040 green:0.040 blue:0.040 alpha:1.000];
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:0.040 green:0.040 blue:0.040 alpha:1.000];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    
    self.tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigationController1,
                                                                        navigationController2, nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //self.viewController = [[ViewController alloc]init];
    //self.viewController.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = self.tabBarController;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
