//
//  OrderListCell.m
//  掌上行车
//
//  Created by hyjt on 2017/5/8.
//
//

#import "OrderListCell.h"
#import "NSString+ChangeTime.h"
@implementation OrderListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(CarOrderListModel *)model{
    if (_model!=model) {
        _model = model;
        self.labCustomer.text = [NSString stringWithFormat:@"客户：%@ %@",_model.customname,_model.customidnumber];
        self.labOrdernumber.text = [NSString stringWithFormat:@"项目编号：%@",_model.ordernumber];
        self.labOrderAddTime.text = [NSString changeTimeIntervalToSecond:@([_model.orderaddtime longLongValue])];
        //处理项目状态
        NSString *statusText = [NSString stringWithFormat:@"项目状态：%@",_model.orderstatus];
        NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:statusText];
        [attribute setAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(5, statusText.length-5)];
        self.labOrderStatus.attributedText = attribute;
        
    }
    
    
}
@end
