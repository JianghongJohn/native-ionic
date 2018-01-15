//
//  JHPickerImageView.h
//  carFinance
//
//  Created by hyjt on 2017/4/14.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SelectBlock) (NSIndexPath * ,BOOL isDelete);
@interface JHPickerImageView : UIImageView
@property(nonatomic,strong)SelectBlock block;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,copy)NSString *text;
-(void)setPicture:(UIImage *)image;
@end
