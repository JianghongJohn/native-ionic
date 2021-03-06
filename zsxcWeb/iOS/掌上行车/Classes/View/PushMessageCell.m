//
//  PushMessageCell.m
//  掌上行车
//
//  Created by hyjt on 2017/7/18.
//
//

#import "PushMessageCell.h"

@implementation PushMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(PushMessageModel *)model{
    if (_model!=model) {
        _model = model;
    }
    
    self.labStatus.text = [NSString stringWithFormat:@"状态:%@",_model.mes_title];
    self.labTime.text = [NSString stringWithFormat:@"%@",_model.mes_addtime];
    NSString *conrent = [_model.mes_content stringByReplacingOccurrencesOfString:@"<br>" withString:@""];
    self.labContent.text = [NSString stringWithFormat:@"结果:%@(点击查看详情)",conrent];
    if ([_model.mes_is_read isEqualToString:@"1"]) {
        self.viewRed.hidden = YES;
        self.backgroundColor = kBaseBGColor;
    }else{
        self.viewRed.layer.cornerRadius = 4;
        self.viewRed.hidden = NO;
        self.backgroundColor = [UIColor whiteColor];
    }
}
@end
