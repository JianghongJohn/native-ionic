//
//  UIImage+Draw.m
//  carFinance
//
//  Created by hyjt on 2017/4/15.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "UIImage+Draw.h"

@implementation UIImage (Draw)

+ (UIImage *)imageWithColor:(UIColor *)color withRect:(CGRect )rect
{
    
    if([[UIScreen mainScreen] scale] == 2.0){
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 2.0);
    }else{
        UIGraphicsBeginImageContext(rect.size);
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
//将第一张图绘制到第二张中间
+(UIImage *)combineWithFirstImage:(UIImage *)firstImage  secondImage:(UIImage *)secondImage byRect:(CGRect)rect{

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [[UIScreen mainScreen] scale]);
    [secondImage drawInRect:rect];
    CGFloat width = firstImage.size.width;
    CGFloat height = firstImage.size.height;
    //将第一个图绘制到中间
    [firstImage drawInRect:CGRectMake(rect.origin.x+(rect.size.width-width)/2, rect.origin.y+(rect.size.height-height)/2, width, height)];
    UIImage* imagez = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imagez;
    
}

@end
