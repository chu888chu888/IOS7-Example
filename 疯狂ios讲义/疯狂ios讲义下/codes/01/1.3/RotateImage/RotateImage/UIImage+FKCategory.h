//
//  UIImage+FKCategory.h
//  GGImageTest
//
//  Created by yeeku on 13-7-7.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FKCategory)
// 对指定UI控件进行截图
+ (UIImage*)captureView:(UIView *)targetView;
+ (UIImage*)captureScreen;
// 定义一个方法用于“挖取”图片的指定区域
- (UIImage *)imageAtRect:(CGRect)rect;
// 保持图片纵横比缩放，最短边必须匹配targetSize的大小
// 可能有一条边的长度会超过targetSize指定的大小
- (UIImage *)imageByScalingAspectToMinSize:(CGSize)targetSize;
// 保持图片纵横比缩放，最长边匹配targetSize的大小即可
// 可能有一条边的长度会小于targetSize指定的大小
- (UIImage *)imageByScalingAspectToMaxSize:(CGSize)targetSize;
// 不保持图片纵横比缩放
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
// 对图片按弧度执行旋转
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
// 对图片按角度执行旋转
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (void) saveToDocuments:(NSString*)fileName;
@end
