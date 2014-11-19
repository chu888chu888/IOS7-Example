//
//  FKViewController.m
//  MediaPickerTest
//
//  Created by yeeku on 13-8-8.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "FKViewController.h"

@implementation FKViewController
MPMediaPickerController *mpc;
MPMusicPlayerController *musicPlayer;
MPMediaItemCollection* itemList;
- (void)viewDidLoad
{
	[super viewDidLoad];
	UIBarButtonItem* bn = [[UIBarButtonItem alloc] initWithTitle:@"选择音乐"
		style:UIBarButtonItemStyleBordered
		target:self action:@selector(choose:)];
	self.navigationItem.rightBarButtonItem = bn;
	// 创建音乐播放器
	musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
	// 创建MPMediaPickerController对象
	mpc = [[MPMediaPickerController alloc]
		initWithMediaTypes:MPMediaTypeAnyAudio];
	// 为MPMediaPickerController设置委托
	mpc.delegate = self;
	// 设置选择音乐的提示文字。
	mpc.prompt = @"请选择您喜欢的音乐";
	// 设置是否允许进行多选
	mpc.allowsPickingMultipleItems = YES;
	// 设置是否允许选择云端音乐
	mpc.showsCloudItems = YES;
}

- (void) choose:(id)sender
{
	// 必须以modal方式显示MPMusicPlayerController视图控制器
	[self presentViewController: mpc animated:YES completion:NULL];
}
// 当用户选择指定音乐时激发该方法，mediaItemCollection代表用户选择的音乐
- (void)mediaPicker: (MPMediaPickerController *)mediaPicker
	didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
	// 保存用户选择的音乐列表
	itemList = mediaItemCollection;
	// 将用户选择的音乐列表设置为musicPlayer的播放列表
	[musicPlayer setQueueWithItemCollection:mediaItemCollection];
	[self.tableView reloadData];
	[mpc dismissViewControllerAnimated:YES completion:NULL];
}
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
	NSLog(@"用户取消了选择");
}
// UITableViewDataSource协议中的方法，该方法的返回值决定指定分区包含多少个元素
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	// 用户选择了多少首音乐，该表格就包含多少行
	return itemList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 获取表格行的行号
	NSUInteger rowNo = indexPath.row;
	static NSString* cellId = @"cellId";
	UITableViewCell* cell = [tableView
		dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
	// 为表格行的textLabel设置文本
	cell.textLabel.text = [[itemList.items objectAtIndex:rowNo]
		valueForProperty:MPMediaItemPropertyTitle];
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
	(NSIndexPath *)indexPath
{
	// 获取表格行的行号
	NSUInteger rowNo = indexPath.row;
	// 设置播放器正要播放的音乐
	musicPlayer.nowPlayingItem = [itemList.items objectAtIndex:rowNo];
	// 开始播放
	[musicPlayer play];
}
@end
