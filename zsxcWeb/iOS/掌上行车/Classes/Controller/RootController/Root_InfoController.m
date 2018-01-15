//
//  Root_InfoController.m
//  carFinance
//
//  Created by hyjt on 2017/4/12.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "Root_InfoController.h"
#import "JH_MJTableView.h"
#import "CreditInfoViewModel.h"
#import "JHCustomMenu.h"
#import "JH_SearchView.h"
@interface Root_InfoController ()<UITableViewDelegate,UITableViewDataSource,JH_MJTableViewDelegate,JHDIYSearchBarFDelegate>
@property(nonatomic,strong)JH_MJTableView *tableView;
@property(nonatomic,strong)CreditInfoViewModel *viewModel;
@property(nonatomic,strong)JH_SearchView *searchView;
@property(nonatomic,assign)NSInteger page;
@end

@implementation Root_InfoController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.automaticallyAdjustsScrollViewInsets = NO;
  //右侧按钮
//  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info_button"] style:0 target:self action:@selector(_rightAction)];
  
  [self.view addSubview:self.tableView];
  [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kNavHeight, 0, kTabbarHeight, 0));
  }];
  _viewModel = [[CreditInfoViewModel alloc] init];
  _viewModel.viewController = self;

  [_viewModel JH_loadTableDataWithData:[[JH_NetWorking addKeyAndUIdForRequest:@{@"type":@"creditReturn"}] mutableCopy] completionHandle:^(id result) {
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
  } errorHandle:^(NSError *error) {
    
    [self _creatNoNetWorkView];
  }];
  
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(JH_MJTableViewFresh) name:kSetTabbar object:nil];
    
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(JH_SearchView *)searchView{
    if (!_searchView) {
        
        _searchView  = [[JH_SearchView alloc]initWithFrame:CGRectMake(0, 0,CGRectGetHeight(self.view.bounds), 40)withPlaceHold:@"搜索姓名或身份证"];
        _searchView.JHdelegate      = self;
        _searchView.tintColor = kBaseColor;
        _searchView.backgroundColor = [UIColor whiteColor];
    }
    return _searchView;
}

-(JH_MJTableView *)tableView{
  if (_tableView==nil) {
    
    _tableView = [[JH_MJTableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = self.searchView;
    //启用下拉刷新
    [_tableView _setMJRefreshHeader];
    _tableView.JHDelegate = self;
    _tableView.delegate = self;
    _tableView.dataSource = self;
  }
  
  return _tableView;
}
/**
 下拉刷新
 */
-(void)JH_MJTableViewFresh{
  [_viewModel JH_loadTableDataWithData:[[JH_NetWorking addKeyAndUIdForRequest:@{@"type":@"creditReturn"}] mutableCopy] completionHandle:^(id result) {
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
  } errorHandle:^(NSError *error) {
    
    [self _creatNoNetWorkView];
  }];
  
}

#pragma mark - tableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return [self.viewModel JH_numberOfSection];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
  return [self.viewModel JH_numberOfRow:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  return [self.viewModel JH_setUpTableViewCell:indexPath];
}

#pragma mark - tableViewDataDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [self.viewModel JH_heightForCell:indexPath];
    return height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
  return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  return 10;
}
#pragma mark - 选中事件
/**
 当输入文字改变的代理
 
 @param searchbar JH_SearchView
 */
-(void)_searchTextDidChange:(JH_SearchView *)searchbar
{
    if (searchbar.text.length == 0) {
        _viewModel.key = nil;
    }else{
        _viewModel.key = searchbar.text;
    }
    [self.tableView reloadData];
    
}
/**
 当点击搜索的代理
 
 @param searchbar JH_SearchView
 */
-(void)_searchBarSearch:(JH_SearchView *)searchbar{
    
}
@end
