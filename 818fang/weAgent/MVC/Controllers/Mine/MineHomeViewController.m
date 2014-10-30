//
//  MineHomeViewController.m
//  weChat
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "MineHomeViewController.h"
#import "MyAccountViewController.h"
#import "CustomeServiceViewController.h"
#import "TestViewController.h"
#import "GlobalNavigationViewController.h"

@interface MineHomeViewController ()

@end

@implementation MineHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- ( void ) loadView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor baseBackgroundColor];
    self.view =tableView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我"];
    
   
 
    UIButton *logoff  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logoff.frame = CGRectMake(10, 390, 300, 30);
    [logoff setTitle:@"退出登录" forState:UIControlStateNormal];
    [logoff addTarget:self action:@selector(logoffHandle) forControlEvents:UIControlEventTouchUpInside];
    [logoff beRed];
    [self.view addSubview:logoff];

}

-(void) viewWillAppear:(BOOL)animated
{
    [self.view deselectRowAtIndexPath:[self.view indexPathForSelectedRow] animated:YES];
}

- (void)myAccountHandle{
    MyAccountViewController *myAccountTVC = [[MyAccountViewController alloc] init];
    UINavigationController *myAccountNVC = [[UINavigationController alloc] initWithRootViewController:myAccountTVC];
    [self presentViewController:myAccountNVC animated:YES completion:^{}];
}


- (void)updateHandle{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"消息" message:@"您确定要更新吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
   [alertView show];
}

- (void)customServiceHandle{
    CustomeServiceViewController *customeServiceTVC = [[CustomeServiceViewController alloc] init];
    UINavigationController *customeServiceNVC = [[UINavigationController alloc] initWithRootViewController:customeServiceTVC];
    [self presentViewController:customeServiceNVC animated:YES completion:^{}];
}

- (void)introduceHandle{
    IntroduceViewController *introduceVC = [[IntroduceViewController alloc] init];
    introduceVC.toNextViewDetegate = self;
    [self presentViewController:introduceVC animated:YES completion:^{}];
}

- (void)toNextView
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)logoffHandle{
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"diploma"];
    [self loginHandle];
   
}


- (void)rongYunHandle{
    TestViewController *rongYunVC = [[TestViewController alloc] init];
    GlobalNavigationViewController *rongYunNVC = [[GlobalNavigationViewController alloc] initWithRootViewController:rongYunVC];
    [self presentViewController:rongYunNVC animated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    
//    NSArray *indexList = [NSMutableArray arrayWithObjects:
//                          @"A", @"B", @"C", @"D", @"E", @"F",
//                          @"G", @"H", @"I", @"J", @"K", @"L",
//                          @"M", @"N", @"O", @"P", @"Q", @"R",
//                          @"S", @"T", @"U", @"V", @"W", @"X",
//                          @"Y", @"Z", @"#", nil
//                          ];
//    NSLog(@"%@",indexList);
//    return indexList ;
//    
//}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *accountImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0 , 320, 140)];
    [accountImgView setImage:[UIImage imageNamed:@"big_image.png"]];
   
    
    if (section == 0) {
        return accountImgView;
    }else{
        return nil;
    }
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 140;
    }else{
        return 0;
    }
}


//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    
//    return 1.0;
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 5;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int section = indexPath.section;
    int row = indexPath.row;
    static NSString *CellIdentifier = @"mineCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        switch (section) {
//            case 0:
//               cell.textLabel.text =  @"我的账号";
//                break;
         
            case 0:
                if(row == 0)
                {
                    cell.textLabel.text =  @"我的账号";
                }

                if(row == 1)
                {
                    cell.textLabel.text =  @"关于产品";
                    [cell.imageView setImage:[self reSizeImage:[UIImage imageNamed:@"change_password.png"] toSize:CGSizeMake(20.0f, 20.0f)]];
                }
                if(row == 2){
                    cell.textLabel.text =  @"检查新版本";
                     [cell.imageView setImage:[self reSizeImage:[UIImage imageNamed:@"update.png"] toSize:CGSizeMake(20.0f, 20.0f)]];
                }
                if(row == 3){
                    cell.textLabel.text =  @"客服帮助";
                     [cell.imageView setImage:[self reSizeImage:[UIImage imageNamed:@"phone_service.png"] toSize:CGSizeMake(20.0f, 20.0f)]];
                }
                if(row == 4)
                {
                    cell.textLabel.text =  @"融云demo";

                }

                break;
                
//            case 2:
//                cell.textLabel.text =  @"融云demo";
//                break;
            default:
                break;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int row = indexPath.row;
    int section = indexPath.section;
    switch (section) {
//        case 0:
//           [self myAccountHandle];
//            break;
//            
        case 0:
            if(row == 0)
            {
                [self myAccountHandle];

            }
            if(row == 1)
            {
                [self introduceHandle];

            }
            if(row == 2){
                [self updateHandle];

            }
            if(row == 3){
                [self customServiceHandle];
            }
            if(row == 4)
            {
                [self rongYunHandle];
            }
            break;
//        case 2:
//                [self rongYunHandle];
//            break;

        default:
            break;
    }

   

   
    
}

@end
