//
//	Assure.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Assure.h"

NSString *const kAssureBase = @"base";
NSString *const kAssureHouse = @"house";
NSString *const kAssureRemark = @"remark";
NSString *const kAssureWork = @"work";

@interface Assure ()
@end
@implementation Assure




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAssureBase] isKindOfClass:[NSNull class]]){
		self.base = [[Base alloc] initWithDictionary:dictionary[kAssureBase]];
	}

	if(![dictionary[kAssureHouse] isKindOfClass:[NSNull class]]){
		self.house = [[House alloc] initWithDictionary:dictionary[kAssureHouse]];
	}

	if(![dictionary[kAssureRemark] isKindOfClass:[NSNull class]]){
		self.remark = dictionary[kAssureRemark];
	}	
	if(![dictionary[kAssureWork] isKindOfClass:[NSNull class]]){
		self.work = [[Work alloc] initWithDictionary:dictionary[kAssureWork]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.base != nil){
		dictionary[kAssureBase] = [self.base toDictionary];
	}
	if(self.house != nil){
		dictionary[kAssureHouse] = [self.house toDictionary];
	}
	if(self.remark != nil){
		dictionary[kAssureRemark] = self.remark;
	}
	if(self.work != nil){
		dictionary[kAssureWork] = [self.work toDictionary];
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
	if(self.base != nil){
		[aCoder encodeObject:self.base forKey:kAssureBase];
	}
	if(self.house != nil){
		[aCoder encodeObject:self.house forKey:kAssureHouse];
	}
	if(self.remark != nil){
		[aCoder encodeObject:self.remark forKey:kAssureRemark];
	}
	if(self.work != nil){
		[aCoder encodeObject:self.work forKey:kAssureWork];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.base = [aDecoder decodeObjectForKey:kAssureBase];
	self.house = [aDecoder decodeObjectForKey:kAssureHouse];
	self.remark = [aDecoder decodeObjectForKey:kAssureRemark];
	self.work = [aDecoder decodeObjectForKey:kAssureWork];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Assure *copy = [Assure new];

	copy.base = [self.base copy];
	copy.house = [self.house copy];
	copy.remark = [self.remark copy];
	copy.work = [self.work copy];

	return copy;
}
@end