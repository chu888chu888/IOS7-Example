//
//  FKViewController.m
//  CloudTest
//
//  Created by yeeku on 13-11-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKDiary.h"
#import "FKDetailController.h"

@implementation FKDetailController
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self changeDisplay];
}
- (void) changeDisplay
{
	// 将传过来的FKDiary的diaryData使用diaryDetail控件显示出来
	self.diaryDetail.text = [[NSString alloc]
		initWithData:[self.detailItem diaryData]
		encoding:NSUTF8StringEncoding];
}
- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	// 将diaryDetail控件中的文本内容设为FKDiary的diaryData数据
	[self.detailItem setDiaryData:[self.diaryDetail.text dataUsingEncoding:NSUTF8StringEncoding]];
    UIDocument *doc = self.detailItem;
	// 保存doc文档，doc文档就是detailItem代表的FKDiary
	[doc saveToURL:doc.fileURL forSaveOperation:UIDocumentSaveForOverwriting
		completionHandler:nil];
}
@end
