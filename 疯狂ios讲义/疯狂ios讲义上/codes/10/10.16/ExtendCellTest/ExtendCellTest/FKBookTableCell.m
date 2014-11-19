//
//  FKBookTableCell.m
//  ExtendCellTest
//
//  Created by yeeku on 13-6-17.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "FKBookTableCell.h"

@implementation FKBookTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		UIColor * bgColor = [UIColor colorWithRed:0.7
			green:1.0 blue:0.7 alpha:1.0];
		// 设置该使用淡绿色背景
		self.contentView.backgroundColor = bgColor;
		// 创建一个用于显示"书名"字符串的标签
		UILabel* nameLabel = [[UILabel alloc]
			initWithFrame:CGRectMake(5 , 5 , 70 , 20)];
		// 设置该UILabel显示的文本内容
		nameLabel.text = @"书名：";
		// 设置右对齐
		nameLabel.textAlignment = NSTextAlignmentRight;
		// 设置字体
		nameLabel.font = [UIFont boldSystemFontOfSize:17];
		// 设置背景色		
		nameLabel.backgroundColor = [UIColor clearColor];
		// 将nameLabel添加到当前单元格中
		[self.contentView addSubview:nameLabel];
		// 创建一个用于显示"价格"字符串的标签
		UILabel* priceLabel = [[UILabel alloc]
			initWithFrame:CGRectMake(5 , 30 , 70 , 20)];
		// 设置该UILabel显示的文本内容
		priceLabel.text = @"价格：";
		// 设置右对齐
		priceLabel.textAlignment = NSTextAlignmentRight;
		// 设置字体
		priceLabel.font = [UIFont boldSystemFontOfSize:17];
		// 设置背景色
		priceLabel.backgroundColor = [UIColor clearColor];
		// 将priceLabel添加到当前单元格中
		[self.contentView addSubview:priceLabel];
		
		// 创建一个用于显示书名值的标签
		self.nameField = [[UILabel alloc]
			initWithFrame:CGRectMake(90 , 5 , 180 , 20)];
		// 设置左对齐
		self.nameField.textAlignment = NSTextAlignmentLeft;
		// 设置字体
		self.nameField.font = [UIFont boldSystemFontOfSize:18];
		// 设置文字颜色
		self.nameField.textColor = [UIColor blueColor];
		// 将self.nameField添加到当前单元格中
		[self.contentView addSubview:self.nameField];
		
		// 创建一个用于显示价格值的标签
		self.priceField = [[UILabel alloc]
			initWithFrame:CGRectMake(90 , 30 , 180 , 20)];
		// 设置左对齐
		self.priceField.textAlignment = NSTextAlignmentLeft;
		// 设置字体
		self.priceField.font = [UIFont boldSystemFontOfSize:18];
		// 设置文字颜色
		self.priceField.textColor = [UIColor blueColor];
		// 将self.nameField添加到当前单元格中		
		[self.contentView addSubview:self.priceField];
    }
    return self;
}
@end
