//
//  SimpleTableViewController.m
//  TableDemo4
//
//  Created by chuguangming on 14-6-5.
//  Copyright (c) 2014年 chuguangming. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableCell.h"
#import "DetailViewController.h"
@interface SimpleTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *mytable;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentChange;
@end

@implementation SimpleTableViewController
{
    NSArray *tableNameData;
    NSArray *tableAgeData;
    NSArray *thumbnails;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"表格演示";
    }
    return self;
}

- (void)LoadImageData
{
    // 初始化表格数据
    tableNameData=@[@"楚广明",@"王力印",@"余炯",@"小谢",@"小贾"];
    tableAgeData=@[@"36岁",@"30岁",@"27岁",@"26岁",@"30岁"];
    // 初始化表格的图片数据
    thumbnails=@[@"head.gif",@"head2.jpg",@"head3.jpg",@"head4.jpg",@"head2.jpg"];
}
- (void)LoadNOImageData
{
    // 初始化表格数据
    tableNameData=@[@"楚广明",@"王力印",@"余炯",@"小谢",@"小贾"];
    tableAgeData=@[@"36岁",@"30岁",@"27岁",@"26岁",@"30岁"];
    // 初始化表格的图片数据
    thumbnails=@[@"th.jpeg",@"th.jpeg",@"th.jpeg",@"th.jpeg",@"th.jpeg"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self LoadImageData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableNameData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     static NSString *simpleTableIdentifier=@"Simple";
     UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
     if(cell==nil)
     {
     cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
     
     }
     cell.textLabel.text=tableData[indexPath.row];
     cell.imageView.image=[UIImage imageNamed:thumbnails[indexPath.row]];
     return cell;
     */
    static NSString *simpleTableIdentifier=@"SimpleTableCell";
    SimpleTableCell *cell=(SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell==nil)
    {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
        
    }
    cell.nameLabel.text=tableNameData[indexPath.row];
    cell.nameLabel.font=[UIFont fontWithName:@"微软雅黑" size:30];
    cell.thumbnailImageView.image=[UIImage imageNamed:thumbnails[indexPath.row]];
    cell.ageLabel.text=tableAgeData[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    //加入选中标签
    
    return cell;
}
//选项卡的选择事件
- (IBAction)segmentChangAction:(id)sender {
    NSInteger segment=self.segmentChange.selectedSegmentIndex;
    if(segment==0)
    {
        /*
         UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"您进行了选择" message:@"这是一个测试" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
         [alertView show];
         */
        [self LoadImageData];
    }
    else
    {
        [self LoadNOImageData];
    }
    [self.mytable reloadData];
}
//表格的选择事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"您进行了选择" message:tableNameData[indexPath.row] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    
    //取消选中选中的标记
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryNone;
     */
    
    DetailViewController *detailVW=[[DetailViewController alloc] init];
    detailVW.Name=tableNameData[indexPath.row];
    detailVW.Age=tableAgeData[indexPath.row];
    detailVW.Image=thumbnails[indexPath.row];
    
    [self.navigationController pushViewController:detailVW animated:YES];
    
    
    
}
@end
