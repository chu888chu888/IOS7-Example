//
//  FKViewController.m
//  SendMail
//
//  Created by yeeku on 13-10-23.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "FKViewController.h"

@interface FKViewController () <MFMailComposeViewControllerDelegate>
@end
@implementation FKViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
}
- (IBAction)sendMail:(id)sender
{
	// 获取界面上用户输入的内容
	NSString* toStr = self.toField.text;
	NSString* ccStr = self.ccField.text;
	NSString* bccStr = self.bccField.text;
	NSString* subjectStr = self.subjectField.text;
	NSString* contentStr = self.contentField.text;
	if(toStr != nil && toStr.length > 0
	   && subjectStr != nil && subjectStr.length > 0
	   && contentStr != nil && contentStr.length > 0)
	{
		// 如果能发送邮件
		if ([MFMailComposeViewController canSendMail])
		{
			// 创建MFMailComposeViewController对象
			MFMailComposeViewController *picker = [[MFMailComposeViewController
				alloc] init];
			// 为MFMailComposeViewController对象指定mailComposeDelegate
			picker.mailComposeDelegate = self;
			picker.navigationBar.tintColor = [UIColor blackColor];
			// 设置收件人，此处可通过NSArray集合指定多个收件人
			picker.toRecipients = [NSArray arrayWithObject:toStr];
			if (ccStr != nil && ccStr.length > 0)
			{
				// 设置抄送人，此处可通过NSArray集合指定多个抄送人
				picker.ccRecipients = [NSArray arrayWithObject:ccStr];
			}
			if (bccStr != nil && bccStr.length > 0)
			{
				// 设置密送人，此处可通过NSArray集合指定多个密送人
				picker.bccRecipients = [NSArray arrayWithObject:bccStr];
			}
			// 设置邮件主题
			picker.subject = subjectStr;
			// 设置邮件正文
			[picker setMessageBody:contentStr isHTML:NO];
			// 显示MFMailComposeViewController控制器
			[self presentViewController:picker animated:YES completion:nil];
		}
	}
}
- (IBAction)finishEdit:(id)sender
{
	[sender resignFirstResponder];
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	switch (result)
	{
		case MFMailComposeResultCancelled:
			[self showAlert:@"结果: 邮件被取消发送"];
			break;
		case MFMailComposeResultSent:
			[self showAlert:@"结果: 发送成功"];
			break;
		case MFMailComposeResultFailed:
			[self showAlert:@"结果:  发送失败"];
			break;
		case MFMailComposeResultSaved:
			[self showAlert:@"结果: 邮件被保存了"];
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