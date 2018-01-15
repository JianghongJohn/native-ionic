//
//  CreditImageCell.m
//  carFinance
//
//  Created by hyjt on 2017/4/13.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "CreditImageCell.h"

@implementation CreditImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)_setImgTipText:(NSString *)text{
    _imgPicture.text = text;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
