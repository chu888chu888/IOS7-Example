/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 5.x Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

@interface TestBedViewController : UIViewController<UIActionSheetDelegate,UIAlertViewDelegate>
@end

@implementation TestBedViewController

- (void) rightClick
{

   
    UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"您点击了右边的按钮" delegate:self cancelButtonTitle:@"不确定" destructiveButtonTitle:@"非常确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

- (void) leftClick
{
    UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"您点击了左边的按钮" delegate:self cancelButtonTitle:@"不确定" destructiveButtonTitle:@"非常确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //该方法由UIActionSheetDelegate协议定义，在点击ActionSheet的按钮后自动执行
    NSString *string=[NSString stringWithFormat:@"你点击了 %@",[actionSheet buttonTitleAtIndex:buttonIndex]];
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
    alert.alertViewStyle=UIAlertViewStyleDefault;
    //UIAlertViewStyleDefault 默认风格，无输入框
    //UIAlertViewStyleSecureTextInput 带一个密码输入框
    //UIAlertViewStylePlainTextInput 带一个文本输入框
    //UIAlertViewLoginAndPasswordInput 带一个文本输入框，一个密码输入框
    [alert show];
    
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //该方法由UIAlertViewDelegate协议定义，在点击AlertView按钮时自动执行，所以如果这里再用alertView来弹出提//示，就会死循环，不停的弹AlertView
    NSString * string=[NSString stringWithFormat:@"你点击了 %@",[alertView buttonTitleAtIndex:buttonIndex]];
    //    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    //    [alert show];
    NSLog(@"%@",string);
    
    //NSLog(@"输入 %@",[[alertView textFieldAtIndex:0] text]); 获取第一个文本框输入的文本，如果没有文件框，会异常，索引从0开始
    
}
- (void) viewDidLoad
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
	self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
	self.navigationItem.rightBarButtonItem = BARBUTTON(@"右边的按钮", @selector(rightClick));
	self.navigationItem.leftBarButtonItem =  BARBUTTON(@"左边的按钮", @selector(leftClick));
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
@end

#pragma mark -

#pragma mark Application Setup
@interface TestBedAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
}
@end
@implementation TestBedAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{	
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[TestBedViewController alloc] init]];
    window.rootViewController = nav;
	[window makeKeyAndVisible];
    return YES;
}
@end
int main(int argc, char *argv[]) {
    @autoreleasepool {
        int retVal = UIApplicationMain(argc, argv, nil, @"TestBedAppDelegate");
        return retVal;
    }
}