//
//	Work.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Work.h"

NSString *const kWorkCompanyaddress = @"companyaddress";
NSString *const kWorkCompanyname = @"companyname";
NSString *const kWorkCompanyphone = @"companyphone";
NSString *const kWorkIndustry = @"industry";
NSString *const kWorkMonthincome = @"monthincome";
NSString *const kWorkOperatingperiod = @"operatingperiod";
NSString *const kWorkPosition = @"position";
NSString *const kWorkShare = @"share";
NSString *const kWorkVocation = @"vocation";
NSString *const kWorkWorkage = @"workage";

@interface Work ()
@end
@implementation Work




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWorkCompanyaddress] isKindOfClass:[NSNull class]]){
		self.companyaddress = dictionary[kWorkCompanyaddress];
	}	
	if(![dictionary[kWorkCompanyname] isKindOfClass:[NSNull class]]){
		self.companyname = dictionary[kWorkCompanyname];
	}	
	if(![dictionary[kWorkCompanyphone] isKindOfClass:[NSNull class]]){
		self.companyphone = dictionary[kWorkCompanyphone];
	}	
	if(![dictionary[kWorkIndustry] isKindOfClass:[NSNull class]]){
		self.industry = dictionary[kWorkIndustry];
	}	
	if(![dictionary[kWorkMonthincome] isKindOfClass:[NSNull class]]){
		self.monthincome = dictionary[kWorkMonthincome];
	}	
	if(![dictionary[kWorkOperatingperiod] isKindOfClass:[NSNull class]]){
		self.operatingperiod = dictionary[kWorkOperatingperiod];
	}	
	if(![dictionary[kWorkPosition] isKindOfClass:[NSNull class]]){
		self.position = dictionary[kWorkPosition];
	}	
	if(![dictionary[kWorkShare] isKindOfClass:[NSNull class]]){
		self.share = dictionary[kWorkShare];
	}	
	if(![dictionary[kWorkVocation] isKindOfClass:[NSNull class]]){
		self.vocation = dictionary[kWorkVocation];
	}	
	if(![dictionary[kWorkWorkage] isKindOfClass:[NSNull class]]){
		self.workage = dictionary[kWorkWorkage];
	}	
		
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.companyaddress != nil){
		dictionary[kWorkCompanyaddress] = self.companyaddress;
	}
	if(self.companyname != nil){
		dictionary[kWorkCompanyname] = self.companyname;
	}
	if(self.companyphone != nil){
		dictionary[kWorkCompanyphone] = self.companyphone;
	}
	if(self.industry != nil){
		dictionary[kWorkIndustry] = self.industry;
	}
	if(self.monthincome != nil){
		dictionary[kWorkMonthincome] = self.monthincome;
	}
	if(self.operatingperiod != nil){
		dictionary[kWorkOperatingperiod] = self.operatingperiod;
	}
	if(self.position != nil){
		dictionary[kWorkPosition] = self.position;
	}
	if(self.share != nil){
		dictionary[kWorkShare] = self.share;
	}
	if(self.vocation != nil){
		dictionary[kWorkVocation] = self.vocation;
	}
	if(self.workage != nil){
		dictionary[kWorkWorkage] = self.workage;
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
	if(self.companyaddress != nil){
		[aCoder encodeObject:self.companyaddress forKey:kWorkCompanyaddress];
	}
	if(self.companyname != nil){
		[aCoder encodeObject:self.companyname forKey:kWorkCompanyname];
	}
	if(self.companyphone != nil){
		[aCoder encodeObject:self.companyphone forKey:kWorkCompanyphone];
	}
	if(self.industry != nil){
		[aCoder encodeObject:self.industry forKey:kWorkIndustry];
	}
	if(self.monthincome != nil){
		[aCoder encodeObject:self.monthincome forKey:kWorkMonthincome];
	}
	if(self.operatingperiod != nil){
		[aCoder encodeObject:self.operatingperiod forKey:kWorkOperatingperiod];
	}
	if(self.position != nil){
		[aCoder encodeObject:self.position forKey:kWorkPosition];
	}
	if(self.share != nil){
		[aCoder encodeObject:self.share forKey:kWorkShare];
	}
	if(self.vocation != nil){
		[aCoder encodeObject:self.vocation forKey:kWorkVocation];
	}
	if(self.workage != nil){
		[aCoder encodeObject:self.workage forKey:kWorkWorkage];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.companyaddress = [aDecoder decodeObjectForKey:kWorkCompanyaddress];
	self.companyname = [aDecoder decodeObjectForKey:kWorkCompanyname];
	self.companyphone = [aDecoder decodeObjectForKey:kWorkCompanyphone];
	self.industry = [aDecoder decodeObjectForKey:kWorkIndustry];
	self.monthincome = [aDecoder decodeObjectForKey:kWorkMonthincome];
	self.operatingperiod = [aDecoder decodeObjectForKey:kWorkOperatingperiod];
	self.position = [aDecoder decodeObjectForKey:kWorkPosition];
	self.share = [aDecoder decodeObjectForKey:kWorkShare];
	self.vocation = [aDecoder decodeObjectForKey:kWorkVocation];
	self.workage = [aDecoder decodeObjectForKey:kWorkWorkage];
	
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Work *copy = [Work new];

	copy.companyaddress = [self.companyaddress copy];
	copy.companyname = [self.companyname copy];
	copy.companyphone = [self.companyphone copy];
	copy.industry = [self.industry copy];
	copy.monthincome = [self.monthincome copy];
	copy.operatingperiod = [self.operatingperiod copy];
	copy.position = [self.position copy];
	copy.share = [self.share copy];
	copy.vocation = [self.vocation copy];
	copy.workage = [self.workage copy];

	return copy;
}
@end
