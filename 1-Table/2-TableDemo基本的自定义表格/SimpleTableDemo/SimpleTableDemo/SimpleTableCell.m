//
//  SimpleTableCell.m
//  TableDemo4
//
//  Created by chuguangming on 14-6-5.
//  Copyright (c) 2014年 chuguangming. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell
@synthesize nameLabel,ageLabel,thumbnailImageView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
