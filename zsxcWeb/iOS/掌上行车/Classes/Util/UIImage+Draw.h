//
//  UIImage+Draw.h
//  carFinance
//
//  Created by hyjt on 2017/4/15.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Draw)
+ (UIImage *)imageWithColor:(UIColor *)color withRect:(CGRect )rect;
//将第一张图绘制到第二张中间
+(UIImage *)combineWithFirstImage:(UIImage *)firstImage  secondImage:(UIImage *)secondImage byRect:(CGRect)rect;
@end
