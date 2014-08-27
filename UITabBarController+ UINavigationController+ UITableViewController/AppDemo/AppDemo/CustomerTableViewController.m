//
//  CustomerTableViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-18.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "CustomerTableViewController.h"
@interface CustomerTableViewController ()

@end

@implementation CustomerTableViewController
@synthesize dataSource,images;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       
        //导航条中的prompt
        self.navigationItem.prompt=@"";
        self.navigationItem.title=@"自定义样式表格";

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
    dataSource=[[NSMutableArray alloc] initWithObjects:
                @"banknote",@"bubble",@"bulb",@"clip",nil];
    images=[[NSMutableArray alloc] initWithCapacity:4];
    for (NSString *name in dataSource) {
        NSString *imageName=[NSString stringWithFormat:@"%@.png",name];
        UIImage *image=[UIImage imageNamed:imageName];
        [images addObject:image];
    }
    
    //自定义表格样式
    //self.tableView.backgroundColor=[UIColor blackColor];
    self.tableView.rowHeight=64;
    //self.tableView.separatorColor=[UIColor redColor];
    //self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
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
    
    return [dataSource count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"basic-cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil==cell) {
        //如果想加入详情,initWithStyle:UITableViewCellStyleSubtitle非常重要
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    //自定义每一个cell的样式
    cell.textLabel.text=[dataSource objectAtIndex:indexPath.row];
    //cell.textLabel.backgroundColor=[UIColor blackColor];
    //cell.textLabel.textColor=[UIColor redColor];
    cell.textLabel.textAlignment=UITextAlignmentCenter;
    //cell.textLabel.font=[UIFont systemFontOfSize:32];
    cell.imageView.image=[images objectAtIndex:indexPath.row];
    
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    //详细标签
    cell.detailTextLabel.text=@"详细标签";
    return cell;
}
//点击单元格触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *message=[dataSource objectAtIndex:indexPath.row];
    UIAlertView *alert=[[UIAlertView alloc] init];
    alert.message=message;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
    
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{

}
//单元的追加与删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete==editingStyle) {
        //从datasource删除实际数据
        [dataSource removeObjectAtIndex:indexPath.row];
        //删除表格中的单元
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
//删除按钮名称的变更
-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"垃圾箱";
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
