//
//  MBProgressHUD+MyInterface.m
//  carFinance
//
//  Created by hyjt on 2017/4/19.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "MBProgressHUD+MyInterface.h"

@implementation MBProgressHUD (MyInterface)
/**
 progressHud
 */
+ (MBProgressHUD *)MBProgressShowProgressWithTitle:(NSString *)title view:(UIView *)view{
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    MBProgressHUD *hud;
    if (view) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }else{
        hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    }
    hud.label.text = title;
    hud.label.font = [UIFont systemFontOfSize:15];
    //    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.65];
    return hud;
}
/**
 successHud
 */
+ (MBProgressHUD *)MBProgressShowSuccess:(BOOL )success WithTitle:(NSString *)title view:(UIView *)view{
    MBProgressHUD *hud;
    if (view) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }else{
        hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    }
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = title;
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.label.numberOfLines = 0;
    //    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.65];
    if (success) {
        //view
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:(@"icon_success")]];
    }else{
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:(@"icon_fild")]];
    }
    //hide hud
    [hud hideAnimated:YES afterDelay:2];
    return hud;
}
/**
 hubProgress
 */
+ (MBProgressHUD *)MBProgressShowProgressViewWithTitle:(NSString *)title view:(UIView *)view{
    MBProgressHUD *hud;
    if (view) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }else{
        hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    }
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = title;
    hud.label.font = [UIFont systemFontOfSize:15];
    //    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.65];
    return hud;
}
/**
 hubText
 */
+ (MBProgressHUD *)MBProgressShowTextViewWithTitle:(NSString *)title view:(UIView *)view{
    MBProgressHUD *hud;
    if (view) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }else{
        hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    }
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.label.font = [UIFont systemFontOfSize:15];
    //    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.65];
    //hide hud
    [hud hideAnimated:YES afterDelay:2];
    return hud;

}
@end
