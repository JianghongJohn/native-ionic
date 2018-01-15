//
//  AddressPickerView.m
//  testUTF8
//
//  Created by rhcf_wujh on 16/7/14.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "AddressPickerView.h"
#import "Province.h"

@interface AddressPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
/** 背景图片 */
@property (strong, nonatomic) UIView *backgroundView;
@property (nonatomic ,strong) UIView   * titleBackgroundView;/**< 标题栏背景*/
@property (nonatomic ,strong) UIButton * cancelBtn;/**< 取消按钮*/
@property (nonatomic, strong) UIButton * sureBtn;/**< 完成按钮*/

@property (nonatomic ,strong) UIPickerView   * addressPickerView;/**< 选择器*/

@property (nonatomic ,strong) NSMutableArray * pArr;/**< 地址选择器数据源,装省份模型,每个省份模型内包含城市模型*/

@property (nonatomic ,strong) NSDictionary   * dataDict;/**< 省市区数据源字典*/
@property (nonatomic ,strong) NSMutableArray * provincesArr;/**< 省份名称数组*/
@property (nonatomic ,strong) NSDictionary   * citysDict;/**< 所有城市的字典*/
@property (nonatomic ,strong) NSDictionary   * areasDict;/**< 所有地区的字典*/


@end
@implementation AddressPickerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        //backGround
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:self.backgroundView];

        //加载地址数据源
        [self loadAddressData];
        //加载标题栏
        [self loadTitle];
        //加载选择器
        [self loadPickerView];
    }
    return self;
}
//touch remove
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.backgroundView];
    if (!CGRectContainsPoint(self.addressPickerView.frame, point)&&!CGRectContainsPoint(self.titleBackgroundView.frame, point))
    {
        [self showOrHide:NO];
    }
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
#define SELFSIZE self.bounds.size
static CGFloat const TITLEHEIGHT = 40.0;
static CGFloat const TITLEBUTTONWIDTH = 75.0;
#define kPickerHeight [UIScreen mainScreen].bounds.size.height/3
- (UIView *)titleBackgroundView{
    if (!_titleBackgroundView) {
        _titleBackgroundView = [[UIView alloc]initWithFrame:
                                CGRectMake(0, [UIScreen mainScreen].bounds.size.height, SELFSIZE.width, TITLEHEIGHT)];
        _titleBackgroundView.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"];
    }
    return _titleBackgroundView;
}

- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc]initWithFrame:
                      CGRectMake(0, 0, TITLEBUTTONWIDTH, TITLEHEIGHT)];
        [_cancelBtn setTitle:@"取消"
                    forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor redColor]
                         forState:UIControlStateNormal];
        [_cancelBtn addTarget:self
                       action:@selector(cancelBtnClicked)
             forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc]initWithFrame:
                    CGRectMake(SELFSIZE.width - TITLEBUTTONWIDTH, 0, TITLEBUTTONWIDTH, TITLEHEIGHT)];
        [_sureBtn setTitle:@"完成"
                  forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor redColor]
                       forState:UIControlStateNormal];
        [_sureBtn addTarget:self
                     action:@selector(sureBtnClicked)
           forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
- (UIPickerView *)addressPickerView{
    if (!_addressPickerView) {
        _addressPickerView = [[UIPickerView alloc]initWithFrame:
                              CGRectMake(0, [UIScreen mainScreen].bounds.size.height+TITLEHEIGHT, SELFSIZE.width, kPickerHeight-TITLEHEIGHT)];
        _addressPickerView.backgroundColor = [UIColor whiteColor];
        _addressPickerView.delegate = self;
        _addressPickerView.dataSource = self;
    }
    return _addressPickerView;
}

#pragma mark - 加载标题栏
- (void)loadTitle{
    [self addSubview:self.titleBackgroundView];
    [self.titleBackgroundView addSubview:self.cancelBtn];
    [self.titleBackgroundView addSubview:self.sureBtn];
}

#pragma mark  加载PickerView
- (void)loadPickerView{
    [self addSubview:self.addressPickerView];
}

#pragma mark - 加载地址数据
- (void)loadAddressData{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"address"
                                                          ofType:@"txt"];

    NSError  * error;
    NSString * str22 = [NSString stringWithContentsOfFile:filePath
                                                 encoding:NSUTF8StringEncoding
                                                    error:&error];
    
    if (error) {
        return;
    }
    
    _dataDict = [self dictionaryWithJsonString:str22];
    
    if (!_dataDict) {
        return;
    }
    
    _provincesArr = [_dataDict objectForKey:@"p"];
    _citysDict    = [_dataDict objectForKey:@"c"];
    _areasDict    = [_dataDict objectForKey:@"a"];

    _pArr         = [[NSMutableArray alloc]init];
    
    //省份模型数组加载各个省份模型
    for (int i = 0 ;i < _provincesArr.count; i++) {
        NSArray  * citys = [_citysDict objectForKey:_provincesArr[i]];
        Province * p     = [Province provinceWithName:_provincesArr[i]
                                               cities:citys];
        [_pArr addObject:p];
    }
    
    //各个省份模型加载各自的所有城市模型
    for (Province * p in _pArr) {
        NSMutableArray * areasArr = [[NSMutableArray alloc]init];
        for (NSString * cityName in p.cities) {
            NSString * cityKey = [NSString stringWithFormat:@"%@-%@",p.name,cityName];
            NSArray  * cityArr = [_areasDict objectForKey:cityKey];
            City     * city    = [City cityWithName:cityName areas:cityArr];
            [areasArr addObject:city];
        }
        p.cityModels = areasArr;
    }
}

