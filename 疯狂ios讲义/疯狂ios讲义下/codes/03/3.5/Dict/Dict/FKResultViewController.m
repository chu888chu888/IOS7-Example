//
//  FKResultViewController.m
//  Dict
//
//  Created by yeeku on 13-8-27.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKResultViewController.h"
#import "FKWord.h"
@implementation FKResultViewController
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wordArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
		CellIdentifier forIndexPath:indexPath];
    FKWord* wordObj  = [self.wordArray objectAtIndex:indexPath.row];
    UILabel* wordLabel = (UILabel*)[cell viewWithTag:1];
    UILabel* detailLabel = (UILabel*)[cell viewWithTag:2];
	wordLabel.text = wordObj.word;
	detailLabel.text = wordObj.detail;
    return cell;
}
@end
