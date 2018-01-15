//
//  CreditPersonStateView.h
//  carFinance
//
//  Created by hyjt on 2017/4/18.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 用户征信状态（标题、姓名、征信状态（text）、状态）
 */
@interface CreditPersonStateView : UIView

@property(nonatomic,strong)UILabel *labName;
@property(nonatomic,strong)UILabel *labState;
@property(nonatomic,assign)NSInteger fontSize;
@property(nonatomic,strong)UIColor *textColor;
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withName:(NSString *)name withState:(NSString *)state;

@end
