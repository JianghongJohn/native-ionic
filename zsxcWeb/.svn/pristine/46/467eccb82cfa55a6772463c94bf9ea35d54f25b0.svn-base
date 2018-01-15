//
//  PushMessageDetailController.m
//  掌上行车
//
//  Created by hyjt on 2017/7/21.
//
//

#import "PushMessageDetailController.h"

@interface PushMessageDetailController ()

@end

@implementation PushMessageDetailController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self _setAttribute];
    [self _setMessageRead];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - system (systemMethod override)
#pragma mark - UI (creatSubView and layout)

/**
 控件赋值
 */
-(void)_setAttribute{
    self.labTitle.text = [NSString stringWithFormat:@"状态:%@",self.mes_data[@"mes_title"]];
    self.labAddTime.text = [NSString stringWithFormat:@"%@",self.mes_data[@"mes_addtime"]];
    self.labContent.text = [NSString stringWithFormat:@"结果:%@",self.mes_data[@"mes_content"]];
    if (!_isPush) {
        self.viewHeader.hidden = YES;
        self.navigationItem.title = @"消息详情";
    }
}
#pragma mark - delegate
#pragma mark - utilMethod
/**
 将消息变成已读
 */
-(void)_setMessageRead{
    
    
    if ([_mes_data[@"mes_is_read"] isEqualToString:@"0"]) {
        NSDictionary *data = @{@"mes_id":_mes_data[@"mes_id"]};
        [JH_NetWorking requestData:kJpushSet HTTPMethod:HttpMethodGet  showHud:NO params:data completionHandle:^(id result) {
            
        } errorHandle:^(NSError *error) {
            
            
        }];
    }
   

    
    
}
- (IBAction)closeAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
