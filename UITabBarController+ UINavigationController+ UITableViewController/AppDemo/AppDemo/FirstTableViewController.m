//
//  FirstTableViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-15.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController
@synthesize items,DetailItems;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        //导航条中的prompt
        self.navigationItem.prompt=@"信息聚合页";
        self.navigationItem.title=@"首页";
        //在右侧添加按钮
        UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
        self.navigationItem.rightBarButtonItem=rightItem;
        //在左侧添加按钮
        UIBarButtonItem *leftItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
        self.navigationItem.leftBarButtonItem=leftItem;
        //TabBarController中的Tabbar按钮
        self.tabBarItem=[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
        self.tabBarItem.badgeValue=@"4";
        items=[[NSMutableArray alloc] initWithObjects:@"UIKitPrjSliderAndLabelViewController",@"UIKitPrjUIDatePickerViewController",@"OperationTableViewController",
                            @"CustomerTableViewController",@"ContentViewCustomerTableViewController",
                            @"FullImageViewController",@"UIKitPrjButtonUIViewController",@"UIKitPrjTouchesBeganViewController",@"UIKitPrjResponderChainViewController",@"UIKitPrjAppViewController",@"CustomerMasterViewController", nil];
        DetailItems=[[NSMutableArray alloc]
            initWithObjects:@"1-自定义NavigationItem与Slider组件演示",@"2-日期选择组件演示",@"3-表格-演示追加数据删除数据演示",@"4-表格-自定义Title表头",@"5-表格-自定义内容表格",@"6-图片-图片显示",@"7-Button组件演示",@"8-UIResponder演示",@"9-事件传递演示",@"10-应用程序测试",@"11-自定义表格单元", nil];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [DetailItems objectAtIndex:indexPath.row];
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class class=NSClassFromString([items objectAtIndex:indexPath.row]);
    id viewController=[[class alloc] init];
    if(viewController)
    {
        [self.navigationController pushViewController:viewController animated:NO];
        
    }
    
}
//关于画面旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
   	return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}
- (BOOL)shouldAutorotate
{
   	return NO;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
}

//视图旋转之前自动调用
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"视图旋转之前自动调用");
}
//视图旋转方向发生改变时会自动调用
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"视图旋转方向发生改变时会自动调用");
}
//视图旋转完成之后会自动调用

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    NSLog(@"视图旋转完成之后自动调用");
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
