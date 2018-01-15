//
//  JH_MenuView.m
//  JH_MenuTitleView
//
//  Created by hyjt on 2017/3/15.
//  Copyright © 2017年 jianghong. All rights reserved.
//

#import "JH_MenuView.h"

@implementation JH_MenuView
{
    UIImageView *_bottomLineView;
    NSInteger _tag;
}
/**
 创建一个头部菜单视图
 
 @param frame frame
 @param titles 标题名称数组
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _craetHeaderView:titles];
    }
    return self;
}
/**
 *  创建三个分类的头视图
 */
-(void)_craetHeaderView:(NSArray *)titles{
    
    for (int buttonIndex =0; buttonIndex<titles.count; buttonIndex++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/titles.count*buttonIndex, 0, self.frame.size.width/titles.count, self.frame.size.height)];
        button.tag = 100+buttonIndex;
        [button setTitle:titles[buttonIndex] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(_buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        if (buttonIndex==0) {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        [self addSubview:button];
    }
    //初始化tag
    _tag = 100;
    _bottomLineView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/titles.count/2/2, self.frame.size.height-2, self.frame.size.width/titles.count/2, 2)];
    _bottomLineView.backgroundColor = [UIColor redColor];
    [self addSubview:_bottomLineView];
    //添加上部辅助线
//    UIView *verticalLineUp = [[UIView alloc] initWithFrame:CGRectMake(0, 0.5, self.frame.size.width, 0.5)];
//    verticalLineUp.backgroundColor = [UIColor lightGrayColor];
//    [self addSubview:verticalLineUp];
    //添加下部辅助线
    UIView *verticalLineBottom = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
    verticalLineBottom.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:verticalLineBottom];
}

/**
 *  按钮点击事件
 *
 */
-(void)_buttonAction:(UIButton *)btn{
    if (_tag==btn.tag) {//防止重复点击
        return;
    }
    //遍历子视图
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)view;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (view.tag==btn.tag) {
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
        }
    }
    //移动底部标记
    [UIView animateWithDuration:0.3 animations:^{
        _bottomLineView.center = CGPointMake(btn.center.x, self.frame.size.height-1);
    }];
    
    if ([self.JHDelegate respondsToSelector:@selector(changeMenuBtn:)]) {
        _tag = btn.tag;
        [self.JHDelegate changeMenuBtn:btn];
    }
    
}
/**
 手动设置按钮点击的位置
 
 @param btn 按钮选中的位置
 */
-(void)setMenuButton:(UIButton *)btn{
    [self _buttonAction:btn];
}
@end
