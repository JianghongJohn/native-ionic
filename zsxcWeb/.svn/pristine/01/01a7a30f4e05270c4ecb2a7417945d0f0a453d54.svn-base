//
//  RootNavController.m
//  ZSXC_iOS
//
//  Created by hyjt on 2017/3/31.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "RootNavController.h"

@interface RootNavController ()

@end

@implementation RootNavController

- (void)viewDidLoad {
    [super viewDidLoad];

    //隐藏小黑线
    [self hideBorderInView:self.navigationBar];
    //设置颜色属性
    [self _setAppreranceWithTintColor:[UIColor whiteColor] BarColor:kBaseColor];

}

/**
 隐藏导航栏黑线
 
 @param view 递归view
 */
- (void)hideBorderInView:(UIView *)view{
    if ([view isKindOfClass:[UIImageView class]]
        && view.frame.size.height <= 1) {
        view.hidden = YES;
    }
    for (UIView *subView in view.subviews) {
        [self hideBorderInView:subView];
    }
}
/**
 设置属性
 */
-(void)_setAppreranceWithTintColor:(UIColor *)tintColor BarColor:(UIColor *)barColor{

    //标题颜色
    NSDictionary *navbarTitleTextAttributes = @{NSForegroundColorAttributeName:tintColor,NSFontAttributeName:[UIFont systemFontOfSize:17]};
    [self.navigationBar  setTitleTextAttributes:navbarTitleTextAttributes];
    //Item渲染颜色
    [self.navigationBar  setTintColor:tintColor];
    //背景颜色
    [self.navigationBar  setBarTintColor:barColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
