//
//  CreditBuyerViewModel.h
//  carFinance
//
//  Created by 江弘 on 2017/4/16.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "JH_ViewModelFactory.h"
#import "CreditBuyerModel.h"

@interface CreditBuyerViewModel : JH_ViewModelFactory
@property(nonatomic,strong)NSIndexPath *currentIndexPath;
@property(nonatomic,strong)CreditBuyerModel *model;
//getStaticData
-(NSString *)getData:(DataType)dataType WithRow:(NSInteger)row;
//cellwillAooare
-(void)UIViewController:(UIViewController *)vc willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end
