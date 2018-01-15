//
//  JPushHelper.m
//  haoqibaoyewu
//
//  Created by hyjt on 16/9/13.
//  Copyright © 2016年 jianghong. All rights reserved.
//

#import "JPushHelper.h"
#import "JPUSHService.h"
#import "Root_MessageListController.h"
@implementation JPushHelper
/**
 APP极光推送的初始化设置
 */
+ (void)setupWithOption:(NSDictionary *)launchingOption
                 appKey:(NSString *)appKey
                channel:(NSString *)channel
       apsForProduction:(BOOL)isProduction
  advertisingIdentifier:(NSString *)advertisingId{
    
    // Required
    [JPUSHService setupWithOption:launchingOption appKey:appKey channel:channel apsForProduction:isProduction advertisingIdentifier:advertisingId];
    return;
}
/**
 注册设备唯一号
 */
+ (void)registerDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
    return;
}
/**
 iOS10以下在这里监听远程通知事件
 */

+ (void)handleRemoteNotificationWithApplication:(UIApplication *)application userInfo:(NSDictionary *)userInfo completion:(void (^)(UIBackgroundFetchResult))completion {
    [JPUSHService handleRemoteNotification:userInfo];
    UIViewController *viewController = [JH_CommonInterface presentingVC];
    switch ([UIApplication sharedApplication].applicationState) {
        case UIApplicationStateInactive:
        case UIApplicationStateActive:
        {
                    [JHAlertControllerTool alertTitle:@"收到推送消息" mesasge:@"是否跳转消息列表?" preferredStyle:1 confirmHandler:^(UIAlertAction *action) {
                        Root_MessageListController *message = [[Root_MessageListController alloc] init];
                        message.isPush = YES;
                        [viewController presentViewController:message animated:YES completion:^{
            
                        }];
                    } cancleHandler:^(UIAlertAction *action) {
                        
                    } viewController:viewController];

        }
            break;
        case UIApplicationStateBackground:
            [self _dealWithData:userInfo isBackground:YES];
            break;
        default:
            break;
    }
    NSLog(@"iOS7及以上系统，收到通知:%@", [self logDic:userInfo]);
    //判断messageId是否存在
    if (completion) {
        completion(UIBackgroundFetchResultNewData);
    }
    return;
}
/**
 iOS10以下在这里监听前台通知事件
 */
+ (void)showLocalNotificationAtFront:(UILocalNotification *)notification {
    
     [self _dealWithData:notification.userInfo isBackground:NO];
    return;
}
//ios10以上
+ (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification;{
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    UNNotificationRequest *request = notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 前台收到远程通知:%@", [JPushHelper logDic:userInfo]);
         [self _dealWithData:userInfo isBackground:NO];
    }else {
        // 判断为本地通知
        NSLog(@"iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    }
}
+ (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 收到远程通知:%@", [JPushHelper logDic:userInfo]);
        [self _dealWithData:userInfo isBackground:YES];
        
    }
    else {
        // 判断为本地通知
        NSLog(@"iOS10 收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    }
}

/**
 *  处理数据并执行跳转
 */
+(void)_dealWithData:(NSDictionary *)userInfo isBackground:(BOOL )isBackground{
    UIViewController *viewController = [JH_CommonInterface presentingVC];
    if (isBackground) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            Root_MessageListController *message = [[Root_MessageListController alloc] init];
            message.isPush = YES;
            [viewController presentViewController:message animated:YES completion:^{
                
            }];
            
        });
    }else{
//        [JHAlertControllerTool alertTitle:@"收到推送消息" mesasge:@"是否跳转消息列表?" preferredStyle:1 confirmHandler:^(UIAlertAction *action) {
//            Root_MessageListController *message = [[Root_MessageListController alloc] init];
//            message.isPush = YES;
//            [viewController presentViewController:message animated:YES completion:^{
//                
//            }];
//        } cancleHandler:^(UIAlertAction *action) {
//            
//        } viewController:viewController];
    }

}

/**
 获取设备标识
 */
+(NSString *)_getRegistrationID{
    return [JPUSHService registrationID];
    
}
/**
 设置设备别名用于个人推送
 */
+(void)_setAlias{
    //获取userId

//    [JPUSHService setAlias:userId callbackSelector:nil object:nil];
}
// log NSSet with UTF8
// if not ,log will be \Uxxx
+ (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}
@end
