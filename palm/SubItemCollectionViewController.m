//
//  SubItemCollectionViewController.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/26.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "SubItemCollectionViewController.h"
#import "SubItemCollectionViewCell.h"
#import "DetailViewController.h"
#import "UIImageView+WebCache.h"
#import "modelUtil.h"
#import "ItemsModel.h"
#import "SubItemModel.h"

@interface SubItemCollectionViewController ()

@property (nonatomic) NSArray *subItemArray;
@property (nonatomic) NSArray *parsedSubItemsArray;
@property (nonatomic) ItemsModel *itemsModel;

@end

@implementation SubItemCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itemsModel = [ItemsModel sharedInstance];
    
    self.flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/2-5, self.view.frame.size.width/2-5+100);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[SubItemCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    _parsedSubItemsArray = [_itemsModel searchParsedSubItemsArrayWithMasterId:_itemMasterId];
    return _parsedSubItemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SubItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    SubItemModel *subItemModel = _parsedSubItemsArray[indexPath.row];
    
    NSString *masterId = subItemModel.masterId;
    NSString *imageNamed = [masterId stringByAppendingString:@".jpg"];
    
    UIImageView *cellImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageNamed]];
    cell.imageView.frame = cellImage.frame;
    cell.imageView.image = cellImage.image;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SubItemModel *subItemModel = _parsedSubItemsArray[indexPath.row];

    DetailViewController *detailViewController = [[DetailViewController alloc]init];
    //detailViewController.subItemDictionary = _subItemArray[indexPath.row];
    detailViewController.masterId = subItemModel.masterId;
    detailViewController.masterIdPrefix = MASTER_ID_PREFIX_SUBITEM;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
