//
//  TapImageView.h
//  JHImageViewerController
//
//  Created by hyjt on 2017/4/10.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapImageView : UIImageView
//如果用户给这个imageView添加了数组，那么点击之后将会跳转Controller
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,assign)NSInteger imageIndex;
@end
