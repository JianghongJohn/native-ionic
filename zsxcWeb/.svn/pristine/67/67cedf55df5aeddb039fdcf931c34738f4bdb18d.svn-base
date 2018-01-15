//
//  JHAlertControllerTool.h
//  carFinance
//
//  Created by 江弘 on 2017/4/16.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHAlertControllerTool : NSObject
//没有取消按钮(确认后无跳转)
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message  confirmHandler:(void(^)(UIAlertAction *action))confirmActionHandle viewController:(UIViewController *)vc;

//没有取消按钮(确认后有跳转)
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle  confirmHandler:(void(^)(UIAlertAction *action))confirmActionHandler viewController:(UIViewController *)vc;

//有取消按钮的
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle )preferredStyle  confirmHandler:(void(^)(UIAlertAction *action))confirmHandler cancleHandler:(void(^)(UIAlertAction *action))cancleHandler viewController:(UIViewController *)vc;
@end
