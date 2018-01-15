//
//  CreditTogetherBuyerController.h
//  carFinance
//
//  Created by hyjt on 2017/4/12.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "Root_BaseController.h"
#import "CreditGuaranteeViewModel.h"

@interface CreditTogetherBuyerController : Root_BaseController
@property(nonatomic,strong)CreditTogetherViewModel *viewModel;
@property(nonatomic,copy)NSString *ordernumber;
@end
