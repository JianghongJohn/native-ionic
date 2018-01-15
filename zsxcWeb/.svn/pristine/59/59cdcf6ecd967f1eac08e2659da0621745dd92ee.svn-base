//
//  JHCommonPickerView.m
//  JHCommonPickerView
//
//  Created by hyjt on 2017/4/10.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "JHCommonPickerView.h"

static const CGFloat kRowFontSize = 15;
static const CGFloat kButtonHeight = 30.0f;
static const CGFloat krowHeight = 30.0f;
static const CGFloat kButtonWidth = 60.0f;
static const CGFloat kpickerHeight = 150.0f;
@interface JHCommonPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,strong)SelectDataBlock block;
@property(nonatomic,strong)NSArray *titleArray;
/** 背景图片 */
@property (strong, nonatomic) UIView *backgroundView;
/** 弹出视图 */
@property (strong, nonatomic) UIPickerView *pickerView;
/** button */
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *certainButton;
@end
@implementation JHCommonPickerView
- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray<NSDictionary *> *)titleArray handler:(SelectDataBlock)selectBlock
{
    self.block = selectBlock;
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.titleArray = titleArray;
        //backGround
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:self.backgroundView];
        [self addSubview:self.pickerView];
        [self _creatButton];
    }
    return self;
}
-(UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:self.frame];
        _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
        _backgroundView.alpha = 0;
    }
    return  _backgroundView;
}
-(UIPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.frame.size.height,self.frame.size.width, kpickerHeight)];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        
    }
    return _pickerView;
}
-(void)_creatButton{
    _cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, self.frame.size.height,kButtonWidth, kButtonHeight)];
    [self addSubview:_cancelButton];
    [_cancelButton setTitle:@"取消" forState:0];
    [_cancelButton setTitleColor:[UIColor redColor] forState:0];
    
    _cancelButton.alpha = 0.7;
    [_cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    _certainButton = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width-kButtonWidth,self.frame.size.height,kButtonWidth, kButtonHeight)];
    [self addSubview:_certainButton];
    [_certainButton setTitle:@"确定" forState:0];
    [_certainButton setTitleColor:[UIColor redColor] forState:0];
    _certainButton.alpha = 0.7;
    [_certainButton addTarget:self action:@selector(dismissWithCallback) forControlEvents:UIControlEventTouchUpInside];
}
//touch remove
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.backgroundView];
    if (!CGRectContainsPoint(self.pickerView.frame, point))
    {
        [self dismiss];
    }
}


/**
 show views
 */
- (void)show
{
    // 在主线程中处理,否则在viewDidLoad方法中直接调用,会先加本视图,后加控制器的视图到UIWindow上,导致本视图无法显示出来,这样处理后便会优先加控制器的视图到UIWindow上
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows)
        {
            BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
            BOOL windowIsVisible = !window.hidden && window.alpha > 0;
            BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
            
            if(windowOnMainScreen && windowIsVisible && windowLevelNormal)
            {
                [window addSubview:self];
                break;
            }
        }
        
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7f initialSpringVelocity:0.7f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.backgroundView.alpha = 1.0f;
            self.pickerView.frame = CGRectMake(0, self.frame.size.height-self.pickerView.frame.size.height, self.frame.size.width, self.pickerView.frame.size.height);
            _certainButton.frame = CGRectMake(self.bounds.size.width-kButtonWidth, self.frame.size.height-self.pickerView.frame.size.height, self.certainButton.frame.size.width, self.certainButton.frame.size.height);
            _cancelButton.frame = CGRectMake(0, self.frame.size.height-self.pickerView.frame.size.height, self.certainButton.frame.size.width, self.certainButton.frame.size.height);
        } completion:nil];
    }];
}
#pragma mark - pickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1 ;
}
//重写方法
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = [UIColor grayColor];
        }
    }
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        //adjustsFontSizeToFitWidth property to YES
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:kRowFontSize]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.titleArray.count;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return krowHeight;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _titleArray[row][@"text"];
    
}
/**
 callback
 */
-(void)dismissWithCallback{
    if (self.block) {
        
        _block(self.titleArray[[_pickerView selectedRowInComponent:0]][@"value"],self.titleArray[[_pickerView selectedRowInComponent:0]][@"text"]);
    }
    [self dismiss];
}
/**
 dismiss remove
 */
- (void)dismiss
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundView.alpha = 0.0f;
        self.pickerView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.pickerView.frame.size.height);
        _certainButton.frame = CGRectMake(self.bounds.size.width-kButtonWidth, self.frame.size.height, self.certainButton.frame.size.width, self.certainButton.frame.size.height);
        _cancelButton.frame = CGRectMake(0, self.frame.size.height, self.certainButton.frame.size.width, self.certainButton.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
