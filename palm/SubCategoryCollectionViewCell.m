//
//  SubCategoryCollectionViewCell.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/30.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "SubCategoryCollectionViewCell.h"

@implementation SubCategoryCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat labelHeight = 80.0f;
        
        self.label = [[UILabel alloc]init];
        self.label.frame = CGRectMake(0,self.frame.size.height-labelHeight, self.frame.size.width, labelHeight);
        self.label.text = @"test";
        self.label.textColor = [UIColor whiteColor];
        self.label.backgroundColor = [UIColor greenColor];
        
        self.imageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView];
        
        
        self.backgroundColor = [UIColor blueColor];
        
        
        
    }
    return self;
}


@end
