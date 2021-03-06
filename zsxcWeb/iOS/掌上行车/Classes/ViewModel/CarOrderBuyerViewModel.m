//
//  CarOrderBuyerViewModel.m
//  掌上行车
//
//  Created by hyjt on 2017/5/8.
//
//

#import "CarOrderBuyerViewModel.h"
#import "CarOrderPickerCell.h"
#import "CarOrderViewCell.h"
#import "JHCommonPickerView.h"
@implementation CarOrderBuyerViewModel

-(NSInteger)JH_numberOfSection{
    return 6;
}
-(NSInteger)JH_numberOfRow:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)JH_setUpTableViewCell:(NSIndexPath *)indexPath WithHandle:(void(^)())completionBlock{
    if (indexPath.section==0) {
        CarOrderPickerCell *cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([CarOrderPickerCell class]) owner:self options:nil]lastObject];
//        if (indexPath.row==0) {
//            cell.labTitle.attributedText = [JH_CommonInterface addNeedSymbol:@"签约经销商"];
//            cell.labSelect.text = self.baseInfo.signdeler==nil||self.baseInfo.signdeler.length==0?@"请选择":self.baseInfo.signdeler;
//        }else{
            cell.labTitle.attributedText = [JH_CommonInterface addNeedSymbol:@"选择经销商"];
            cell.labSelect.text = self.baseInfo.deler==nil||self.baseInfo.deler.length==0?@"请选择":self.baseInfo.deler;
            cell.labSelect.textColor = self.baseInfo.deler==nil||self.baseInfo.deler.length==0?kBaseGrayTextColor:kBaseBlackTextColor;
//        }
        return cell;
    }else{
         CarOrderViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([CarOrderViewCell class]) owner:self options:nil]lastObject];
        if (indexPath.section==1) {//购车人信息
            cell.model = self.carMan.base;
            [cell setRefreshBlock:^(NSObject *model,BOOL refresh){
                self.carMan.base = (Base *)model;
                if (refresh) {
                    completionBlock();
                }
            }];
        }else if (indexPath.section==2){//房产信息
            cell.model = self.carMan.house;
            [cell setRefreshBlock:^(NSObject *model,BOOL refresh){
                self.carMan.house = (House *)model;
                if (refresh) {
                    completionBlock();
                }
            }];
        }else if (indexPath.section==3){//工作信息
            cell.model = self.carMan.work;
            [cell setRefreshBlock:^(NSObject *model,BOOL refresh){
                self.carMan.work = (Work *)model;
                if (refresh) {
                    completionBlock();
                }
            }];
        }else if (indexPath.section==4){//紧急联系人
            cell.urgentList = self.carMan.urgency;
            [cell setUrgencyBlock:^(NSArray *urgentList,BOOL refresh){
                self.carMan.urgency = urgentList;
                if (refresh) {
                    completionBlock();
                }
            }];
        }else{//客户描述
            TypicatTextView *view = [[TypicatTextView alloc] initWithFrame:CGRectMake(10, 10, kScreen_Width-20, 50) withType:TypicalViewText withTitle:@"客户描述：" withText:self.carMan.remark withAddInfo:@"" titleArray:@[] withNecessary:YES];
            view.typical = @"remark";
            [view setInputBlock:^(NSString *text,NSString *typical){
                self.carMan.remark = text;
                completionBlock();
            }];
            [cell.contentView addSubview:view];
        }

        return cell;
        
    }
}
-(CGFloat)JH_heightForCell:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 44;
            break;
        case 1:
            return 290;
            break;
        case 2:
            return 230;
            break;
        case 3:
            return 270;
            break;
        case 4:
            return 170;
            break;
        default:
            break;
    }
    return  70;
}
//选中事件
-(void)disSelectRowWithIndexPath:(NSIndexPath *)indexPath WithHandle:(void(^)())completionBlock{
//    if (indexPath.section==0&&indexPath.row==0) {
//        NSArray *bankTitle = [JHDownLoadFile getArrayByKey:@"agencytype"];
//
//        [[[JHCommonPickerView alloc] initWithFrame:CGRectZero titleArray:bankTitle handler:^(NSString *key ,NSString *title) {
//            DebugLog(@"%@",key);
//            [self.baseInfo setValue:title forKey:@"signdeler"];
//            completionBlock();
//        }] show];
//        return;
//    }
    if (indexPath.section==0&&indexPath.row==0) {
        NSArray *bankTitle;
        //如果是非签约的只有个人散单
        bankTitle = [JHDownLoadFile getArrayByKey:@"agency"];
//        if (self.baseInfo.signdeler) {
//            if ([self.baseInfo.signdeler isEqualToString:@"非签约经销商"]) {
//                bankTitle = @[@{@"text":@"个人散单",@"value":@"0"}];
//            }
//        }
        [[[JHCommonPickerView alloc] initWithFrame:CGRectZero titleArray:bankTitle handler:^(NSString *key ,NSString *title) {
            DebugLog(@"%@",key);
            [self.baseInfo setValue:title forKey:@"deler"];
            [self.baseInfo setValue:key forKey:@"delerid"];
            completionBlock();
        }] show];
        return;
    }
}
//分组标题
-(NSString *)titleForSection:(NSInteger )section{
    return @[@"",@"购车人",@"房产信息",@"工作信息",@"紧急联系人",@"客户描述"][section];
}
/**
 创建分组头视图
 
 @param section NSIndexPath
 @return view
 */
-(UIView *)JH_setUpTableSectionHeader:(NSInteger)section{
    if (section==0) {
        return nil;
    }
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 40)];
    baseView.backgroundColor = [UIColor whiteColor];
    //separateView
    //tipView
    UIView *separateView = [[UIView alloc] initWithFrame:CGRectMake(0,0,baseView.width, 10)];
    separateView.backgroundColor = kBaseBGColor;
    [baseView addSubview:separateView];
    //tipView
    CGFloat height = 15;
    UIView *imageView = [[UIView alloc] initWithFrame:CGRectMake(10,separateView.height+height/2, 3, height)];
    imageView.backgroundColor = kBaseColor;
    [baseView addSubview:imageView];
    //titleView
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right+5, separateView.height,200, baseView.height-separateView.height)];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.text = [self titleForSection:section];
    [baseView addSubview:titleLabel];
    return baseView;
}
@end
