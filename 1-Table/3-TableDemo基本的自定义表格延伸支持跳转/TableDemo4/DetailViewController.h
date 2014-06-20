//
//  DetailViewController.h
//  TableDemo4
//
//  Created by chuguangming on 14-6-9.
//  Copyright (c) 2014年 chuguangming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
@public
    NSString * Name;
    NSString * Age;
    NSString * Image;
}
@property(nonatomic,retain) NSString *Name;
@property(nonatomic,retain) NSString *Age;
@property(nonatomic,retain) NSString *Image;
@property (retain, nonatomic) IBOutlet UILabel *txtName;
@property (retain, nonatomic) IBOutlet UILabel *txtAge;
@property (retain, nonatomic) IBOutlet UIImageView *imgHeadImage;
@end
