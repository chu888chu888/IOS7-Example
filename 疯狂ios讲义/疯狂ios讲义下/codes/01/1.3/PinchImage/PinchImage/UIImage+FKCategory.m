//
//  UIImage+FKCategory.m
//  GGImageTest
//
//  Created by yeeku on 13-7-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import "UIImage+FKCategory.h"
#import <QuartzCore/QuartzCore.h>

//extern CGImageRef UIGetScreenImage();
@implementation UIImage (FKCategory)
+ (UIImage*)captureScreen
{
	// 需要先声明该外部函数
	extern CGImageRef UIGetScreenImage();
	// 调用UIGetScreenImage()函数执行截屏
 	CGImageRef screen = UIGetScreenImage();
	// 获取截屏得到的图片
	UIImage* newImage = [UIImage imageWithCGImage:screen];
	return newImage;
}
+ (UIImage*)captureView:(UIView *)targetView
{
	// 获取目标UIView的所在的区域
	CGRect rect = targetView.frame;
	// 开始绘图
	UIGraphicsBeginImageContext(rect.size);
	// 获取当前的绘图Context
	CGContextRef context = UIGraphicsGetCurrentContext();
	// 调用CALayer的方法将当前控件绘制到绘图Context中
	[targetView.layer renderInContext:context];
	// 获取该绘图Context中的图片
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}
-(UIImage *)imageAtRect:(CGRect)rect
{
	// 获取该UIImage图片对应的CGImageRef对象
	CGImageRef srcImage = [self CGImage];
	// 从srcImage中“挖取”rect区域
	CGImageRef imageRef = CGImageCreateWithImageInRect(srcImage, rect);
	// 将“挖取”出来的CGImageRef转换为UIImage对象
	UIImage* subImage = [UIImage imageWithCGImage: imageRef];
	CGImageRelease(srcImage);
	CGImageRelease(imageRef);
	return subImage;
}
- (UIImage *)imageByScalingAspectToMinSize:(CGSize)targetSize
{
	// 获取源图片的宽和高
	CGSize imageSize = self.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	// 获取图片缩放目标大小的宽和高
	CGFloat targetWidth = targetSize.width;
	CGFloat targetHeight = targetSize.height;
	// 定义图片缩放后的宽度
	CGFloat scaledWidth = targetWidth;
	// 定义图片缩放后的高度
	CGFloat scaledHeight = targetHeight;
	CGPoint anchorPoint = CGPointZero;
	// 如果源图片的大小与缩放的目标大小不相等
	if (!CGSizeEqualToSize(imageSize, targetSize))
	{
		// 计算水平方向上的缩放因子
		CGFloat xFactor = targetWidth / width;
		// 计算垂直方向上的缩放因子
		CGFloat yFactor = targetHeight / height;
		// 定义缩放因子scaleFactor，为两个缩放因子中较大的一个
		CGFloat scaleFactor = xFactor > yFactor? xFactor : yFactor;
		// 根据缩放因子计算图片缩放后的宽度和高度
		scaledWidth  = width * scaleFactor;
		scaledHeight = height * scaleFactor;
		// 如果横向上的缩放因子大于纵向上的缩放因子，那么图片在纵向上需要裁切
		if (xFactor > yFactor)
		{
			anchorPoint.y = (targetHeight - scaledHeight) * 0.5;
		}
		// 如果横向上的缩放因子小于纵向上的缩放因子，那么图片在横向上需要裁切
		else if (xFactor < yFactor)
		{
			anchorPoint.x = (targetWidth - scaledWidth) * 0.5;
		}
	}
	// 开始绘图
	UIGraphicsBeginImageContext(targetSize);
	// 定义图片缩放后的区域
	CGRect anchorRect = CGRectZero;
	anchorRect.origin = anchorPoint;
	anchorRect.size.width  = scaledWidth;
	anchorRect.size.height = scaledHeight;
	// 将图片本身绘制到auchorRect区域中
	[self drawInRect:anchorRect];
	// 获取绘制后生成的新图片
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	// 返回新图片
	return newImage ;
}
- (UIImage *)imageByScalingAspectToMaxSize:(CGSize)targetSize
{
	// 获取源图片的宽和高
	CGSize imageSize = self.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	// 获取图片缩放目标大小的宽和高	
	CGFloat targetWidth = targetSize.width;
	CGFloat targetHeight = targetSize.height;
	// 定义图片缩放后的实际的宽和高度
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
	CGPoint anchorPoint = CGPointZero;
	// 如果源图片的大小与缩放的目标大小不相等	
	if (!CGSizeEqualToSize(imageSize, targetSize))
	{
		CGFloat xFactor = targetWidth / width;
		CGFloat yFactor = targetHeight / height;
		// 定义缩放因子scaleFactor，为两个缩放因子中较小的一个
		CGFloat scaleFactor = xFactor < yFactor ? xFactor:yFactor;
		// 根据缩放因子计算图片缩放后的宽度和高度		
		scaledWidth  = width * scaleFactor;
		scaledHeight = height * scaleFactor;
		// 如果横向的缩放因子小于纵向的缩放因子，图片在上面、下面有空白
		// 那么图片在纵向上需要下移一段距离，保持图片在中间
		if (xFactor < yFactor)
		{
			anchorPoint.y = (targetHeight - scaledHeight) * 0.5;
		}
		// 如果横向的缩放因子小于纵向的缩放因子，图片在左边、右边有空白
		// 那么图片在横向上需要右移一段距离，保持图片在中间
		else if (xFactor > yFactor)
		{
			anchorPoint.x = (targetWidth - scaledWidth) * 0.5;
		}
	}
	// 开始绘图
	UIGraphicsBeginImageContext(targetSize);
	// 定义图片缩放后的区域
	CGRect anchorRect = CGRectZero;
	anchorRect.origin = anchorPoint;
	anchorRect.size.width  = scaledWidth;
	anchorRect.size.height = scaledHeight;
	// 将图片本身绘制到auchorRect区域中
	[self drawInRect:anchorRect];
	// 获取绘制后生成的新图片
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	// 返回新图片
	return newImage ;
}
- (UIImage *)imageByScalingToSize:(CGSize)targetSize
{
	// 开始绘图
	UIGraphicsBeginImageContext(targetSize);
	// 定义图片缩放后的区域，因此无需保持纵横比，所以直接缩放
	CGRect anchorRect = CGRectZero;
	anchorRect.origin = CGPointZero;
	anchorRect.size = targetSize;
	// 将图片本身绘制到auchorRect区域中
	[self drawInRect:anchorRect];
	// 获取绘制后生成的新图片
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	// 返回新图片
	return newImage;
}
// 图片旋转角度
- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
	// 定义一个执行旋转的CGAffineTransform结构体
	CGAffineTransform t = CGAffineTransformMakeRotation(radians);
	// 对图片的原始区域执行旋转，获取旋转后的区域
	CGRect rotatedRect = CGRectApplyAffineTransform(
		CGRectMake(0.0 , 0.0, self.size.width, self.size.height) , t);
	// 获取图片旋转后的大小
	CGSize rotatedSize = rotatedRect.size;
	// 创建绘制位图的上下文
	UIGraphicsBeginImageContext(rotatedSize);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	// 指定坐标变换，将坐标中心平移到图片的中心
	CGContextTranslateCTM(ctx, rotatedSize.width/2, rotatedSize.height/2);
	// 执行坐标变换，旋转过radians弧度
	CGContextRotateCTM(ctx , radians);
	// 执行坐标变换，执行缩放
	CGContextScaleCTM(ctx, 1.0, -1.0);
	// 绘制图片
	CGContextDrawImage(ctx, CGRectMake(-self.size.width / 2
			, -self.size.height / 2,
			self.size.width,
			self.size.height), self.CGImage);
	// 获取绘制后生成的新图片
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	// 返回新图片
	return newImage;
}
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
	return [self imageRotatedByRadians:degrees * M_PI / 180];
}
- (void) saveToDocuments:(NSString*)fileName
{
	// 获取当前应用路径下的Documents目录下的指定文件名对应的文件路径
	NSString *path = [[NSHomeDirectory()
		stringByAppendingPathComponent:@"Documents"]
		stringByAppendingPathComponent:fileName];
	// 保存PNG图片
	[UIImagePNGRepresentation(self)
	 	writeToFile:path atomically:YES];
//	// 保存JPG图片	
//	[UIImageJPEGRepresentation(self, 1.0) // 1.0代表图片压缩比率
//		writeToFile:path atomically:YES];
}
@end
