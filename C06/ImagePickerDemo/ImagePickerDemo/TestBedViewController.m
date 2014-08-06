//
//  TestBedViewController.m
//  ImagePickerDemo
//
//  Created by chuguangming on 14-7-30.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "TestBedViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define RESIZABLE(_VIEW_)   [_VIEW_ setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth]
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
@interface TestBedViewController ()

@end

@implementation TestBedViewController
@synthesize imageView,popoverController,imagePickerController,editSwitch;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(CGPoint) CGRectGetCenter:(CGRect)rect
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}
// Update image and for iPhone, dismiss the controller
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!image)
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.image = image;
    
	if (IS_IPHONE)
	{
        [self dismissModalViewControllerAnimated:YES];
        imagePickerController = nil;
	}
}

// Dismiss picker
- (void) imagePickerControllerDidCancel: (UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
    imagePickerController = nil;
}

// Popover was dismissed
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)aPopoverController
{
	imagePickerController = nil;
    popoverController = nil;
}
-(void)pickImage:(id)sender
{
    imagePickerController=[[UIImagePickerController alloc] init];
    imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.allowsEditing=editSwitch.isOn;
    imagePickerController.delegate=self;
    
    if (IS_IPHONE) {
        [self presentModalViewController:imagePickerController animated:YES];
    }
    else
    {
        if (popoverController) [popoverController dismissPopoverAnimated:NO];
        
        popoverController = [[UIPopoverController alloc] initWithContentViewController:imagePickerController];
        popoverController.delegate = self;
        [popoverController presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    RESIZABLE(self.view);
    
    imageView=[[UIImageView alloc] init];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    RESIZABLE(imageView);
    [self.view addSubview:imageView];
    
    editSwitch = [[UISwitch alloc] init];
    self.navigationItem.titleView = editSwitch;
    
    self.navigationController.navigationBar.tintColor=COOKBOOK_PURPLE_COLOR;
    self.navigationItem.rightBarButtonItem=BARBUTTON(@"Pick", @selector(pickImage:));
    
}
- (void) viewDidAppear:(BOOL)animated
{
    imageView.frame = self.view.bounds;
    //imageView.center = selfCGRectGetCenter(self.view.bounds);
    imageView.center=[self CGRectGetCenter:self.view.bounds];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
