//
//  ServiceSpaceController.m
//  掌上行车
//
//  Created by hyjt on 2017/5/12.
//
//

#import "ServiceSpaceController.h"

@interface ServiceSpaceController ()

@end

@implementation ServiceSpaceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _vcTitle;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [JH_CommonInterface LoadImageFromBundle:@"建设.jpg"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(2/3.0);
        make.height.equalTo(imageView.mas_width);
    }];
    
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"正在开发中。。。";
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom);
        make.centerX.equalTo(imageView);
    }];
    
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
