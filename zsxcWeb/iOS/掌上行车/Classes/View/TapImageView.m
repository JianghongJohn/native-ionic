//
//  TapImageView.m
//  JHImageViewerController
//
//  Created by hyjt on 2017/4/10.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "TapImageView.h"
#import "JHImageViewerController.h"

@implementation TapImageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _addTapGesture];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self _addTapGesture];
}
/**
 创建单机事件
 */
-(void)_addTapGesture{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapAction)];
    [self addGestureRecognizer:tap];
}

/**
 点击之后的动作
 */
-(void)_tapAction{
    //直接跳转
        JHImageViewerController *imageVC = [[JHImageViewerController alloc] init];
        //default imageArray
        imageVC.imageArray = self.imageArray?self.imageArray:@[self.image];
        //default is 0
        imageVC.imageIndex = self.imageIndex?self.imageIndex:0;
        [[self viewController:self] presentViewController:imageVC animated:YES completion:^{
            
        }];

    
}

-(UIViewController *)viewController :(UIResponder *)response{

        UIResponder *next = response.nextResponder;
        while(next !=nil){
            if([next isKindOfClass:[UIViewController class]]){
                return (UIViewController *)next;
            }
            next = next.nextResponder;
        }
        return nil;
}
@end
