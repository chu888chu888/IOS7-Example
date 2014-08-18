//
//  OperationTableViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-18.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "OperationTableViewController.h"

@interface OperationTableViewController ()

@end

@implementation OperationTableViewController

@synthesize dataSource;
-(void)doEdit
{
    [self.tableView setEditing: !self.tableView.isEditing];

}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        UIImage *icon=[UIImage imageNamed:@"free-badge-32.png"];
        self.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"删除" image:icon tag:0];
        
        //导航条中的prompt
        self.navigationItem.prompt=@"向左边滑动每一条信息";
        self.navigationItem.title=@"删除\添加\移动 标题演示";
        //在右侧添加按钮
        UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(doEdit)];
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
    dataSource=[[NSMutableArray alloc] initWithObjects:
                @"item1",@"item2",@"item3",@"追加数据",nil];
}
-(void)viewDidAppear:(BOOL)animated
{
    //[super viewDidAppear:animated];
    //[self.tableView setEditing:YES];
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
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text=[dataSource objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *message=[dataSource objectAtIndex:indexPath.row];
    UIAlertView *alert=[[UIAlertView alloc] init];
    alert.message=message;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
    
}
//单元的追加与删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    /*
    if (UITableViewCellEditingStyleDelete==editingStyle) {
        //从datasource删除实际数据
        [dataSource removeObjectAtIndex:indexPath.row];
        //删除表格中的单元
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
     */
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            //从datasource删除实际数据
            [dataSource removeObjectAtIndex:indexPath.row];
            //删除表格中的单元
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        case UITableViewCellEditingStyleInsert:
            //从dataSource中追加一个数据
            [dataSource insertObject:@"New Item" atIndex:dataSource.count-1];
            //在表格中追加单元
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationBottom];
            break;
        default:
            break;
    }
}
//删除按钮名称的变更
-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"垃圾箱";
}
//在编辑模式的情况下,将最后的Row变成插入模式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing && dataSource.count<=indexPath.row+1) {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
}
 // 实现移动表格
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     NSUInteger fromRow=fromIndexPath.row;
     NSUInteger toRow=toIndexPath.row;
     while (fromRow<toRow) {
         [dataSource exchangeObjectAtIndex:fromRow withObjectAtIndex:fromRow+1];
         fromRow++;
     }
     while (fromRow>toRow) {
         [dataSource exchangeObjectAtIndex:fromRow withObjectAtIndex:fromRow-1];
         fromRow--;
     }
 }

 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
    // Return NO if you do not want the item to be re-orderable.
    //最后单元之外的情况下为YES
     return (dataSource.count>indexPath.row+1);
 }
//限制单元移动到最后一个单元格的下方
-(NSIndexPath*)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (dataSource.count>proposedDestinationIndexPath.row+1) {
        return proposedDestinationIndexPath;
    }
    else
    {
        return sourceIndexPath;
    }
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
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
