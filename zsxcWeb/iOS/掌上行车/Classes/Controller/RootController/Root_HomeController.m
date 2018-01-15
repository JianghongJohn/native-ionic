//
//  Root_HomeController.m
//  ZSXC_iOS
//
//  Created by hyjt on 2017/3/31.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "Root_HomeController.h"
#import "Root_CreditController.h"
#import "JPushHelper.h"
//#import "CarFinanceAppDelegate+StartAPP.h"
@interface Root_HomeController ()<UINavigationControllerDelegate>

@end

@implementation Root_HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    //下载一些数据
    [JHDownLoadFile getDicByKey:@"bank"addInfo:nil :^(id result) {
//        DebugLog(@"%@",result);
    }];
//    [JHDownLoadFile getDicByKey:@"dealer" :^(id result) {
//        DebugLog(@"%@",result);
//    }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:UIIMAGE(@"icon_back") style:UIBarButtonItemStylePlain target:self action:@selector(_logoutAction)];

    [self addBackground];
    [self _creatCreditButton];
    [self _creatBackButton];

}
//增加返回按钮
-(void)_creatBackButton{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [self.view addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"button_back"] forState:0];
    [btn setTitle:@"退出" forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitleColor:kBaseTextColor forState:0];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
      //statusBar
      [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }];
}
/**
 logOut
 */
-(void)_logoutAction{
    [JHAlertControllerTool alertTitle:@"提示" mesasge:@"确认退出当前账号？" preferredStyle:UIAlertControllerStyleAlert confirmHandler:^(UIAlertAction *action) {
        
        [self _logOutJPushWithUid:[JH_FileManager getObjectFromUserDefaultByKey:kuserId]];
        //删除保存的登录信息
        [JH_FileManager removeObjectFromUserDefaultByKey:kuserId];
        [JH_FileManager removeObjectFromUserDefaultByKey:ktoken];
        //发送通知使登录
        [[NSNotificationCenter defaultCenter]postNotificationName:kSetLogin object:nil];
        
    } cancleHandler:^(UIAlertAction *action) {
        
    } viewController:self];

}
/**
 登录成功后注册极光推送
 
 @param uId
 */
-(void)_logOutJPushWithUid:(NSString *)uId{
    //设备Id
    NSString *devId = [JPushHelper _getRegistrationID];
    NSDictionary *data = @{
                           @"device_id":devId,
                           @"user_id":uId,
                           @"app_name":@"掌上行车"
                           };
    [JH_NetWorking requestData:kJpushLogout HTTPMethod:HttpMethodGet showHud:NO params:data completionHandle:^(id result) {
        
    } errorHandle:^(NSError *error) {
        
    }];
    
    
}

-(void)addBackground{
    UIImageView *imageView = [UIImageView new];
    [self.view addSubview:imageView];
    [imageView setImage:[JH_CommonInterface LoadImageFromBundle:@"BG@2x.jpg"]];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kNavHeight, 0, kTabbarHeight, 0));
    }];
    
    
}
/**
 征信录入按钮
 */
-(void)_creatCreditButton{
    UIButton *creditButton = [UIButton new];
    [creditButton addTarget:self action:@selector(_pushToFinance:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:creditButton];
    [creditButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
    }];
    [creditButton setImage:[UIImage imageNamed:@"button_zhengxin_normal"] forState:UIControlStateNormal];
    [creditButton setImage:[UIImage imageNamed:@"button_zhengxin_click"] forState:UIControlStateHighlighted];
}








/**
 push到汽车金融
 */
-(void)_pushToFinance:(UIButton *)btn{
    
    Root_CreditController *finance = [[Root_CreditController alloc] init];
    [self _pushViewController:finance];
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
