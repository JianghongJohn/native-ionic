//
//  JHCommonPickerView.h
//  JHCommonPickerView
//
//  Created by hyjt on 2017/4/10.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SelectDataBlock) (NSString * ,NSString *);
@interface JHCommonPickerView : UIView
- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray<NSDictionary *> *)titleArray handler:(SelectDataBlock)selectBlock;
-(void)show;
@end