#pragma mark - UIPickerDatasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    
    if (0 == component) {
        return _pArr.count;
    }
    else if (1 == component){
        NSInteger selectProvince = [pickerView selectedRowInComponent:0];
        Province  * p            = _pArr[selectProvince];
        return p.cities.count;
    }
    else if (2 == component){
        NSInteger selectProvince = [pickerView selectedRowInComponent:0];
        NSInteger selectCity     = [pickerView selectedRowInComponent:1];
        Province  * p            = _pArr[selectProvince];
        if (selectCity > p.cityModels.count - 1) {
            return 0;
        }
        City * c = p.cityModels[selectCity];
        return c.areas.count;
    }
    
    return 0;
}

#pragma mark - UIPickerViewDelegate
#pragma mark 填充文字
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    if (0 == component) {
        Province * p = _pArr[row];
        return p.name;
    }
    else if (1 == component) {
        Province * selectP = _pArr[[pickerView selectedRowInComponent:0]];
        if (row > selectP.cities.count - 1) {
            return nil;
        }
        return selectP.cities[row];
    }
    else if (2 == component) {
        NSInteger selectProvince = [pickerView selectedRowInComponent:0];
        NSInteger selectCity     = [pickerView selectedRowInComponent:1];
        Province  * p            = _pArr[selectProvince];
        if (selectCity > p.cityModels.count - 1) {
            return nil;
        }
        City * c = p.cityModels[selectCity];
        if (row > c.areas.count -1 ) {
            return nil;
        }
        return c.areas[row];
    }
    return nil;
}

#pragma mark pickerView被选中
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    if (0 == component) {
        NSInteger selectCity = [pickerView selectedRowInComponent:1];
        NSInteger selectArea = [pickerView selectedRowInComponent:2];
        [pickerView reloadComponent:1];
        [pickerView selectRow:selectCity inComponent:1 animated:YES];
        [pickerView reloadComponent:2];
        [pickerView selectRow:selectArea inComponent:2 animated:YES];
        
    }
    else if (1 == component){
        NSInteger selectArea = [pickerView selectedRowInComponent:2];
        [pickerView reloadComponent:2];
        [pickerView selectRow:selectArea inComponent:2 animated:YES];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row forComponent:(NSInteger)component
           reusingView:(UIView *)view{
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
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;
}

#pragma mark - 解析json

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData  * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError * err;
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


#pragma mark - AddressPickerViewDelegate
- (void)cancelBtnClicked{
    if ([_delegate respondsToSelector:@selector(cancelBtnClick)]) {
        [_delegate cancelBtnClick];
    }
}

- (void)show{
    [self showOrHide:YES];
}

- (void)hide{
    [self showOrHide:NO];
}

- (void)showOrHide:(BOOL)isShow{
    
    CGFloat selfY = self.frame.origin.y;
    __block CGFloat selfkY = selfY;

    if (isShow) {
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
        }];
        
        selfkY = [UIScreen mainScreen].bounds.size.height - kPickerHeight;
    }else {
        selfkY = [UIScreen mainScreen].bounds.size.height;
        
    }
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7f initialSpringVelocity:0.7f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.addressPickerView.frame = CGRectMake(0,selfkY+TITLEHEIGHT, self.bounds.size.width,kPickerHeight-TITLEHEIGHT);
        self.titleBackgroundView.frame = CGRectMake(0,selfkY, self.bounds.size.width,TITLEHEIGHT);
        if (isShow) {
            
            self.backgroundView.alpha = 1.0f;
        }else{
            
            self.backgroundView.alpha = 0.0f;
        }
    } completion:^(BOOL finished) {
        if (isShow) {

        }else{
            [self removeFromSuperview];
        }
    }];
    
}

- (void)sureBtnClicked{
    if ([_delegate respondsToSelector:@selector(sureBtnClickReturnProvince:City:Area:)]) {
        NSInteger selectProvince = [self.addressPickerView selectedRowInComponent:0];
        NSInteger selectCity     = [self.addressPickerView selectedRowInComponent:1];
        NSInteger selectArea     = [self.addressPickerView selectedRowInComponent:2];
        
        Province * p = _pArr[selectProvince];
        //解决省市同时滑动未结束时点击完成按钮的数组越界问题
        if (selectCity > p.cityModels.count - 1) {
            selectCity = p.cityModels.count - 1;
        }
        
        City * c = p.cityModels[selectCity];
        //解决省市区同时滑动未结束时点击完成按钮的数组越界问题
        if (selectArea > c.areas.count - 1) {
            selectArea = c.areas.count - 1;
        }
        [_delegate sureBtnClickReturnProvince:p.name
                                         City:c.cityName
                                         Area:c.areas[selectArea]];
    }
}





@end
