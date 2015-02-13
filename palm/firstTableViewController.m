//
//  FirstTableViewController.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/24.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "FirstTableViewController.h"
#import "SubItemCollectionViewController.h"
#import "DetailViewController.h"
#import "FirstTableViewCell.h"
#import "ItemsModel.h"
#import "MainItemModel.h"

@interface FirstTableViewController ()

@property (nonatomic) ItemsModel *itemsModel;
@property (nonatomic) NSMutableArray *displayItemsArray;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"カテゴリ" style:UIBarButtonItemStylePlain target:self action:@selector(modalCategory)];
    self.navigationItem.leftBarButtonItem = barButton;
    
    _itemsModel = [ItemsModel sharedInstance];
    _displayItemsArray = _itemsModel.parsedItemsArray;
    
    
}

- (void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}

- (void)categoryView{
    MYLog(@"categoryView");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSUInteger count = [_itemsArray count];
    NSUInteger count = [_displayItemsArray count];
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    MainItemModel *item = _displayItemsArray[indexPath.row];
    NSString *imageName = [item.masterId stringByAppendingString:@".jpg"];
    UIImageView *cellImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    
    cell.titleLabel.text = [_displayItemsArray[indexPath.row] title];
    cell.imageView.image = cellImage.image;
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView deselectRowAtIndexPath:indexPath animated:YES]; // ハイライトを解除
    
    NSString *itemMasterId = [_displayItemsArray[indexPath.row] masterId];
    NSString *itemType = [_displayItemsArray[indexPath.row] itemType];
    
    if([itemType isEqualToString:ITEM_TYPE_HAVE_SUBITEM]){
        SubItemCollectionViewController *subItemCollectionViewController = [[SubItemCollectionViewController alloc] init];
        
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
        subItemCollectionViewController = [[SubItemCollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
        
        subItemCollectionViewController.itemMasterId = itemMasterId;
        subItemCollectionViewController.flowLayout = flowLayout;
        subItemCollectionViewController.masterIdPrefix = MASTER_ID_PREFIX_SUBITEM;

        [self.navigationController pushViewController:subItemCollectionViewController animated:YES];
        
    }else if([itemType isEqualToString:ITEM_TYPE_HAVENOT_SUBITEM]){
        DetailViewController *detailViewController = [[DetailViewController alloc]init];
        
        detailViewController.masterIdPrefix = MASTER_ID_PREFIX_ITEM;
        detailViewController.masterId = itemMasterId;
        [self.navigationController pushViewController:detailViewController animated:YES];
    }else{
        NSLog(@"%@", itemType);
        MYLog(@"### 未定義のMasterIdです ###");
    }
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

/*
 delegate Category
*/
- (void)send:(NSString *)str{
    NSLog(@"%@", str);
    
    NSArray *resultArray = @[];
    NSMutableArray *resultMArray = [resultArray mutableCopy];
    
    _displayItemsArray = _itemsModel.parsedItemsArray;

    for(MainItemModel *item in _displayItemsArray){
        if([item.categoryMasterId isEqualToString:str]){
            [resultMArray addObject:item];
        }
    }
    _displayItemsArray = resultMArray;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)modalCategory{
    CategoryTableViewController *categoryTableViewController = [[CategoryTableViewController alloc]init];
    categoryTableViewController.delegate = self;
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:categoryTableViewController];
    
    [self presentViewController:navigationController animated:YES completion:nil];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
