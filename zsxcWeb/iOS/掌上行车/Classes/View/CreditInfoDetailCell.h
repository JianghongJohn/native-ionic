//
//  CreditInfoDetailCell.h
//  carFinance
//
//  Created by hyjt on 2017/4/17.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapImageView.h"
@interface CreditInfoDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labName;
@property (weak, nonatomic) IBOutlet UILabel *labIdCard;
@property (weak, nonatomic) IBOutlet UILabel *labSex;
//@property (weak, nonatomic) IBOutlet UILabel *labMobile;
@property (weak, nonatomic) IBOutlet UILabel *labCreditState;
@property (weak, nonatomic) IBOutlet UILabel *labCreditHistory;
@property (weak, nonatomic) IBOutlet TapImageView *detailImageView;

@end
