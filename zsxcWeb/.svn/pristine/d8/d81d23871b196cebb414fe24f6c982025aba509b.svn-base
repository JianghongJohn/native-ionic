//
//  JHCheckUtil.m
//  carFinance
//
//  Created by hyjt on 2017/4/19.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "JHCheckUtil.h"

@implementation JHCheckUtil
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber{
    NSString *regex2 = @"^\\d{11}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}
#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard: (NSString *) idCard{
    BOOL flag;
    if (idCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"(\\d{15}$)|((\\d{17})(\\d|[xX]))";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
    
}
@end
