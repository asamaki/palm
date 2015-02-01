//
//  SubCategoryCollectionViewController.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/26.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "SubCategoryCollectionViewController.h"
#import "SubCategoryCollectionViewCell.h"
#import "DetailViewController.h"
#import "UIImageView+WebCache.h"
#import "modelUtil.h"

@interface SubCategoryCollectionViewController ()

@property (nonatomic) NSArray *subCategoryArray;

@end

@implementation SubCategoryCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"subCategory" ofType:@"plist"];
    _subCategoryArray = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    NSArray  *array = [modelUtil searchWithArray:_subCategoryArray key:@"masterId" value:_mainCategoryMasterId];
    
    //NSLog(@"%@", array);
    
    self.flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/2-5, self.view.frame.size.width/2-5+100);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.flowLayout];
    
    [self.collectionView registerClass:[SubCategoryCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _subCategoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SubCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *masterId = [_subCategoryArray[indexPath.row] objectForKey:@"masterId"];
    NSString *imageName = [masterId stringByAppendingString:@".jpg"];
    
    UIImageView *cellImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    //cell.backgroundView = cellImage;
    cell.imageView.frame = cellImage.frame;
    cell.imageView.image = cellImage.image;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailViewController *detailViewController = [[DetailViewController alloc]init];
    detailViewController.subCategoryDictionary = _subCategoryArray[indexPath.row];
    
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
