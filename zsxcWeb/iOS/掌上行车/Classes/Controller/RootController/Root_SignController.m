//
//  Root_SignController.m
//  掌上行车
//
//  Created by hyjt on 2017/5/5.
//
//

#import "Root_SignController.h"
#import "JH_MJTableView.h"
#import "CarSignListViewModel.h"
#import "JH_SearchView.h"
@interface Root_SignController ()<UITableViewDelegate,UITableViewDataSource,JH_MJTableViewDelegate,JHDIYSearchBarFDelegate>
@property(nonatomic,strong)JH_MJTableView *tableView;
@property(nonatomic,strong)CarSignListViewModel *viewModel;
@property(nonatomic,strong)JH_SearchView *searchView;
@end

@implementation Root_SignController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    //下载一些数据
    [JHDownLoadFile getDicByKey:@"visatype" addInfo:nil :^(id result) {
    //            DebugLog(@"%@",result);
            }];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kNavHeight, 0, kTabbarHeight, 0));
    }];
    _viewModel = [[CarSignListViewModel alloc] init];
    
    [self JH_MJTableViewFresh];
    //当退出的时候由于没有销毁视图，调用刷新
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
        //启用下拉刷新
        [_tableView _setMJRefreshHeader];
        _tableView.tableHeaderView = self.searchView;
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
    [_viewModel JH_loadTableDataWithData:[[JH_NetWorking addKeyAndUIdForRequest:@{@"type":@"visa"}] mutableCopy] completionHandle:^(id result) {
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
    return [self.viewModel JH_heightForCell:indexPath];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAndPush:indexPath vcName:nil dic:nil nav:self.navigationController];
    
}
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
