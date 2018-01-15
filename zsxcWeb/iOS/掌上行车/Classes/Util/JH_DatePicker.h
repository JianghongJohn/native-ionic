//
//  JH_DatePicker.h
//  掌上行车
//
//  Created by hyjt on 2017/7/19.
//
//

#import <UIKit/UIKit.h>
typedef void (^JHDateBlock) (NSDate *);
@interface JH_DatePicker : UIView
@property(nonatomic,copy)JHDateBlock block;
/**
 show views
 */
- (void)show;
@end
