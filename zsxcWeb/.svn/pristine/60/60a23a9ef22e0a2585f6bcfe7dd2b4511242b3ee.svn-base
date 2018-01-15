//
//	Baseinfo.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Baseinfo.h"

NSString *const kBaseinfoCreditofficer = @"creditofficer";
NSString *const kBaseinfoDeler = @"deler";
NSString *const kBaseinfoDelerid = @"delerid";
NSString *const kBaseinfoDepartment = @"department";
NSString *const kBaseinfoLoanid = @"loanid";
NSString *const kBaseinfoOrderid = @"orderid";
NSString *const kBaseinfoOrdernumber = @"ordernumber";
NSString *const kBaseinfoSigndeler = @"signdeler";

@interface Baseinfo ()
@end
@implementation Baseinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kBaseinfoCreditofficer] isKindOfClass:[NSNull class]]){
		self.creditofficer = dictionary[kBaseinfoCreditofficer];
	}	
	if(![dictionary[kBaseinfoDeler] isKindOfClass:[NSNull class]]){
		self.deler = dictionary[kBaseinfoDeler];
	}	
	if(![dictionary[kBaseinfoDelerid] isKindOfClass:[NSNull class]]){
		self.delerid = dictionary[kBaseinfoDelerid];
	}	
	if(![dictionary[kBaseinfoDepartment] isKindOfClass:[NSNull class]]){
		self.department = dictionary[kBaseinfoDepartment];
	}	
	if(![dictionary[kBaseinfoLoanid] isKindOfClass:[NSNull class]]){
		self.loanid = dictionary[kBaseinfoLoanid];
	}	
	if(![dictionary[kBaseinfoOrderid] isKindOfClass:[NSNull class]]){
		self.orderid = dictionary[kBaseinfoOrderid];
	}	
	if(![dictionary[kBaseinfoOrdernumber] isKindOfClass:[NSNull class]]){
		self.ordernumber = dictionary[kBaseinfoOrdernumber];
	}	
	if(![dictionary[kBaseinfoSigndeler] isKindOfClass:[NSNull class]]){
		self.signdeler = dictionary[kBaseinfoSigndeler];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.creditofficer != nil){
		dictionary[kBaseinfoCreditofficer] = self.creditofficer;
	}
	if(self.deler != nil){
		dictionary[kBaseinfoDeler] = self.deler;
	}
	if(self.delerid != nil){
		dictionary[kBaseinfoDelerid] = self.delerid;
	}
	if(self.department != nil){
		dictionary[kBaseinfoDepartment] = self.department;
	}
	if(self.loanid != nil){
		dictionary[kBaseinfoLoanid] = self.loanid;
	}
	if(self.orderid != nil){
		dictionary[kBaseinfoOrderid] = self.orderid;
	}
	if(self.ordernumber != nil){
		dictionary[kBaseinfoOrdernumber] = self.ordernumber;
	}
	if(self.signdeler != nil){
		dictionary[kBaseinfoSigndeler] = self.signdeler;
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
	if(self.creditofficer != nil){
		[aCoder encodeObject:self.creditofficer forKey:kBaseinfoCreditofficer];
	}
	if(self.deler != nil){
		[aCoder encodeObject:self.deler forKey:kBaseinfoDeler];
	}
	if(self.delerid != nil){
		[aCoder encodeObject:self.delerid forKey:kBaseinfoDelerid];
	}
	if(self.department != nil){
		[aCoder encodeObject:self.department forKey:kBaseinfoDepartment];
	}
	if(self.loanid != nil){
		[aCoder encodeObject:self.loanid forKey:kBaseinfoLoanid];
	}
	if(self.orderid != nil){
		[aCoder encodeObject:self.orderid forKey:kBaseinfoOrderid];
	}
	if(self.ordernumber != nil){
		[aCoder encodeObject:self.ordernumber forKey:kBaseinfoOrdernumber];
	}
	if(self.signdeler != nil){
		[aCoder encodeObject:self.signdeler forKey:kBaseinfoSigndeler];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.creditofficer = [aDecoder decodeObjectForKey:kBaseinfoCreditofficer];
	self.deler = [aDecoder decodeObjectForKey:kBaseinfoDeler];
	self.delerid = [aDecoder decodeObjectForKey:kBaseinfoDelerid];
	self.department = [aDecoder decodeObjectForKey:kBaseinfoDepartment];
	self.loanid = [aDecoder decodeObjectForKey:kBaseinfoLoanid];
	self.orderid = [aDecoder decodeObjectForKey:kBaseinfoOrderid];
	self.ordernumber = [aDecoder decodeObjectForKey:kBaseinfoOrdernumber];
	self.signdeler = [aDecoder decodeObjectForKey:kBaseinfoSigndeler];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Baseinfo *copy = [Baseinfo new];

	copy.creditofficer = [self.creditofficer copy];
	copy.deler = [self.deler copy];
	copy.delerid = [self.delerid copy];
	copy.department = [self.department copy];
	copy.loanid = [self.loanid copy];
	copy.orderid = [self.orderid copy];
	copy.ordernumber = [self.ordernumber copy];
	copy.signdeler = [self.signdeler copy];

	return copy;
}
@end