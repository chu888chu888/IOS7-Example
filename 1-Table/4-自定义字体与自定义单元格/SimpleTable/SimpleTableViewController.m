//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by Jacky Li on 12-7-15.
//  Copyright (c) 2012年 EntLib.com. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableCell.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController
{
    NSMutableArray *tableData;
    NSMutableArray *thumbnails;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tableData = [NSMutableArray arrayWithObjects:@"全聚德烤鸭", @"鱼香肉丝", @"老北京炖豆腐",@"扬州炒饭",@"青  菜",@"宫保鸡丁",@"宫保鱼片",@"西红柿蛋汤",@"土豆丝",@"剁椒鱼头",@"鱼块粉条",@"鱼香茄子煲",@"牛肉粉丝",@"南翔小笼",@"过桥米线",@"热干面",@"葱香鲫鱼", nil];
    thumbnails = [NSMutableArray arrayWithObjects:@"apple.jpg", @"apple1.jpg", @"apple2.jpg", @"apple3.jpg", @"apple4.jpg", @"apple5.jpg", @"apple6.jpg", @"apple7.jpg", @"apple8.jpg", @"apple9.jpg", @"apple.jpg", @"apple1.jpg", @"apple2.jpg", @"apple3.jpg", @"apple4.jpg", @"apple5.jpg", @"apple6.jpg", nil];
}
                 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        [cell.nameLabel setFont:[UIFont fontWithName:@"Microsoft Yahei" size:20]];
        [cell.prepTimeLabel setFont:[UIFont fontWithName:@"Microsoft Yahei" size:14]];
    }
    
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
  
    cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [NSString  stringWithFormat:@"%d分钟", indexPath.row *2];
    
    return cell;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString * strMessage =((SimpleTableCell *) cell).nameLabel.text;
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"选择菜单" message:(strMessage) delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    // Display Alert Message
    [messageAlert show];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // remove the row from data model
    [tableData removeObjectAtIndex:indexPath.row];
    [thumbnails removeObjectAtIndex:indexPath.row];
    
    [tableView reloadData];
}

@end
