//
//  ContentViewCustomerTableViewController.m
//  AppDemo
//
//  Created by chuguangming on 14-8-20.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "ContentViewCustomerTableViewController.h"

@interface ContentViewCustomerTableViewController ()

@end

@implementation ContentViewCustomerTableViewController
@synthesize sections,dataSource;
//创建包含UIImageView实例的单元
-(UIImageView*)imageViewForCell:(const UITableViewCell*)cell withFileName:(NSString *)fileName
{
    UIImage *image=[UIImage imageNamed:fileName];
    UIImageView *theImageView=[[UIImageView alloc]initWithImage:image];
    CGPoint newCenter=cell.contentView.center;
    newCenter.x+=80;
    theImageView.center=newCenter;
    theImageView.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
    return theImageView;
    
}
//创建包含UISwitch实例的单元
-(UISwitch *)switchForCell:(const UITableViewCell *)cell
{
    UISwitch *theSwitch=[[UISwitch alloc] init];
    theSwitch.on=YES;
    CGPoint newCenter=cell.contentView.center;
    newCenter.x+=80;
    theSwitch.center=newCenter;
    theSwitch.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
    return theSwitch;
    
}
//创建包含UISlider实例的单元
-(UISlider*)sliderForCell:(const UITableViewCell*)cell
{
    UISlider *theSlider=[[UISlider alloc] init];
    theSlider.value=theSlider.maximumValue/2;
    theSlider.frame=CGRectMake(0,0,cell.bounds.size.width/2,cell.bounds.size.height);
    CGPoint newCenter=cell.contentView.center;
    newCenter.x+=50;
    theSlider.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
    return theSlider;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
        self.title=@"自定义ContentView";
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
    //创建显示用数据数组
    //sections=[[NSArray alloc] initWithObjects:@"姓名",@"必杀技",@"强弱", nil];
    sections=[[NSArray alloc] initWithObjects:@"姓名",@"必杀技",@"强弱", nil];
    NSArray *rows1=[NSArray arrayWithObjects:@"李小龙", nil];
    NSArray *rows2=[NSArray arrayWithObjects:@"截拳道", nil];
    NSArray *rows3=[NSArray arrayWithObjects:@"攻击力",@"防御力",nil];
    //dataSource=[[NSArray alloc] initWithObjects:rows1,rows2,rows3, nil];
    dataSource=[[NSArray alloc] initWithObjects:rows1,rows2,rows3, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[dataSource objectAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"basic-cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text=[[dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    switch (indexPath.section) {
        case 0:
            [cell.contentView addSubview:[self imageViewForCell:cell withFileName:@"bubble.png"]];
            break;
        case 1:
            [cell.contentView addSubview:[self switchForCell:cell]];
            break;
        case 2:
            [cell.contentView addSubview:[self sliderForCell:cell]];
            break;
        default:
            break;
    }
    return cell;
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
