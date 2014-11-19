//
//  FKViewController.m
//  SendSms
//
//  Created by yeeku on 13-10-23.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "FKViewController.h"

@interface FKViewController () <MFMessageComposeViewControllerDelegate>
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
}
- (IBAction)send:(id)sender
{
	NSString* destStr = self.destField.text;
	NSString* contentStr = self.contentField.text;
	if(destStr != nil && destStr.length > 0
	   && contentStr != nil && destStr.length > 0)
	{
		// 如果能发送文本信息
		if ([MFMessageComposeViewController canSendText])
		{
			// 创建MFMessageComposeViewController对象
			MFMessageComposeViewController *picker = [[MFMessageComposeViewController
				alloc] init];
			// 为MFMessageComposeViewController对象指定messageComposeDelegate
			picker.messageComposeDelegate = self;
			picker.navigationBar.tintColor = [UIColor blackColor];
			// 设置收件人，此处可通过NSArray集合指定多个收件人
			picker.recipients = [NSArray arrayWithObject:destStr];
			// 设置短信内容
			picker.body = contentStr;
			/*
			 如果运营商支持，picker还支持指定subject（主题）和attachments（附件）
			 也可用addAttachmentURL:withAlternateFilename:或
			 addAttachmentData:typeIdentifier:filename:方法添加附件 */
			// 显示MFMessageComposeViewController控制器
			[self presentViewController:picker animated:YES completion:nil];
		}
	}
}
// MFMessageComposeViewControllerDelegate协议中的方法，负责处理短信的发送结果
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
	didFinishWithResult:(MessageComposeResult)result
{
	switch (result)
	{
		case MessageComposeResultCancelled:
			[self showAlert:@"结果: 短信被取消发送"];
			break;
		case MessageComposeResultSent:
			[self showAlert:@"结果: 发送成功"];
			break;
		case MessageComposeResultFailed:
			[self showAlert:@"结果:  发送失败"];
			break;
		default:
			[self showAlert:@"结果: 没有发送短信"];
			break;
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (void) showAlert:(NSString*) msg
{
	[[[UIAlertView alloc] initWithTitle:@"发送结果" message:msg delegate:nil
		cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}
@end
