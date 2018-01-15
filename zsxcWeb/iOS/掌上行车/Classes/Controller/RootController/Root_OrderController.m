//
//  Root_OrderController.m
//  掌上行车
//
//  Created by hyjt on 2017/5/5.
//
//

#import "Root_OrderController.h"
#import "JH_MJTableView.h"
#import "CarOrderListViewModel.h"
#import "JH_MenuView.h"
#import "JH_SearchView.h"
@interface Root_OrderController ()<UITableViewDelegate,UITableViewDataSource,JH_MJTableViewDelegate,JHMenuViewDelegate,JHDIYSearchBarFDelegate>
@property(nonatomic,strong)JH_MJTableView *tableView;
@property(nonatomic,strong)CarOrderListViewModel *viewModel;
@property(nonatomic,strong)JH_SearchView *searchView;
@property(nonatomic,copy)NSString *type;
@end
static const int menuHeight = 40;
/**
 初审单列表，分为未提交和已提交，列表中table使用分组
 */
@implementation Root_OrderController
-(NSArray *)fileType{
    return @[@"securedparty",@"insureway",@"gpsnum",@"chargetype",@"sales",@"vehiclestruct",@"vehicletype",@"agency",@"agencytype",@"housingproperty",@"relationship",@"workage",@"operatingperiod",@"position",@"industry",@"diploma",@"vocation",@"automotivetype",@"marriagestatus"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSString *type in [self fileType]) {
        if ([type isEqualToString:@"automotivetype"]||[type isEqualToString:@"marriagestatus"]) {
            //下载一些数据
            [JHDownLoadFile getDicByKey:type addInfo:@{@"info":@"all"} :^(id result) {
                //            DebugLog(@"%@",result);
            }];
            
            continue;
        }
        //下载一些数据
        [JHDownLoadFile getDicByKey:type addInfo:nil :^(id result) {
//            DebugLog(@"%@",result);
        }];
    }

    self.automaticallyAdjustsScrollViewInsets = NO;
    //右侧按钮
    //  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info_button"] style:0 target:self action:@selector(_rightAction)];
    [self _creatMenuView];
    [self.view addSubview:self.tableView];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kNavHeight+menuHeight, 0, kTabbarHeight, 0));
    }];
    _viewModel = [[CarOrderListViewModel alloc] init];
    _type = @"tosubmit";
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
    [_viewModel JH_loadTableDataWithData:[[JH_NetWorking addKeyAndUIdForRequest:@{@"type":_type}] mutableCopy] completionHandle:^(id result) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } errorHandle:^(NSError *error) {
        
        [self _creatNoNetWorkView];
    }];
    
}

/**
 创建菜单
 */
-(void)_creatMenuView{
    JH_MenuView *menu = [[JH_MenuView alloc] initWithFrame:CGRectMake(0, kNavHeight, kScreen_Width, menuHeight) withTitles:@[@"未提交",@"已提交"]];
    [self.view addSubview:menu];
    menu.backgroundColor = [UIColor whiteColor];
    menu.JHDelegate = self;
    
}
/**
 改变菜单栏
 
 @param btn 主要是将button的tag返回
 */
-(void)changeMenuBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 100:
            _type = @"tosubmit";
            break;
        case 101:
            _type = @"submitted";
            break;
        default:
            break;
    }
    [self JH_MJTableViewFresh];
    
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
    [self.viewModel didSelectRowAndPush:indexPath vcName:nil dic:@{@"type":_type} nav:self.navigationController];

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
