//
//  CreditPersonStateView.m
//  carFinance
//
//  Created by hyjt on 2017/4/18.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "CreditPersonStateView.h"
const static CGFloat width = 130;
@implementation CreditPersonStateView
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withName:(NSString *)name withState:(NSString *)state
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.labName];
        
        [self addSubview:self.labState];
        NSString *creditStatus = [state isEqualToString:@""]?@"无":state;
        self.labName.text      = [NSString stringWithFormat:@"%@：%@",title,name];
        self.labState.text     = [NSString stringWithFormat:@"征信状态：%@",creditStatus];
    }
    return self;
}
-(void)setFontSize:(NSInteger)fontSize{
    if (_fontSize!=fontSize) {
        _fontSize = fontSize;
        self.labName.font = kDevice_Is_iPhone4||kDevice_Is_iPhone5?[UIFont systemFontOfSize:_fontSize-2]:[UIFont systemFontOfSize:_fontSize];
        self.labState.font = kDevice_Is_iPhone4||kDevice_Is_iPhone5?[UIFont systemFontOfSize:_fontSize-2]:[UIFont systemFontOfSize:_fontSize];
    }
}
-(void)setTextColor:(UIColor *)textColor{
    if (_textColor!=textColor) {
        _textColor = textColor;
        self.labName.textColor = _textColor;
        self.labState.textColor = _textColor;
    }
    
}

-(UILabel *)labName{
    if (!_labName) {
        _labName      = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width-width, self.height)];
        _labName.font = kDevice_Is_iPhone4||kDevice_Is_iPhone5?[UIFont systemFontOfSize:13]:[UIFont systemFontOfSize:15];
        _labName.textColor = [UIColor darkGrayColor];
    }
    return _labName;
}

-(UILabel *)labState{
    if (!_labState) {
        _labState               = [[UILabel alloc]initWithFrame:CGRectMake(self.width-width,0, width, self.height)];
        _labState.font          = kDevice_Is_iPhone4||kDevice_Is_iPhone5?[UIFont systemFontOfSize:13]:[UIFont systemFontOfSize:15];
        _labState.textAlignment = NSTextAlignmentRight;
        _labState.textColor = [UIColor darkGrayColor];
    }
    return _labState;
}
@end
