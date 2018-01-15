//
//  Root_BaseController.h
//  ZSXC_iOS
//
//  Created by hyjt on 2017/3/31.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITabBar+Badge.h"
@interface Root_BaseController : UIViewController
/**
 断网的时候调用这个方法
 */
-(void)_creatNoNetWorkView;
/**
 push视图操作
 */
-(void)_pushViewController:(UIViewController *)controller;

@end
