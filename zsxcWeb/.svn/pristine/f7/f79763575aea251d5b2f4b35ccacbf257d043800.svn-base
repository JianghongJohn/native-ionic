//
//  CarOrderListViewModel.m
//  掌上行车
//
//  Created by hyjt on 2017/5/8.
//
//

#import "CarOrderListViewModel.h"
#import "OrderListCell.h"
#import "CarOrderListModel.h"
#import "Root_CarOederController.h"
@implementation CarOrderListViewModel
/**
 加载数据并返回
 
 @param data 请求的数据
 @param completionblock 成功
 @param errorblock 失败
 */
-(void)JH_loadTableDataWithData:(NSDictionary *)data completionHandle:(void (^)(id))completionblock errorHandle:(void (^)(NSError *))errorblock{
    self.dataList = [[NSMutableArray alloc] init];
    [JH_NetWorking requestDataByJson:[kBaseUrlStr_Local1 stringByAppendingString:korderlist] HTTPMethod:HttpMethodGet  showHud:YES params:data completionHandle:^(id result) {
        if ([result[@"code"]isEqualToString:kSuccessCode]) {
            
            //处理数据
            NSArray *recordList = result[@"list"];
            for (NSDictionary *dic in recordList) {
                
                CarOrderListModel *detailModel = [CarOrderListModel mj_objectWithKeyValues:dic];
                
                [self.dataList addObject:detailModel];
                
            }
            
        }else{
            
        }
        completionblock(result);
    } errorHandle:^(NSError *error) {
        errorblock(error);
        
    }];
}



-(NSInteger)JH_numberOfSection{
    if (_key!=nil&&![_key isEqualToString:@""]) {
        return [self _searchData:_key].count;
    }
    return self.dataList.count;
}
-(NSInteger)JH_numberOfRow:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)JH_setUpTableViewCell:(NSIndexPath *)indexPath{
    OrderListCell *creditCell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([OrderListCell class]) owner:self options:nil]firstObject];
    creditCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    CarOrderListModel *model = self.dataList[indexPath.section];
    if (_key!=nil&&![_key isEqualToString:@""]) {
        model = [self _searchData:_key][indexPath.section];
    }
    [creditCell setModel:model];
    return creditCell;
}


-(CGFloat)JH_heightForCell:(NSIndexPath *)indexPath{
    return 110;
}
-(void)didSelectRowAndPush:(NSIndexPath *)indexPath vcName:(NSString *)vcName dic:(NSDictionary *)dic nav:(UINavigationController *)nav{
    CarOrderListModel *model = self.dataList[indexPath.section];
    if (_key!=nil&&![_key isEqualToString:@""]) {
        model = [self _searchData:_key][indexPath.section];
    }
    Root_CarOederController *carOrder = [[Root_CarOederController alloc]init];
    carOrder.ordernumber = model.ordernumber;
    carOrder.hidesBottomBarWhenPushed = YES;
    if ([dic[@"type"]isEqualToString:@"submitted"]) {
        carOrder.notAllowedEdit = YES;
    }else{
        carOrder.notAllowedEdit = NO;
    }
    [nav pushViewController:carOrder animated:YES];
    
}

/**
 搜索数据
 
 @param key 关键字
 @return 查询到的数据
 */
-(NSMutableArray *)_searchData:(NSString *)key{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (CarOrderListModel *detailModel in self.dataList) {
        if ([detailModel.customname containsString:key]||[detailModel.customidnumber containsString:key]) {
            [tempArray addObject:detailModel];
            continue;
        }
    }
    return tempArray;
}
@end
