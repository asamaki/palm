//
//  SubItemCollectionViewFlowLayout.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/26.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "SubItemCollectionViewFlowLayout.h"

@implementation SubItemCollectionViewFlowLayout
//-(id)init {
//    self = [super init];
////    if (self) {
////        self.itemSize = CGSizeMake(250, 250);
////        self.scrollDirection = UICollectionViewScrollDirectionVertical;
////        self.sectionInset = UIEdgeInsetsMake(100, 0.0, 100, 0.0);
////        self.minimumLineSpacing = 50.0;
////    }
//    return self;
//}
//
//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds {
//    return YES;
//}

//-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
//    NSArray* array = [super layoutAttributesForElementsInRect:rect];
//    CGRect visibleRect;
//    visibleRect.origin = self.collectionView.contentOffset;
//    visibleRect.size = self.collectionView.bounds.size;
//    
//    return array;
//}

//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
//    CGFloat offsetAdjustment = MAXFLOAT;
//    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
//    
//    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
//    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
//    
//    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
//        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
//        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
//            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
//        }
//    }
//    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
//}

@end
