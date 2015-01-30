//
//  FirstTableViewController.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/24.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "FirstTableViewController.h"
#import "SubCategoryCollectionViewController.h"
#import "FirstTableViewCell.h"

@interface FirstTableViewController ()

@property (nonatomic) NSArray *categoryArray;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"Cell"];

    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"category" ofType:@"plist"];
   _categoryArray = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    if (_categoryArray) {
        for (NSString *data in _categoryArray) {
            NSLog(@"%@", data);
        }
    }
    else {
        NSLog(@"%@", @"データがありません。");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger count = [_categoryArray count];
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *masterId = [_categoryArray[indexPath.row] objectForKey:@"masterId"];
    NSString *imageName = [masterId stringByAppendingString:@".jpg"];
    
    UIImageView *cellImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    
    
    cell.titleLabel.text = [_categoryArray[indexPath.row] objectForKey:@"title"];
    cell.customImageView.image = cellImage.image;
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView deselectRowAtIndexPath:indexPath animated:YES]; // ハイライトを解除
    
    
    
    SubCategoryCollectionViewController *subCategoryCollectionViewController = [[SubCategoryCollectionViewController alloc] init];
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    subCategoryCollectionViewController = [[SubCategoryCollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
    
    subCategoryCollectionViewController.mainCategoryMasterId = _categoryArray[indexPath.row];
    
    subCategoryCollectionViewController.flowLayout = flowLayout;
    [self.navigationController pushViewController:subCategoryCollectionViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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
