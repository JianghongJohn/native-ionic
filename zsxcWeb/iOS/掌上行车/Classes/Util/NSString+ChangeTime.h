//
//  NSString+ChangeTime.h
//  haoqibaoyewu
//
//  Created by hyjt on 16/8/4.
//  Copyright © 2016年 jianghong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChangeTime)
//精确到天
+(NSString *)changeTimeIntervalToDate:(NSNumber *)timeInterval;
//精确到秒
+(NSString *)changeTimeIntervalToSecond:(NSNumber *)timeInterval;
/**
 将时间戳转换成月日时分
 */
+(NSString *)changeTimeIntervalToMinuteWithoutYear:(NSNumber *)timeInterval;
//返回HH:mm
+(NSString *)changeTimeIntervalToMinute:(NSNumber *)timeInterval;
//返回时间戳
+(NSNumber *)changeTimeDateToInterval:(NSString *)date;
#pragma 判断时间，区分为今天、昨天、其他
+ (NSString *)compareTimeReturnUserTime:(NSNumber *)time;
@end
