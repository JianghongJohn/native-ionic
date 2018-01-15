//
//  SVCalculatePriceViewModel.m
//  掌上行车
//
//  Created by hyjt on 2017/8/10.
//
//

#import "SVCalculatePriceViewModel.h"
#import "ServiceTextCell.h"
#import "CarOrderPickerCell.h"
#import "SVCalculatePriceInfoCell.h"
#import "JHCommonPickerView.h"
@implementation SVCalculatePriceViewModel
-(NSArray *)titles{
    return @[@"贷款银行",@"年限",@"车型构成",@"上牌地",@"审核车价(元)",@"实际贷款额(元)",@"客户费率(%)"];
    
}
/**
 返回单元格高度
 
 @param indexPath NSIndexPath
 @return 高度
 */
-(CGFloat)JH_heightForCell:(NSIndexPath *)indexPath{
    return indexPath.section?230:44;
}

/**
 返回头部高度
 
 @param section 分组数
 @return 高度
 */
-(CGFloat)JH_heightForSectionHeader:(NSInteger)section{
    return section?40:0.01;
}

/**
 返回尾部高度
 
 @param section 分组数
 @return 高度
 */
-(CGFloat)JH_heightForSectionFooter:(NSInteger)section{
    return section?0.01:60;
}
/**
 创建分组头视图
 
 @param section NSIndexPath
 @return view
 */
-(UIView *)JH_setUpTableSectionHeader:(NSInteger)section{
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 40)];
    
    if (section==1) {
        //团队成员排名
        
        UIView *markView = [UIView new];
        markView.backgroundColor = kBaseColor;
        [baseView addSubview:markView];
        [markView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(baseView).with.offset(10);
            make.centerY.equalTo(baseView);
            make.height.equalTo(baseView).multipliedBy(1.0/3);
            make.width.equalTo(@3);
        }];
        UILabel *label  = [UILabel new];
        [baseView addSubview:label];
        label.textColor = kBaseBlackTextColor;
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"费用明细";
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(markView.mas_right).with.offset(10);
            make.centerY.equalTo(markView);
        }];
        
    }
    
    
    return baseView;
}
/**
 创建分组尾视图
 
 @param section NSIndexPath
 @return view
 */
-(UIView *)JH_setUpTableSectionFooter:(NSInteger)section{
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 60)];
    if (section==0) {
        UIButton *btn = [UIButton new];
        [baseView addSubview:btn];
        [btn addTarget:self action:@selector(_calculate) forControlEvents:UIControlEventTouchUpInside];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(baseView).insets(UIEdgeInsetsMake(10, 20, 10, 20));
        }];
        btn.backgroundColor = kBaseColor;
        [btn setTitle:@"按公式计算" forState:0];
        [btn setTitleColor:[UIColor whiteColor] forState:0];
        btn.layer.cornerRadius = 5;
    }
    return baseView;
}

/**
 点击计算
 */
