//
//  Root_MessageListController.m
//  掌上行车
//
//  Created by hyjt on 2017/7/18.
//
//

#import "Root_MessageListController.h"
#import "JH_MJTableView.h"
#import "CarOrderPushMessageViewModel.h"
#import "PushMessageDetailController.h"
#import "PushMessageModel.h"
@interface Root_MessageListController ()<UITableViewDelegate,UITableViewDataSource,JH_MJTableViewDelegate>
@property(nonatomic,strong)JH_MJTableView *tableView;
@property(nonatomic,strong)CarOrderPushMessageViewModel *viewModel;
@end

@implementation Root_MessageListController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    
    if (_isPush) {
        //创建一个头部
        [self _creatHeaderView];
        
        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kNavHeight, 0, 0, 0));
        }];
        
    }else{
        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kNavHeight, 0, kTabbarHeight, 0));
        }];
    }
    _viewModel = [[CarOrderPushMessageViewModel alloc] init];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self JH_MJTableViewFresh];
    
}
/**
 来自推送消息的完成自定义导航
 */
-(void)_creatHeaderView{
    UIView *header = [UIView new];
    [self.view addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(kNavHeight));
    }];
    header.backgroundColor = kBaseColor;
    //关闭按钮
    UIButton *closeBtn = [UIButton new];
    [header addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(header);
        make.top.equalTo(header).with.offset(20);
        make.width.equalTo(@40);
        make.height.equalTo(@44);
    }];
    [closeBtn setImage:[UIImage imageNamed:@"button_back"] forState:0];
    [closeBtn addTarget:self action:@selector(_dismiss) forControlEvents:UIControlEventTouchUpInside];
    //标题
    UILabel *label = [UILabel new];
    [header addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(header);
        make.top.equalTo(@20);
        make.height.equalTo(@44);
    }];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"消息中心";
    
}

/**
 试图消失
 */
-(void)_dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}



-(JH_MJTableView *)tableView{
    if (_tableView==nil) {
        
        _tableView = [[JH_MJTableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
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
    NSString *user_id =  [JH_FileManager getObjectFromUserDefaultByKey:kuserId];
    NSDictionary *data = @{@"user_id":user_id,
                           @"app_name":@"掌上行车"
                           };
    
    [_viewModel JH_loadTableDataWithData:data completionHandle:^(id result) {
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
//使下划线不偏移
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    // Remove seperator inset7.0
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    //8.0
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isPush) {
        PushMessageDetailController *detail = [[PushMessageDetailController alloc] init];
        PushMessageModel *model = self.viewModel.dataList[indexPath.row];
        NSDictionary *data = @{
                               @"mes_id":model.mes_id,
                               @"mes_is_read":model.mes_is_read,
                               @"mes_title":model.mes_title,
                               @"mes_addtime":model.mes_addtime,
                               @"mes_content":model.mes_content,
                               };
        detail.mes_data = data;
        detail.isPush = YES;
        
        [self presentViewController:detail animated:YES completion:nil];
        return;
    }
    [self.viewModel didSelectRowAndPush:indexPath vcName:@"PushMessageDetailController" dic:nil nav:self.navigationController];
    
}

@end
