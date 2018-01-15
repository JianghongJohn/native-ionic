//
//  AddCollectionViewCell.m
//  多选上传图片
//
//  Created by holier_zyq on 16/7/20.
//  Copyright © 2016年 holier_zyq. All rights reserved.
//

#import "AddCollectionViewCell.h"

@implementation AddCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 1;
        [self addSubview:self.addImageV];
        
        
    }
    return self;
}

- (UIImageView *)addImageV{
    if (!_addImageV) {
        _addImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width/2, self.contentView.bounds.size.width/2)];
        _addImageV.center = self.contentView.center;
        _addImageV.image = [UIImage imageNamed:@"button_zhengxin"];
        
    }
    return _addImageV;
}
@end