-(void)_calculate{
    [[JH_CommonInterface presentingVC].view endEditing:YES];
    //获取贷款银行、年限、车型构成、车价、实际贷款额、客户利率、银行利率
    //获取银行利率
    self.car.bankrate = [NSDecimalNumber decimalNumberWithString:[self _getBankRate]];
    //1.首先判断是否为空
    if (![self checkData]) {
        return;
    }
    //2.审核车价不能为0
    if ([self.car.price doubleValue]<=0) {
        [JHAlertControllerTool alertTitle:@"提示" mesasge:@"审核车价必须高于0" confirmHandler:^(UIAlertAction *action) {
            
        } viewController:[JH_CommonInterface presentingVC]];
        return;
    }
    //3.实际贷款额不能高于审核车价
    if ([self.car.price doubleValue]<[self.car.loanmoney doubleValue]) {
        [JHAlertControllerTool alertTitle:@"提示" mesasge:@"审核车价不得低于实际贷款额" confirmHandler:^(UIAlertAction *action) {
            
        } viewController:[JH_CommonInterface presentingVC]];
        return;
    }
    //4.判断是否合理客户利率高于银行利率
    if ([self.car.companyrate doubleValue]<=[self.car.bankrate doubleValue]) {
        NSString *bankRate = [NSString stringWithFormat:@"%@",self.car.bankrate];
        [JHAlertControllerTool alertTitle:@"提示" mesasge:[NSString stringWithFormat:@"客户费率不得低于银行费率!\n银行费率是:%@%%",bankRate] confirmHandler:^(UIAlertAction *action) {
            
        } viewController:[JH_CommonInterface presentingVC]];
        return;
    }
    
    //5.开始计算,高息部分计算结果逢十进百，例如5909算作5900，5910算作6000。小数比例的，保留4位小数，第5位非0，往前进一位，例如0.333333，算作0.3334。月还款和分期手续费保留2位小数，第3位非0，往前进一位，例如8883.875，算作8883.88。
    //车价
    self.car.pactcarprice = self.car.price;
    NSDecimalNumber *price = self.car.pactcarprice;
    NSDecimalNumber *loanMoney = self.car.loanmoney;
    NSDecimalNumber *companyrate = self.car.companyrate;
//    //实际首付款
    NSDecimalNumber *realpay = [price decimalNumberBySubtracting: loanMoney];
    NSDecimalNumber *bankRate = [self.car.bankrate decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
    self.car.realpay = [self Rounding:realpay withCount:2 withModel:NSRoundUp];
    NSDecimalNumber *realpayratio = [realpay decimalNumberByDividingBy:price];

//    //10000对10驱余数即可判定小数第五位是否为0
    realpayratio = [self Rounding:realpayratio withCount:4 withModel:NSRoundUp];
    self.car.realpayratio = [realpayratio decimalNumberByMultiplyingByPowerOf10:2];
    NSDecimalNumber *loanratio = [loanMoney decimalNumberByDividingBy:price];
//    //实际贷款比例
    self.car.loanratio = [[self Rounding:loanratio withCount:4 withModel:NSRoundUp]decimalNumberByMultiplyingByPowerOf10:2];
//    //合同价：合同价=实际贷款额+高息部分 高息部分=实际贷款额 X（客户利率-银行利率）
//    //计算高息部分并逢十进百
    NSDecimalNumber *highPricePercent = [[companyrate decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100"]]decimalNumberBySubtracting:bankRate];
    NSDecimalNumber *highPrice = [loanMoney decimalNumberByMultiplyingBy:highPricePercent];
    if (([highPrice integerValue])%100>=10) {
        NSNumber *tempPrice = [NSNumber numberWithInteger:(([highPrice integerValue])/100+1)*100];
        NSDecimal de = [tempPrice decimalValue];
        highPrice = [NSDecimalNumber decimalNumberWithDecimal:de];
    }else{
        NSNumber *tempPrice = [NSNumber numberWithInteger:(([highPrice integerValue])/100)*100];
        NSDecimal de = [tempPrice decimalValue];
        highPrice = [NSDecimalNumber decimalNumberWithDecimal:de];
    }
//    //合同价
    NSDecimalNumber *pactPrice = [loanMoney decimalNumberByAdding:highPrice];
    
    self.car.pactprice = [self Rounding:pactPrice withCount:2 withModel:NSRoundUp];
//    //分期付款金额(为整数，小数第一位为0进1)
    NSDecimalNumber *refundMoney = [pactPrice decimalNumberByMultiplyingBy:[bankRate decimalNumberByAdding:[NSDecimalNumber decimalNumberWithString:@"1.00"]]];
//    refundMoney = [self Rounding:refundMoney withCount:0 withModel:NSRoundUp];
    self.car.refundmoney = [self Rounding:refundMoney withCount:2 withModel:NSRoundUp];
//    //合同价比例
    NSDecimalNumber *fpactpriceratio = [pactPrice decimalNumberByDividingBy:price];
    
    fpactpriceratio = [self Rounding:fpactpriceratio withCount:4 withModel:NSRoundUp];
    self.car.pactpriceratio = [fpactpriceratio decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
//    //首期付款(使用进位后的分期付款金额)
    NSDecimalNumber *numberOfMonth = [NSDecimalNumber decimalNumberWithString:self.car.loanage];
    NSDecimalNumber *firstpay = [refundMoney decimalNumberByDividingBy:numberOfMonth];
    firstpay = [self Rounding:firstpay withCount:2 withModel:NSRoundUp];
    self.car.firstpay = firstpay;
//    //月还款(使用进位后的分期付款金额)
    self.car.monthMoney = self.car.firstpay;
//    //手续费(使用进位后的分期付款金额)
    NSDecimalNumber *agemoney = [refundMoney decimalNumberBySubtracting: pactPrice];
    self.car.agemoney = [self Rounding:agemoney withCount:2 withModel:NSRoundUp];

    
    //刷新页面
    _calculateBlock();
}

/**
 数据为空验证
 */
-(BOOL)checkData{
    NSString *title;
    if (self.car.bankId==nil) {
        title = @"请选择贷款银行";
    }else if (self.car.loanage==nil){
        title = @"请选择年限";
    }else if (self.car.vehiclestruct==nil){
        title = @"请选择车型构成";
    }else if (self.car.province==nil){
        title = @"请选择上牌地";
    }else if (self.car.price==nil){
        title = @"请输入审核车价";
    }else if (self.car.loanmoney==nil){
        title = @"请输入实际贷款额";
    }else if (self.car.companyrate==nil){
        title = @"请输入客户费率";
    }else if (self.car.bankrate==nil){
        title = @"银行费率获取失败";
    }
    if (title) {
        [JHAlertControllerTool alertTitle:@"提示" mesasge:title confirmHandler:^(UIAlertAction *action) {
            
        } viewController:[JH_CommonInterface presentingVC]];
        return NO ;
    }
    return YES;
    
}

/**
 去指定位数往前进一位
 */
- (NSDecimalNumber *)Rounding:(NSDecimalNumber *)price withCount:(NSInteger )count withModel:(NSRoundingMode)model{
    //对price对象进行四舍五入
//    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:4 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
//    NSDecimalNumber *roundedOunces = [price decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    //截取两位小数
//    NSDecimalNumberHandler* roundingBehaviorSec = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:model scale:count raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
//    NSDecimalNumber *roundedOuncesSec = [price decimalNumberByRoundingAccordingToBehavior:roundingBehaviorSec];
//    
//    return roundedOuncesSec;
    //截取指定位数的后一位判断是否为0是的话就给前一位加1
    double oldPrice = [price doubleValue];
    double multiply = pow(10, count+1);
    NSInteger newIntPrice = oldPrice *multiply;
    NSInteger temp = newIntPrice%10;
    if (temp!=0) {
        newIntPrice = newIntPrice/10 +1;
    }else{
        newIntPrice = newIntPrice/10;
    }
    double newDoublePrice = newIntPrice/multiply*10;
    
    return [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithDouble:newDoublePrice] decimalValue]];
}

-(NSInteger)JH_numberOfSection{
    return 2;
}
-(NSInteger)JH_numberOfRow:(NSInteger)section{
    return section?1:7;
}
/**
 直接放回cell给VC
 
 @param indexPath indexPath 提供回调方法
 
 @return cell
 */
-(UITableViewCell *)JH_setUpTableViewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath WithHandle:(void (^)())completionBlock{
    WeakSelf
    if (indexPath.section==0) {
        if (indexPath.row<4) {
            static NSString *idetify = @"CarOrderPickerCell";
            CarOrderPickerCell * cell = [tableView dequeueReusableCellWithIdentifier:idetify];
            if (!cell)
            {
                [tableView registerNib:[UINib nibWithNibName:idetify bundle:nil] forCellReuseIdentifier:idetify];
                cell = [tableView dequeueReusableCellWithIdentifier:idetify];
            }
            cell.labTitle.text = [self titles][indexPath.row];
            NSString *value = [self.car valueForKey:[self modelKeyWithIndexPath:indexPath]];
            cell.labSelect.text = value?value:@"请选择";
            cell.labSelect.textColor = value?kBaseBlackTextColor:kBaseGrayTextColor;
            return cell;
        }else{
            static NSString *idetify = @"ServiceTextCell";
            ServiceTextCell * cell = [tableView dequeueReusableCellWithIdentifier:idetify];
            if (!cell)
            {
                [tableView registerNib:[UINib nibWithNibName:idetify bundle:nil] forCellReuseIdentifier:idetify];
                cell = [tableView dequeueReusableCellWithIdentifier:idetify];
            }
            cell.labTitle.text = [self titles][indexPath.row];
            [cell setRefreshBlock:^(NSString *key,NSString *value){
                NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:value];
                [weakSelf.car setValue:number forKey:[weakSelf modelKeyWithIndexPath:indexPath]];
                //                completionBlock();
            }];
            NSDecimalNumber *value = [self.car valueForKey:[self modelKeyWithIndexPath:indexPath]];
            if (value) {
                if ([[value stringValue]isEqualToString:@"NaN"]) {
                    cell.textInput.text = @"";
                }else{
                    
                    cell.textInput.text = [value stringValue];
                }
            }else{
                cell.textInput.text = @"";
            }
            
            return cell;
        }
    }else{
        static NSString *idetify = @"SVCalculatePriceInfoCell";
        SVCalculatePriceInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:idetify];
        if (!cell)
        {
            [tableView registerNib:[UINib nibWithNibName:idetify bundle:nil] forCellReuseIdentifier:idetify];
            cell = [tableView dequeueReusableCellWithIdentifier:idetify];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.model = self.car;
        return cell;
    }
    
}

/**
 选中之后处理完事件返回
 
 @param completionBlock completionBlock
 */
-(void)disSelectRowWithIndexPath:(NSIndexPath *)indexPath WithHandle:(void(^)())completionBlock{
    
    if (indexPath.section==0) {
        if (indexPath.row<4) {
            if (indexPath.row==1&&!self.car.bankId) {
                //获取银行先
                [JHAlertControllerTool alertTitle:@"提示" mesasge:@"请先选择贷款银行" confirmHandler:^(UIAlertAction *action) {
                    
                } viewController:[JH_CommonInterface presentingVC]];
                return;
            }
            WeakSelf
            //选择框
            [[[JHCommonPickerView alloc] initWithFrame:CGRectZero titleArray:[self _dataForPicker:indexPath.row] handler:^(NSString *key ,NSString *title) {
                [weakSelf.car setValue:title forKey:[weakSelf modelKeyWithIndexPath:indexPath]];
                //当切换银行的时候需要重置loanAge
                if (indexPath.row==0) {
                 [weakSelf.car setValue:nil forKey:@"loanage"];
                }
                completionBlock();
            }] show];
            
        }
    }
}


/**
 根据分组获取Model内部key
 
 @param indexPath 单元格位置
 */
-(NSString *)modelKeyWithIndexPath:(NSIndexPath *)indexPath{
    return @[@[@"bankId",@"loanage",@"vehiclestruct",@"province",@"price",@"loanmoney",@"companyrate"],
             @[@"realpay",@"realpayratio",@"loanratio",@"refundmoney",@"pactprice",@"pactpriceratio",@"firstpay",@"monthPay",@"agemoney"]
             ][indexPath.section][indexPath.row];
    
}

/**
 根据单元格位置返回相应的选择数据
 */
-(NSArray *)_dataForPicker:(NSInteger )index{
    //获取文件路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"bankRate"ofType:@"json"];
    
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    //格式化成json数据
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingMutableLeaves error:nil];
    
    
    
    switch (index) {
        case 0:
        {
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            for (NSString *key in [data allKeys]) {
                [arr addObject:@{@"text":key,@"value":key}];
            }
            return arr;
        }
            break;
        case 1:
        {
            //获取银行先
            NSDictionary *bank = data[self.car.bankId];
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            for (NSString *key in [bank allKeys]) {
                [arr addObject:@{@"text":key,@"value":key}];
            }
            //首先排序key(冒泡排序)
            for (int i = 0; i<arr.count; i++) {
                
                for (int j=i+1; j<arr.count; j++) {
                    
                    if ([arr[i][@"text"]compare:arr[j][@"text"] options:NSLiteralSearch]== NSOrderedDescending ) {
                        //交换ij对应的值
                        [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
                    }
                    
                }
            }
            
            return arr;
            
            
        }
            break;
        case 2:
        {
            return @[
                     @{@"text":@"新车",@"value":@"新车"},
                     @{@"text":@"二手车",@"value":@"二手车"},
                     ];
            
            
        }
            break;
        case 3:
        {
            return @[
                     @{@"text":@"浙江省",@"value":@"浙江省"},
                     @{@"text":@"非浙江省",@"value":@"非浙江省"},
                     ];
        }
            break;
        default:
            break;
    }
    
    return @[];
}

/**
 获取银行费率
 
 @return bankRate
 */
-(NSString *)_getBankRate{
    //获取文件路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"bankRate"ofType:@"json"];
    
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    //格式化成json数据
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingMutableLeaves error:nil];
    
    NSDictionary *bank = data[self.car.bankId];
    NSDictionary *car = bank[self.car.loanage];
    NSDictionary *finalData ;
    //新车二手车
    if ([self.car.vehiclestruct isEqualToString:@"新车"]) {
        finalData = car[@"new"];
    }else{
        finalData = car[@"old"];
    }
    //省内省外
    if ([self.car.province isEqualToString:@"浙江省"]) {
        
        return finalData[@"in"];
    }else{
        return finalData[@"out"];
    }
}

@end
