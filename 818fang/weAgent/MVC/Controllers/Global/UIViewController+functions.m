//
//  UIViewController+functions.m
//  weChat
//
//  Created by apple on 14-9-13.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "UIViewController+functions.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "FindPasswordViewController.h"

@implementation UIViewController (functions)
- (NSString *)formatToJsonString:(NSDictionary *)certificate {
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:certificate options:NSJSONWritingPrettyPrinted error:&error];
    NSString *json =[[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //    json = [json stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    //    json = [json stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //    json = [json stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    //    json = [json stringByReplacingOccurrencesOfString:@" " withString:@""];
    return json;
}

- (void)addBackButton
{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[self reSizeImage:[UIImage imageNamed:@"Back.png"] toSize:CGSizeMake(20.0f, 20.0f)] style:UIBarButtonItemStyleDone target:self action:@selector(backHandle)];
    [backButton setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:backButton];
}

- (void)backHandle
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)loginHandle
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    GlobalNavigationViewController *loginNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:loginVC];
    [loginVC addBackButton];
    [self presentViewController:loginNVC animated:YES completion:^{}];
    
}

- (void)registerHandle
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    GlobalNavigationViewController *registerNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:registerVC];
    [registerVC addBackButton];
    [self presentViewController:registerNVC animated:YES completion:^{}];
}

- (void)findPasswordHandle
{
    FindPasswordViewController *findVC = [[FindPasswordViewController alloc] init];
    GlobalNavigationViewController *findNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:findVC];
    [findVC addBackButton];
    [self presentViewController:findNVC animated:YES completion:^{}];
    
}

//1.等比率缩放图片处理
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize

{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
}

//2.自定长宽
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}


//将UIView转成UIImage
-(UIImage *)getImageFromView:(UIView *)theView
{
    //UIGraphicsBeginImageContext(theView.bounds.size);
    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, YES, theView.layer.contentsScale);
    [theView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (NSUserDefaults*)getUserInfo{
    return [NSUserDefaults standardUserDefaults];
}





@end
