//
//  TestBedTableViewController.m
//  TableDemo
//
//  Created by chuguangming on 14-7-28.
//  Copyright (c) 2014年 chu. All rights reserved.
//

#import "TestBedTableViewController.h"
#define DATA_ARRAY [NSArray arrayWithObjects:@"Pick up milk",@"Call Anna",nil]
#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
@interface TestBedTableViewController ()

@end

@implementation TestBedTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)segmentAction:(UISegmentedControl *)sender
{
    NSLog(@"你点击的是%0d个数据",sender.selectedSegmentIndex+1);
}
- (void) displayViews
{
	NSLog(@"以完成载入");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=BARBUTTON(@"EDIT", nil);
    self.navigationItem.leftBarButtonItem=BARBUTTON(@"New", nil);
    self.navigationController.navigationBar.tintColor=COOKBOOK_PURPLE_COLOR;
    self.title=@"To Do";
    
    NSArray *buttonNames=[NSArray arrayWithObjects:@"1",@"2",@"3" , nil];
    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc] initWithItems:buttonNames];
    segmentedControl.momentary=NO;
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView=segmentedControl;
    
    [self performSelector:@selector(displayViews) withObject:nil afterDelay:1.0f];
    
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"any-cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"any-cell"];
    }
    cell.textLabel.text=[DATA_ARRAY objectAtIndex:[indexPath row]];
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    
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
