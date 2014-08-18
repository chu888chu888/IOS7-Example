//
//  ThirdTableViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-15.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "ThirdTableViewController.h"

@interface ThirdTableViewController ()

@end

@implementation ThirdTableViewController

@synthesize keys,dataSource;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        UIImage *icon=[UIImage imageNamed:@"free-badge-32.png"];
        self.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"分段" image:icon tag:0];
        
        //导航条中的prompt
        self.navigationItem.prompt=@"我是一个prompt";
        self.navigationItem.title=@"分段表格演示";
        //在右侧添加按钮
        UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
        self.navigationItem.rightBarButtonItem=rightItem;
        //在左侧添加按钮
        UIBarButtonItem *leftItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
        self.navigationItem.leftBarButtonItem=leftItem;
        
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
    //首先创建段名
    keys=[[NSArray alloc]initWithObjects:@"第一段",@"第二段",@"第三段", nil];
    //创建各段数据
    NSArray *object1=[NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSArray *object2=[NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSArray *object3=[NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSArray *objects=[NSArray arrayWithObjects:object1,object2,object3, nil];
    //以段名数组/段数据为参数创建数据资源用的字典实例
    dataSource=[[NSDictionary alloc] initWithObjects:objects forKeys:keys];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//返回段的数目
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [keys count];
}
//返回各段的项目数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id key=[keys objectAtIndex:section];
    return [[dataSource objectForKey:key] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    // Configure the cell...
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    //首先取得单元格的段名
    id key=[keys objectAtIndex:indexPath.section];
    //返回对应段及对应位置的数据,并设置到单元中
    NSString *text=[[dataSource objectForKey:key] objectAtIndex:indexPath.row];
    cell.textLabel.text=text;
    
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *strHeader=[NSString stringWithFormat:@"我是SectionHeader%@",[keys objectAtIndex:section]];
    return strHeader;
}
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *strFooter=[NSString stringWithFormat:@"我是SectionFooter%@",[keys objectAtIndex:section]];
    return strFooter;
}
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
