//
//  CarSignDetailController.h
//  掌上行车
//
//  Created by hyjt on 2017/5/11.
//
//

#import "Root_BaseController.h"
#import "CarOrderListModel.h"
@interface CarSignDetailController : Root_BaseController
@property (weak, nonatomic) IBOutlet UILabel *labCustomer;
@property (weak, nonatomic) IBOutlet UILabel *labOrderNumber;
@property (weak, nonatomic) IBOutlet UILabel *labCreatTime;
@property (weak, nonatomic) IBOutlet UILabel *labStatus;
@property (weak, nonatomic) IBOutlet UILabel *labLocation;
@property(nonatomic,copy)CarOrderListModel *signModel;
@end
