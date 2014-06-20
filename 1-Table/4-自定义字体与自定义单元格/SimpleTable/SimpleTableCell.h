//
//  SimpleTableCell.h
//  SimpleTable
//
//  Created by Rickie Li on 12-7-18.
//  Copyright (c) 2012年 EntLib.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
