//
//  SVCalculatePriceInfoCell.m
//  掌上行车
//
//  Created by hyjt on 2017/8/10.
//
//

#import "SVCalculatePriceInfoCell.h"

@implementation SVCalculatePriceInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(CalculatePriceModel *)model{
    if (_model != model) {
        _model = model;
    }
    
    self.labRealPay.text = [self _stringWithAddition:_model.realpay addition:@"元" isDouble:YES];
    self.labRealPayRatio.text = [self _stringWithAddition:_model.realpayratio addition:@"%" isDouble:YES];
    self.labLoanRatio.text = [self _stringWithAddition:_model.loanratio addition:@"%" isDouble:YES];
    self.labRefunMoneyRatio.text = [self _stringWithAddition:_model.refundmoney addition:@"元" isDouble:YES];
    self.labPactPrice.text = [self _stringWithAddition:_model.pactprice addition:@"元" isDouble:YES];
    self.labPactPriceRatio.text = [self _stringWithAddition:_model.pactpriceratio addition:@"%" isDouble:YES];
    self.labFirstPay.text = [self _stringWithAddition:_model.firstpay addition:@"元" isDouble:YES];
    self.labMonthPay.text = [self _stringWithAddition:_model.monthMoney addition:@"元" isDouble:YES];
    self.labAgeMoney.text = [self _stringWithAddition:_model.agemoney addition:@"元" isDouble:YES];
    
}
-(NSString *)_stringWithAddition:(NSDecimalNumber *)string addition:(NSString *)addition isDouble:(BOOL)isDouble{
    if (string) {
        if(isDouble){
            double number = string.doubleValue;
            return [NSString stringWithFormat:@"%.2f%@",number,addition];
        }
        return [NSString stringWithFormat:@"%@%@",string,addition];
    }else{
        return @"";
    }
}
@end
