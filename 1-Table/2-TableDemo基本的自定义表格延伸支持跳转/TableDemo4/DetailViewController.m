//
//  DetailViewController.m
//  TableDemo4
//
//  Created by chuguangming on 14-6-9.
//  Copyright (c) 2014年 chuguangming. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize Name,Age,Image,txtName,txtAge,imgHeadImage;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    txtName.text=self.Name;
    txtAge.text=self.Age;
    imgHeadImage.image=[UIImage imageNamed:self.Image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
