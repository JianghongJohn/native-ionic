//
//  CreditTogetherViewModel.h
//  carFinance
//
//  Created by hyjt on 2017/4/13.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "JH_ViewModelFactory.h"
#import "CreditBuyerModel.h"

@interface CreditTogetherViewModel : JH_ViewModelFactory
@property(nonatomic,strong)NSMutableArray *dataList;
@property(nonatomic,strong)NSIndexPath *currentIndexPath;
//add
-(BOOL)_AddNewData;
//delete
-(void)_deleteDataAtIndex:(NSInteger)index;
//replace
-(void)_replaceDataAtIndex:(NSInteger)index byKey:(NSString *)key newData:(id)newData;
//getStaticData
-(NSString *)getData:(DataType)dataType WithRow:(NSInteger)row;
//cellwillAooare
-(void)UIViewController:(UIViewController *)vc willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end
