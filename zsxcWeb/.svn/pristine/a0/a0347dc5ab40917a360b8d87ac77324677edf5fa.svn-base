//
//  UITabBar+Badge.m
//  ZSXC_iOS
//
//  Created by hyjt on 2017/3/31.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "UITabBar+Badge.h"

@implementation UITabBar (Badge)
//显示红点
- (void)showBadgeOnItmIndex:(int)index totolCount:(NSInteger )count{
    [self removeBadgeOnItemIndex:index];
    //新建小红点
    UIView *bview = [[UIView alloc]init];
    bview.tag = 100+index;
    bview.layer.cornerRadius = 5;
    bview.clipsToBounds = YES;
    bview.backgroundColor = [UIColor redColor];
    CGRect tabFram = self.frame;
    
    float percentX = (index+0.6)/count;
    CGFloat x = ceilf(percentX*tabFram.size.width);
    CGFloat y = ceilf(0.1*tabFram.size.height);
    bview.frame = CGRectMake(x, y, 10, 10);
    [self addSubview:bview];
    [self bringSubviewToFront:bview];
}
//隐藏红点
-(void)hideBadgeOnItemIndex:(int)index{
    [self removeBadgeOnItemIndex:index];
}
//移除控件
- (void)removeBadgeOnItemIndex:(int)index{
    for (UIView*subView in self.subviews) {
        if (subView.tag == 100+index) {
            [subView removeFromSuperview];
        }
    }
}
@end
