//
//  FKViewController.h
//  ImagePickerTest
//
//  Created by yeeku on 13-8-9.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
	<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)takePhoto:(id)sender;
- (IBAction)takeVideo:(id)sender;
- (IBAction)loadPhoto:(id)sender;
@end
