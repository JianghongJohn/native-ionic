//
//  JH_UIWebView.m
//  haoqibaoyewu
//
//  Created by hyjt on 2016/10/26.
//  Copyright © 2016年 jianghong. All rights reserved.
//

#import "JH_UIWebView.h"

@interface JH_UIWebView ()

@end

@implementation JH_UIWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _webTitle;
    
    [self _creatWebView];

}

/**
 创建UIWebView
 */
-(void)_creatWebView{
    
   UIWebView *_webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width, self.view.bounds.size.height)];
    //    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    if (_tpl!=nil) {
        [_webView loadHTMLString:_tpl baseURL:nil];
    }else{
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
    }
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
