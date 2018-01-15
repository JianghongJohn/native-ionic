//
//  JH_MJTableView.h
//  JH_MJTableViewTest
//
//  Created by hyjt on 2017/3/14.
//  Copyright © 2017年 jianghong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JH_ViewModelFactory.h"
@protocol JH_MJTableViewDelegate <NSObject>

@optional
/**
 下拉刷新
 */
-(void)JH_MJTableViewFresh;
/**
 上拉加载
 */
-(void)JH_MJTableViewLoadMore;
@end

@interface JH_MJTableView : UITableView
@property(nonatomic,weak)id<JH_MJTableViewDelegate>JHDelegate;

//添加刷新部件头部
//-(void)_setMJRefreshHeader;
/**
 用户选择开启上拉加载
 */
-(void)setFooter;

/**
 根据返回的刷新状态处理
 
 @param refreshState JHRefreshState
 */
-(void)refreshEnd:(JHRefreshState )refreshState;
@end
