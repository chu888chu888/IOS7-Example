//
//  CustomerMasterViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-9-1.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "CustomerMasterViewController.h"
#import "SimpleTableCell.h"
#import "CustomerDetailViewController.h"
@interface CustomerMasterViewController ()

@end

@implementation CustomerMasterViewController

@synthesize dataSource,images;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        //导航条中的prompt
        self.navigationItem.prompt=@"";
        self.navigationItem.title=@"自定义单元表格";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableNameData=@[@"楚广明",@"王力印",@"余炯",@"小谢",@"小贾"];
    self.tableAgeData=@[@"36岁",@"30岁",@"27岁",@"26岁",@"30岁"];
    // 初始化表格的图片数据
    self.tableHeadImageData=@[@"head.gif",@"head2.jpg",@"head3.jpg",@"head4.jpg",@"head2.jpg"];
    self.tableDesc=@[@"自定义单元格",@"自定义单元格",@"自定义单元格",@"自定义单元格",@"自定义单元格",];
    self.tableView.rowHeight=120;
    
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
    
    return [self.tableNameData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier=@"SimpleTableCell";
    SimpleTableCell *cell=(SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell==nil)
    {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
        
    }
    cell.nameLabel.text=self.tableNameData[indexPath.row];
    cell.nameLabel.font=[UIFont fontWithName:@"微软雅黑" size:30];
    cell.thumbnailImageView.image=[UIImage imageNamed:self.tableHeadImageData[indexPath.row]];
    cell.ageLabel.text=self.tableAgeData[indexPath.row];
    cell.detailTextLabel.text=self.tableDesc[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
//点击单元格触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    NSString *message=[dataSource objectAtIndex:indexPath.row];
    UIAlertView *alert=[[UIAlertView alloc] init];
    alert.message=message;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
     */
    CustomerDetailViewController *detailVC=[[CustomerDetailViewController alloc] init];
    if (detailVC) {
        detailVC.strName=self.tableNameData[indexPath.row];
        detailVC.strAge=self.tableAgeData[indexPath.row];
        detailVC.strDesc=self.tableDesc[indexPath.row];
        detailVC.strHeadImage=self.tableHeadImageData[indexPath.row];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    
    
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


@end
