//
//  JHLeftViewTextField.m
//  carFinance
//
//  Created by hyjt on 2017/4/18.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "JHLeftViewTextField.h"

@implementation JHLeftViewTextField
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.font = [UIFont systemFontOfSize:15];
        self.textColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 0.5;

        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 15; //像右边偏15
    return iconRect;
}
//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 45, 0);
    
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 45, 0);
}
@end
