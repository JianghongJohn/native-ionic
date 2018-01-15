//
//	Car.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Car.h"

NSString *const kCarAgemoney = @"agemoney";
NSString *const kCarAssess = @"assess";
NSString *const kCarAutomotivetype = @"automotivetype";
NSString *const kCarBankrate = @"bankrate";
NSString *const kCarCity = @"city";
NSString *const kCarCompanyrate = @"companyrate";
NSString *const kCarCounty = @"county";
NSString *const kCarFirstpay = @"firstpay";
NSString *const kCarGenreNum = @"genre_num";
NSString *const kCarIsboard = @"isboard";
NSString *const kCarLoanage = @"loanage";
NSString *const kCarLoanbank = @"loanbank";
NSString *const kCarLoanbankid = @"loanbankid";
NSString *const kCarLoanmoney = @"loanmoney";
NSString *const kCarLoanratio = @"loanratio";
NSString *const kCarLoantype = @"loantype";
NSString *const kCarMonthpay = @"monthpay";
NSString *const kCarMortgagehigh = @"mortgagehigh";
NSString *const kCarOwner = @"owner";
NSString *const kCarPactcarprice = @"pactcarprice";
NSString *const kCarPactprice = @"pactprice";
NSString *const kCarPactpriceratio = @"pactpriceratio";
NSString *const kCarPrice = @"price";
NSString *const kCarProvince = @"province";
NSString *const kCarRealpay = @"realpay";
NSString *const kCarRealpayratio = @"realpayratio";
NSString *const kCarRefundmoney = @"refundmoney";
NSString *const kCarRefundmoneyratio = @"refundmoneyratio";
NSString *const kCarRegisttime = @"registtime";
NSString *const kCarRemark = @"remark";
NSString *const kCarSeatnum = @"seatnum";
NSString *const kCarVehiclestruct = @"vehiclestruct";
NSString *const kCarVehicletype = @"vehicletype";

