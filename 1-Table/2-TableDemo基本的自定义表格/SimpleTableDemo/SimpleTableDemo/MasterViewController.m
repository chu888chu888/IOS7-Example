//
//  MasterViewController.m
//  SimpleTableDemo
//
//  Created by chuguangming on 14-6-20.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "MasterViewController.h"
#import "SimpleTableCell.h"
@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"表格演示";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 初始化数据
    // 初始化表格数据
    self.tableNameData=@[@"楚广明",@"王力印",@"余炯",@"小谢",@"小贾"];
    self.tableAgeData=@[@"36岁",@"30岁",@"27岁",@"26岁",@"30岁"];
    // 初始化表格的图片数据
    self.tableHeadImageData=@[@"head.gif",@"head2.jpg",@"head3.jpg",@"head4.jpg",@"head2.jpg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 表格数据实现方法
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
    
    return cell;

}
@end
