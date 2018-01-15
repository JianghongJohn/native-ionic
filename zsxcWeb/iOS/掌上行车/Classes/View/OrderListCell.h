//
//  OrderListCell.h
//  掌上行车
//
//  Created by hyjt on 2017/5/8.
//
//

#import <UIKit/UIKit.h>
#import "CarOrderListModel.h"
@interface OrderListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labCustomer;
@property (weak, nonatomic) IBOutlet UILabel *labOrdernumber;
@property (weak, nonatomic) IBOutlet UILabel *labOrderAddTime;
@property (weak, nonatomic) IBOutlet UILabel *labOrderStatus;

@property(nonatomic,strong)CarOrderListModel *model;
@end
