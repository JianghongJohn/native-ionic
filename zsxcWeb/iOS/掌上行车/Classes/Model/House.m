//
//	House.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "House.h"

NSString *const kHouseAddress = @"address";
NSString *const kHouseArea = @"area";
NSString *const kHouseHousingproperty = @"housingproperty";
NSString *const kHouseLoanage = @"loanage";
NSString *const kHouseLoanmoney = @"loanmoney";
NSString *const kHouseMonthpay = @"monthpay";
NSString *const kHouseOwner = @"owner";
NSString *const kHousePrice = @"price";
NSString *const kHouseRelationship = @"relationship";

@interface House ()
@end
@implementation House




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kHouseAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kHouseAddress];
	}	
	if(![dictionary[kHouseArea] isKindOfClass:[NSNull class]]){
		self.area = dictionary[kHouseArea];
	}	
	if(![dictionary[kHouseHousingproperty] isKindOfClass:[NSNull class]]){
		self.housingproperty = dictionary[kHouseHousingproperty];
	}	
	if(![dictionary[kHouseLoanage] isKindOfClass:[NSNull class]]){
		self.loanage = dictionary[kHouseLoanage];
	}	
	if(![dictionary[kHouseLoanmoney] isKindOfClass:[NSNull class]]){
		self.loanmoney = dictionary[kHouseLoanmoney];
	}	
	if(![dictionary[kHouseMonthpay] isKindOfClass:[NSNull class]]){
		self.monthpay = dictionary[kHouseMonthpay];
	}	
	if(![dictionary[kHouseOwner] isKindOfClass:[NSNull class]]){
		self.owner = dictionary[kHouseOwner];
	}	
	if(![dictionary[kHousePrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kHousePrice];
	}	
	if(![dictionary[kHouseRelationship] isKindOfClass:[NSNull class]]){
		self.relationship = dictionary[kHouseRelationship];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.address != nil){
		dictionary[kHouseAddress] = self.address;
	}
	if(self.area != nil){
		dictionary[kHouseArea] = self.area;
	}
	if(self.housingproperty != nil){
		dictionary[kHouseHousingproperty] = self.housingproperty;
	}
	if(self.loanage != nil){
		dictionary[kHouseLoanage] = self.loanage;
	}
	if(self.loanmoney != nil){
		dictionary[kHouseLoanmoney] = self.loanmoney;
	}
	if(self.monthpay != nil){
		dictionary[kHouseMonthpay] = self.monthpay;
	}
	if(self.owner != nil){
		dictionary[kHouseOwner] = self.owner;
	}
	if(self.price != nil){
		dictionary[kHousePrice] = self.price;
	}
	if(self.relationship != nil){
		dictionary[kHouseRelationship] = self.relationship;
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
	if(self.address != nil){
		[aCoder encodeObject:self.address forKey:kHouseAddress];
	}
	if(self.area != nil){
		[aCoder encodeObject:self.area forKey:kHouseArea];
	}
	if(self.housingproperty != nil){
		[aCoder encodeObject:self.housingproperty forKey:kHouseHousingproperty];
	}
	if(self.loanage != nil){
		[aCoder encodeObject:self.loanage forKey:kHouseLoanage];
	}
	if(self.loanmoney != nil){
		[aCoder encodeObject:self.loanmoney forKey:kHouseLoanmoney];
	}
	if(self.monthpay != nil){
		[aCoder encodeObject:self.monthpay forKey:kHouseMonthpay];
	}
	if(self.owner != nil){
		[aCoder encodeObject:self.owner forKey:kHouseOwner];
	}
	if(self.price != nil){
		[aCoder encodeObject:self.price forKey:kHousePrice];
	}
	if(self.relationship != nil){
		[aCoder encodeObject:self.relationship forKey:kHouseRelationship];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kHouseAddress];
	self.area = [aDecoder decodeObjectForKey:kHouseArea];
	self.housingproperty = [aDecoder decodeObjectForKey:kHouseHousingproperty];
	self.loanage = [aDecoder decodeObjectForKey:kHouseLoanage];
	self.loanmoney = [aDecoder decodeObjectForKey:kHouseLoanmoney];
	self.monthpay = [aDecoder decodeObjectForKey:kHouseMonthpay];
	self.owner = [aDecoder decodeObjectForKey:kHouseOwner];
	self.price = [aDecoder decodeObjectForKey:kHousePrice];
	self.relationship = [aDecoder decodeObjectForKey:kHouseRelationship];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	House *copy = [House new];

	copy.address = [self.address copy];
	copy.area = [self.area copy];
	copy.housingproperty = [self.housingproperty copy];
	copy.loanage = [self.loanage copy];
	copy.loanmoney = [self.loanmoney copy];
	copy.monthpay = [self.monthpay copy];
	copy.owner = [self.owner copy];
	copy.price = [self.price copy];
	copy.relationship = [self.relationship copy];

	return copy;
}
@end