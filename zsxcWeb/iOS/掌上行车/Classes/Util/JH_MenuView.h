//
//  JH_MenuView.h
//  JH_MenuTitleView
//
//  Created by hyjt on 2017/3/15.
//  Copyright © 2017年 jianghong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JHMenuViewDelegate <NSObject>
@optional

/**
 改变菜单栏

 @param btn 主要是将button的tag返回
 */
-(void)changeMenuBtn:(UIButton *)btn;
@end

@interface JH_MenuView : UIView
@property(nonatomic,weak)id<JHMenuViewDelegate> JHDelegate;
/**
 创建一个头部菜单视图

 @param frame frame
 @param titles 标题名称数组
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles;

/**
 手动设置按钮点击的位置
 
 @param btn 按钮选中的位置
 */
-(void)setMenuButton:(UIButton *)btn;
@end