@interface Car ()
@end
@implementation Car




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCarAgemoney] isKindOfClass:[NSNull class]]){
        self.agemoney = dictionary[kCarAgemoney];
    }
    if(![dictionary[kCarAssess] isKindOfClass:[NSNull class]]){
        self.assess = dictionary[kCarAssess];
    }
    if(![dictionary[kCarAutomotivetype] isKindOfClass:[NSNull class]]){
        self.automotivetype = dictionary[kCarAutomotivetype];
    }
    if(![dictionary[kCarBankrate] isKindOfClass:[NSNull class]]){
        self.bankrate = dictionary[kCarBankrate];
    }
    if(![dictionary[kCarCity] isKindOfClass:[NSNull class]]){
        self.city = dictionary[kCarCity];
    }
    if(![dictionary[kCarCompanyrate] isKindOfClass:[NSNull class]]){
        self.companyrate = dictionary[kCarCompanyrate];
    }
    if(![dictionary[kCarCounty] isKindOfClass:[NSNull class]]){
        self.county = dictionary[kCarCounty];
    }
    if(![dictionary[kCarFirstpay] isKindOfClass:[NSNull class]]){
        self.firstpay = dictionary[kCarFirstpay];
    }
    if(![dictionary[kCarGenreNum] isKindOfClass:[NSNull class]]){
        self.genre_num = dictionary[kCarGenreNum];
    }
    if(![dictionary[kCarIsboard] isKindOfClass:[NSNull class]]){
        self.isboard = dictionary[kCarIsboard];
    }
    if(![dictionary[kCarLoanage] isKindOfClass:[NSNull class]]){
        self.loanage = dictionary[kCarLoanage];
    }
    if(![dictionary[kCarLoanbank] isKindOfClass:[NSNull class]]){
        self.loanbank = dictionary[kCarLoanbank];
    }
    if(![dictionary[kCarLoanbankid] isKindOfClass:[NSNull class]]){
        self.loanbankid = dictionary[kCarLoanbankid];
    }
    if(![dictionary[kCarLoanmoney] isKindOfClass:[NSNull class]]){
        self.loanmoney = dictionary[kCarLoanmoney];
    }
    
    if(![dictionary[kCarLoanratio] isKindOfClass:[NSNull class]]){
        self.loanratio = dictionary[kCarLoanratio];
    }
    if(![dictionary[kCarLoantype] isKindOfClass:[NSNull class]]){
        self.loantype = dictionary[kCarLoantype];
    }
    if(![dictionary[kCarMonthpay] isKindOfClass:[NSNull class]]){
        self.monthpay = dictionary[kCarMonthpay];
    }
    if(![dictionary[kCarMortgagehigh] isKindOfClass:[NSNull class]]){
        self.mortgagehigh = dictionary[kCarMortgagehigh];
    }
    if(![dictionary[kCarOwner] isKindOfClass:[NSNull class]]){
        self.owner = dictionary[kCarOwner];
    }
    if(![dictionary[kCarPactcarprice] isKindOfClass:[NSNull class]]){
        self.pactcarprice = dictionary[kCarPactcarprice];
    }
    if(![dictionary[kCarPactprice] isKindOfClass:[NSNull class]]){
        self.pactprice = dictionary[kCarPactprice];
    }
    if(![dictionary[kCarPactpriceratio] isKindOfClass:[NSNull class]]){
        self.pactpriceratio = dictionary[kCarPactpriceratio];
    }
    if(![dictionary[kCarPrice] isKindOfClass:[NSNull class]]){
        self.price = dictionary[kCarPrice];
    }
    if(![dictionary[kCarProvince] isKindOfClass:[NSNull class]]){
        self.province = dictionary[kCarProvince];
    }
    if(![dictionary[kCarRealpay] isKindOfClass:[NSNull class]]){
        self.realpay = dictionary[kCarRealpay];
    }
    if(![dictionary[kCarRealpayratio] isKindOfClass:[NSNull class]]){
        self.realpayratio = dictionary[kCarRealpayratio];
    }
    if(![dictionary[kCarRefundmoney] isKindOfClass:[NSNull class]]){
        self.refundmoney = dictionary[kCarRefundmoney];
    }
    if(![dictionary[kCarRefundmoneyratio] isKindOfClass:[NSNull class]]){
        self.refundmoneyratio = dictionary[kCarRefundmoneyratio];
    }
    if(![dictionary[kCarRegisttime] isKindOfClass:[NSNull class]]){
        self.registtime = dictionary[kCarRegisttime];
    }
    if(![dictionary[kCarRemark] isKindOfClass:[NSNull class]]){
        self.remark = dictionary[kCarRemark];
    }
    if(![dictionary[kCarSeatnum] isKindOfClass:[NSNull class]]){
        self.seatnum = dictionary[kCarSeatnum];
    }
    if(![dictionary[kCarVehiclestruct] isKindOfClass:[NSNull class]]){
        self.vehiclestruct = dictionary[kCarVehiclestruct];
    }
    if(![dictionary[kCarVehicletype] isKindOfClass:[NSNull class]]){
        self.vehicletype = dictionary[kCarVehicletype];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.agemoney != nil){
        dictionary[kCarAgemoney] = self.agemoney;
    }
    if(self.assess != nil){
        dictionary[kCarAssess] = self.assess;
    }
    if(self.automotivetype != nil){
        dictionary[kCarAutomotivetype] = self.automotivetype;
    }
    if(self.bankrate != nil){
        dictionary[kCarBankrate] = self.bankrate;
    }
    if(self.city != nil){
        dictionary[kCarCity] = self.city;
    }
    if(self.companyrate != nil){
        dictionary[kCarCompanyrate] = self.companyrate;
    }
    if(self.county != nil){
        dictionary[kCarCounty] = self.county;
    }
    if(self.firstpay != nil){
        dictionary[kCarFirstpay] = self.firstpay;
    }
    if(self.genre_num != nil){
        dictionary[kCarGenreNum] = self.genre_num;
    }
    if(self.isboard != nil){
        dictionary[kCarIsboard] = self.isboard;
    }
    if(self.loanage != nil){
        dictionary[kCarLoanage] = self.loanage;
    }
    if(self.loanbank != nil){
        dictionary[kCarLoanbank] = self.loanbank;
    }
    if(self.loanbankid != nil){
        dictionary[kCarLoanbankid] = self.loanbankid;
    }
    dictionary[kCarLoanmoney] = self.loanmoney;
    if(self.loanratio != nil){
        dictionary[kCarLoanratio] = self.loanratio;
    }
    if(self.loantype != nil){
        dictionary[kCarLoantype] = self.loantype;
    }
    if(self.monthpay != nil){
        dictionary[kCarMonthpay] = self.monthpay;
    }
    if(self.mortgagehigh != nil){
        dictionary[kCarMortgagehigh] = self.mortgagehigh;
    }
    if(self.owner != nil){
        dictionary[kCarOwner] = self.owner;
    }
    if(self.pactcarprice != nil){
        dictionary[kCarPactcarprice] = self.pactcarprice;
    }
    if(self.pactprice != nil){
        dictionary[kCarPactprice] = self.pactprice;
    }
    if(self.pactpriceratio != nil){
        dictionary[kCarPactpriceratio] = self.pactpriceratio;
    }
    if(self.price != nil){
        dictionary[kCarPrice] = self.price;
    }
    if(self.province != nil){
        dictionary[kCarProvince] = self.province;
    }
    if(self.realpay != nil){
        dictionary[kCarRealpay] = self.realpay;
    }
    if(self.realpayratio != nil){
        dictionary[kCarRealpayratio] = self.realpayratio;
    }
    if(self.refundmoney != nil){
        dictionary[kCarRefundmoney] = self.refundmoney;
    }
    if(self.refundmoneyratio != nil){
        dictionary[kCarRefundmoneyratio] = self.refundmoneyratio;
    }
    if(self.registtime != nil){
        dictionary[kCarRegisttime] = self.registtime;
    }
    if(self.remark != nil){
        dictionary[kCarRemark] = self.remark;
    }
    if(self.seatnum != nil){
        dictionary[kCarSeatnum] = self.seatnum;
    }
    if(self.vehiclestruct != nil){
        dictionary[kCarVehiclestruct] = self.vehiclestruct;
    }
    if(self.vehicletype != nil){
        dictionary[kCarVehicletype] = self.vehicletype;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.agemoney != nil){
        [aCoder encodeObject:self.agemoney forKey:kCarAgemoney];
    }
    if(self.assess != nil){
        [aCoder encodeObject:self.assess forKey:kCarAssess];
    }
    if(self.automotivetype != nil){
        [aCoder encodeObject:self.automotivetype forKey:kCarAutomotivetype];
    }
    if(self.bankrate != nil){
        [aCoder encodeObject:self.bankrate forKey:kCarBankrate];
    }
    if(self.city != nil){
        [aCoder encodeObject:self.city forKey:kCarCity];
    }
    if(self.companyrate != nil){
        [aCoder encodeObject:self.companyrate forKey:kCarCompanyrate];
    }
    if(self.county != nil){
        [aCoder encodeObject:self.county forKey:kCarCounty];
    }
    if(self.firstpay != nil){
        [aCoder encodeObject:self.firstpay forKey:kCarFirstpay];
    }
    if(self.genre_num != nil){
        [aCoder encodeObject:self.genre_num forKey:kCarGenreNum];
    }
    if(self.isboard != nil){
        [aCoder encodeObject:self.isboard forKey:kCarIsboard];
    }
    if(self.loanage != nil){
        [aCoder encodeObject:self.loanage forKey:kCarLoanage];
    }
    if(self.loanbank != nil){
        [aCoder encodeObject:self.loanbank forKey:kCarLoanbank];
    }
    if(self.loanbankid != nil){
        [aCoder encodeObject:self.loanbankid forKey:kCarLoanbankid];
    }
    [aCoder encodeObject:self.loanmoney forKey:kCarLoanmoney];	if(self.loanratio != nil){
        [aCoder encodeObject:self.loanratio forKey:kCarLoanratio];
    }
    if(self.loantype != nil){
        [aCoder encodeObject:self.loantype forKey:kCarLoantype];
    }
    if(self.monthpay != nil){
        [aCoder encodeObject:self.monthpay forKey:kCarMonthpay];
    }
    if(self.mortgagehigh != nil){
        [aCoder encodeObject:self.mortgagehigh forKey:kCarMortgagehigh];
    }
    if(self.owner != nil){
        [aCoder encodeObject:self.owner forKey:kCarOwner];
    }
    if(self.pactcarprice != nil){
        [aCoder encodeObject:self.pactcarprice forKey:kCarPactcarprice];
    }
    if(self.pactprice != nil){
        [aCoder encodeObject:self.pactprice forKey:kCarPactprice];
    }
    if(self.pactpriceratio != nil){
        [aCoder encodeObject:self.pactpriceratio forKey:kCarPactpriceratio];
    }
    if(self.price != nil){
        [aCoder encodeObject:self.price forKey:kCarPrice];
    }
    if(self.province != nil){
        [aCoder encodeObject:self.province forKey:kCarProvince];
    }
    if(self.realpay != nil){
        [aCoder encodeObject:self.realpay forKey:kCarRealpay];
    }
    if(self.realpayratio != nil){
        [aCoder encodeObject:self.realpayratio forKey:kCarRealpayratio];
    }
    if(self.refundmoney != nil){
        [aCoder encodeObject:self.refundmoney forKey:kCarRefundmoney];
    }
    if(self.refundmoneyratio != nil){
        [aCoder encodeObject:self.refundmoneyratio forKey:kCarRefundmoneyratio];
    }
    if(self.registtime != nil){
        [aCoder encodeObject:self.registtime forKey:kCarRegisttime];
    }
    if(self.remark != nil){
        [aCoder encodeObject:self.remark forKey:kCarRemark];
    }
    if(self.seatnum != nil){
        [aCoder encodeObject:self.seatnum forKey:kCarSeatnum];
    }
    if(self.vehiclestruct != nil){
        [aCoder encodeObject:self.vehiclestruct forKey:kCarVehiclestruct];
    }
    if(self.vehicletype != nil){
        [aCoder encodeObject:self.vehicletype forKey:kCarVehicletype];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.agemoney = [aDecoder decodeObjectForKey:kCarAgemoney];
    self.assess = [aDecoder decodeObjectForKey:kCarAssess];
    self.automotivetype = [aDecoder decodeObjectForKey:kCarAutomotivetype];
    self.bankrate = [aDecoder decodeObjectForKey:kCarBankrate];
    self.city = [aDecoder decodeObjectForKey:kCarCity];
    self.companyrate = [aDecoder decodeObjectForKey:kCarCompanyrate];
    self.county = [aDecoder decodeObjectForKey:kCarCounty];
    self.firstpay = [aDecoder decodeObjectForKey:kCarFirstpay];
    self.genre_num = [aDecoder decodeObjectForKey:kCarGenreNum];
    self.isboard = [aDecoder decodeObjectForKey:kCarIsboard];
    self.loanage = [aDecoder decodeObjectForKey:kCarLoanage];
    self.loanbank = [aDecoder decodeObjectForKey:kCarLoanbank];
    self.loanbankid = [aDecoder decodeObjectForKey:kCarLoanbankid];
    self.loanmoney = [aDecoder decodeObjectForKey:kCarLoanmoney] ;
    self.loanratio = [aDecoder decodeObjectForKey:kCarLoanratio];
    self.loantype = [aDecoder decodeObjectForKey:kCarLoantype];
    self.monthpay = [aDecoder decodeObjectForKey:kCarMonthpay];
    self.mortgagehigh = [aDecoder decodeObjectForKey:kCarMortgagehigh];
    self.owner = [aDecoder decodeObjectForKey:kCarOwner];
    self.pactcarprice = [aDecoder decodeObjectForKey:kCarPactcarprice];
    self.pactprice = [aDecoder decodeObjectForKey:kCarPactprice];
    self.pactpriceratio = [aDecoder decodeObjectForKey:kCarPactpriceratio];
    self.price = [aDecoder decodeObjectForKey:kCarPrice];
    self.province = [aDecoder decodeObjectForKey:kCarProvince];
    self.realpay = [aDecoder decodeObjectForKey:kCarRealpay];
    self.realpayratio = [aDecoder decodeObjectForKey:kCarRealpayratio];
    self.refundmoney = [aDecoder decodeObjectForKey:kCarRefundmoney];
    self.refundmoneyratio = [aDecoder decodeObjectForKey:kCarRefundmoneyratio];
    self.registtime = [aDecoder decodeObjectForKey:kCarRegisttime];
    self.remark = [aDecoder decodeObjectForKey:kCarRemark];
    self.seatnum = [aDecoder decodeObjectForKey:kCarSeatnum];
    self.vehiclestruct = [aDecoder decodeObjectForKey:kCarVehiclestruct];
    self.vehicletype = [aDecoder decodeObjectForKey:kCarVehicletype];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    Car *copy = [Car new];
    
    copy.agemoney = [self.agemoney copy];
    copy.assess = [self.assess copy];
    copy.automotivetype = [self.automotivetype copy];
    copy.bankrate = [self.bankrate copy];
    copy.city = [self.city copy];
    copy.companyrate = [self.companyrate copy];
    copy.county = [self.county copy];
    copy.firstpay = [self.firstpay copy];
    copy.genre_num = [self.genre_num copy];
    copy.isboard = [self.isboard copy];
    copy.loanage = [self.loanage copy];
    copy.loanbank = [self.loanbank copy];
    copy.loanbankid = [self.loanbankid copy];
    copy.loanmoney = self.loanmoney;
    copy.loanratio = [self.loanratio copy];
    copy.loantype = [self.loantype copy];
    copy.monthpay = [self.monthpay copy];
    copy.mortgagehigh = [self.mortgagehigh copy];
    copy.owner = [self.owner copy];
    copy.pactcarprice = [self.pactcarprice copy];
    copy.pactprice = [self.pactprice copy];
    copy.pactpriceratio = [self.pactpriceratio copy];
    copy.price = [self.price copy];
    copy.province = [self.province copy];
    copy.realpay = [self.realpay copy];
    copy.realpayratio = [self.realpayratio copy];
    copy.refundmoney = [self.refundmoney copy];
    copy.refundmoneyratio = [self.refundmoneyratio copy];
    copy.registtime = [self.registtime copy];
    copy.remark = [self.remark copy];
    copy.seatnum = [self.seatnum copy];
    copy.vehiclestruct = [self.vehiclestruct copy];
    copy.vehicletype = [self.vehicletype copy];
    
    return copy;
}
@end
