//
//  SDSelectorCell.m
//  SDPagesSelector
//
//  Created by 宋东昊 on 16/7/15.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "JHMenuControlCell.h"

@interface JHMenuControlCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation JHMenuControlCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _selectedColor = [UIColor redColor];
        _normalColor = [UIColor whiteColor];
        _selectedFont = _normalFont = [UIFont systemFontOfSize:14];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}

-(void)setSelected:(BOOL)selected
{
    super.selected = selected;
    if (selected) {
        _titleLabel.font = _selectedFont;
        _titleLabel.textColor = _selectedColor;
//        _titleLabel.backgroundColor = [UIColor lightGrayColor];
    }else{
        _titleLabel.font = _normalFont;
        _titleLabel.textColor = _normalColor;
//        _titleLabel.backgroundColor = [UIColor whiteColor];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.frame = self.bounds;
}

@end
