//
//  RentCell.m
//  weChat
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "RentCell.h"

@implementation RentCell

@synthesize imageValue;
@synthesize nameValue;
@synthesize phoneValue;
@synthesize nameLable;
@synthesize phoneLable;
@synthesize useLable;

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
