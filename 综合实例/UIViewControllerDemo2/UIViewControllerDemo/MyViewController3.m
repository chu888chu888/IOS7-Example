//
//  MyViewController3.m
//  UIViewControllerDemo
//
//  Created by chuguangming on 14-8-13.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "MyViewController3.h"
#import "MyViewController1.h"
@interface MyViewController3 ()

@end

@implementation MyViewController3
@synthesize dataSource,mv;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *icon=[UIImage imageNamed:@"free-badge-32.png"];
        self.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"Hello" image:icon tag:0];
        
        //导航条中的prompt
        self.navigationItem.prompt=@"第一行信息";
        self.navigationItem.title=@"我是标题";
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
    // Do any additional setup after loading the view.
    dataSource=[[NSMutableArray alloc] initWithObjects:
                @"分段显示",@"item2",@"item3",@"item4",
                @"item5",@"item6",@"item7",@"item8",
                @"item9",@"item10",@"item11",@"item12",
                @"item13",@"item14",@"item15",@"item16",nil];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    //[self.tableView setEditing:YES animated:YES];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

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
    /*
    NSString *message=[dataSource objectAtIndex:indexPath.row];
    UIAlertView *alert=[[UIAlertView alloc] init];
    alert.message=message;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
     */
    switch (indexPath.row)
    {
        case 0:
            NSLog(@"分段显示");
            //mv=[[MyViewController1 alloc] init];
            //[self.navigationController pushViewController:mv animated:NO];
            mv=[[UIKitPrjSectionTableViewController alloc] initWithStyle:UITableViewCellStyleDefault];
            [self.navigationController pushViewController:mv animated:NO];
            break;
        default:
            break;
    }

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
@end
