//
//  RootTabbarController.m
//  ZSXC_iOS
//
//  Created by hyjt on 2017/3/31.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "RootTabbarController.h"
#import "UITabBar+Badge.h"
#import "Root_HomeController.h"
#import "Root_InfoController.h"
#import "RootNavController.h"
#import "Root_OrderController.h"
#import "Root_SignController.h"
#import "Root_MessageListController.h"
@interface RootTabbarController ()
{
    NSInteger _index;
}
@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setUpAllChildViewController];
}
/**
 *  添加所有子控制器方法
 */
- (void)_setUpAllChildViewController{
    /*
     设置标签栏选中默认颜色
     */
    self.tabBar.tintColor = kBaseColor;
    
    // 1.添加控制器
    Root_HomeController *home = [[Root_HomeController alloc]init];
    Root_InfoController *info = [[Root_InfoController alloc] init];
    
    Root_OrderController *order = [[Root_OrderController alloc]init];
    Root_SignController *sign = [[Root_SignController alloc] init];
    
    Root_MessageListController *message = [[Root_MessageListController alloc] init];
    
    NSArray *image_on_name = @[@"首页ICON-red",@"征信-red",@"审核icon",@"我的icon-red",@"消息-on"];
    NSArray *image_off_name = @[@"首页ICON",@"征信",@"审核",@"我的icon",@"消息"];
    NSArray *names = @[@"首页",@"征信管理",@"初审单",@"面签",@"消息"];
    NSArray *titles = @[@"首页",@"征信管理",@"初审单",@"面签",@"消息中心"];
    
    NSArray *baseVC = @[home,info,order,sign,message];

    //设置控制器
    for (int i = 0; i<names.count;i++ ) {
        //展示小红点
//        [self.tabBar showBadgeOnItmIndex:i];
        
        [self _setUpOneChildViewController:baseVC[i] image:[UIImage imageNamed:image_off_name[i]] selectedImage:[UIImage imageNamed:image_on_name[i] ] titleNames:titles[i] title:names[i]];
    }
    
}

/**
 *  添加一个子控制器的方法（图片，选中图片，文字）
 */
- (void)_setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedImage titleNames:(NSString *)titleNames title:(NSString *)title{
    
    //导航--控制器
    RootNavController *navC = [[RootNavController alloc]initWithRootViewController:viewController];

    navC.title = title;
    navC.tabBarItem.image = image;
    //设置选中图片
    navC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.navigationItem.title = titleNames;
    
    [self addChildViewController:navC];
}
/**
 tabbar切换动画
 */
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger selectIndex = [tabBar.items indexOfObject:item];
    if (selectIndex != _index) [self animationWithIndex:selectIndex];
}

- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray *tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews)
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
            [tabbarbuttonArray addObject:tabBarButton];
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount = 1;
    pulse.autoreverses = YES;
    pulse.fromValue = [NSNumber numberWithFloat:0.7];
    pulse.toValue = [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer] addAnimation:pulse forKey:nil];
    
    _index = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
