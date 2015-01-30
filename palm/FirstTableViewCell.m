//
//  FirstTableViewCell.m
//  palm
//
//  Created by Ikai Masahiro on 2015/01/27.
//  Copyright (c) 2015年 Ikai Masahiro. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        //メインテキスト
        self.titleLabel  = [[UILabel alloc] initWithFrame:CGRectZero];
        self.customImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.customImageView];
    }
    
    return self;
}
- (void) layoutSubviews {
    [super layoutSubviews];
    
    float desiredWidth = 80;
    float desiredHeight = 130;
    self.titleLabel.frame = CGRectMake(desiredWidth+30,50, 200,44);
    self.customImageView.frame = CGRectMake(10,0,desiredWidth+20,desiredHeight);
}




@end
