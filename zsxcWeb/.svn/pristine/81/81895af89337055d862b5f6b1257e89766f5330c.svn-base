//
//  JHAlertControllerTool.m
//  carFinance
//
//  Created by 江弘 on 2017/4/16.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "JHAlertControllerTool.h"

@implementation JHAlertControllerTool
//没有取消按钮的
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message  confirmHandler:(void(^)(UIAlertAction *action))confirmActionHandle viewController:(UIViewController *)vc
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:confirmActionHandle];
    
    [alertController addAction:confirmAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}

//没有取消按钮(确认后有跳转)
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle )preferredStyle  confirmHandler:(void(^)(UIAlertAction *action))confirmActionHandler viewController:(UIViewController *)vc
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:confirmActionHandler];
    
    [alertController addAction:confirmAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}


//有取消按钮的
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle )preferredStyle  confirmHandler:(void(^)(UIAlertAction *action))confirmHandler cancleHandler:(void(^)(UIAlertAction *action))cancleHandler viewController:(UIViewController *)vc
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:confirmHandler];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleHandler];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}
@end
