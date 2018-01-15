//
//  AppDelegate+JPush.h
//  掌上行车
//
//  Created by hyjt on 2017/7/21.
//
//

#import "AppDelegate.h"
#import "JPushHelper.h"
@interface AppDelegate (JPush)<JPUSHRegisterDelegate>
-(void)JPushApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
