//
//  DetailViewController.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/27.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "DetailViewController.h"
#import "ItemsModel.h"
#import "MainItemModel.h"
#import "SubItemModel.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc]init];

    NSString *imageName = [_masterId stringByAppendingString:@".jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    
    CGRect rect = self.view.bounds;
    rect.origin.y = 200;
    UITextView *textView = [[UITextView alloc]initWithFrame:rect];
    textView.editable = NO;
    //textView.textAlignment = UITextAlignmentLeft;
    textView.font = [UIFont fontWithName:@"Helvetica" size:14];
    textView.backgroundColor = [UIColor whiteColor];
    
    ItemsModel *itemsModel = [ItemsModel sharedInstance];
    if ([_masterIdPrefix isEqualToString: MASTER_ID_PREFIX_ITEM]){
        MainItemModel *model = [itemsModel searchParsedItemsArrayWithItemMasterId:_masterId];
        textView.text = model.itemDescription;
    }else if([_masterIdPrefix isEqualToString: MASTER_ID_PREFIX_SUBITEM]){
        SubItemModel *model = [itemsModel searchParsedSubItemsArrayWithSubItemMasterId:_masterId];
        textView.text = model.itemDescription;

    }
    
    
//    textView.text = @"";
//    for (int i = 0; i < 100; i++) {
//        // テキストを設定
//        textView.text =
//        [textView.text stringByAppendingFormat:@"%d行目\n", i + 1];
//    }
    
    [self.scrollView addSubview:imageView];
    [self.scrollView addSubview:textView];
    [self.view addSubview:self.scrollView];
}

- (void)viewWillAppear:(BOOL)animated {
    self.scrollView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
