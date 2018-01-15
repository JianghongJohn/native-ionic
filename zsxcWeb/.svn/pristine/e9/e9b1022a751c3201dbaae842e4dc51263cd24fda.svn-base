//
//  JH_DatePicker.m
//  掌上行车
//
//  Created by hyjt on 2017/7/19.
//
//

#import "JH_DatePicker.h"
static const CGFloat kButtonHeight = 40.0f;
static const CGFloat kButtonWidth = 60.0f;
#define kpickerHeight kScreen_Height/3
@interface JH_DatePicker()
/** 背景图片 */
@property (strong, nonatomic) UIView *backgroundView;
/** 弹出视图 */
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIView *btnBgView;
/** button */
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *certainButton;
@end
@implementation JH_DatePicker

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        //backGround
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:self.backgroundView];
        [self addSubview:self.datePicker];
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
-(UIDatePicker *)datePicker{
    if (!_datePicker) {
        //日期选择器
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.frame.size.height,self.frame.size.width, kpickerHeight)];
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.datePickerMode = UIDatePickerModeDate;//模式选择
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文
        _datePicker.locale = locale;
        _datePicker.maximumDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//设置输出的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];//四个y就是2014－10-15，2个y就是14-10-15，这是输出字符串的时候用到的
    }
    return _datePicker;
}

-(void)_creatButton{
    
    _btnBgView = [[UIView alloc] initWithFrame:CGRectMake(0,self.frame.size.height,kButtonWidth, kButtonHeight)];
    _btnBgView.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"];
    _btnBgView.alpha = 0.7;
    [self addSubview:_btnBgView];
    
    _cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,kButtonWidth, kButtonHeight)];
    [_btnBgView addSubview:_cancelButton];
    [_cancelButton setTitle:@"取消" forState:0];
//    [_cancelButton.titleLabel setFont: [UIFont systemFontOfSize:16]];
    [_cancelButton setTitleColor:[UIColor redColor] forState:0];
    
    //    _cancelButton.alpha = 0.7;
    [_cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    _certainButton = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width-kButtonWidth,0,kButtonWidth, kButtonHeight)];
    [_btnBgView addSubview:_certainButton];
    [_certainButton setTitle:@"确定" forState:0];
//    [_certainButton.titleLabel setFont: [UIFont systemFontOfSize:16]];
    [_certainButton setTitleColor:[UIColor redColor] forState:0];
    //    _certainButton.alpha = 0.7;
    [_certainButton addTarget:self action:@selector(dismissWithCallback) forControlEvents:UIControlEventTouchUpInside];
}
//touch remove
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.backgroundView];
    if (!CGRectContainsPoint(self.datePicker.frame, point))
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
            self.datePicker.frame = CGRectMake(0, self.frame.size.height-self.datePicker.frame.size.height, self.frame.size.width, self.datePicker.frame.size.height);
            
            _btnBgView.frame = CGRectMake(0, self.frame.size.height-self.datePicker.frame.size.height,  self.frame.size.width, self.certainButton.frame.size.height);
        } completion:nil];
    }];
}
/**
 callback
 */
-(void)dismissWithCallback{
    if (self.block) {
        
        _block(_datePicker.date);
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
        self.datePicker.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.datePicker.frame.size.height);
        _btnBgView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.certainButton.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
