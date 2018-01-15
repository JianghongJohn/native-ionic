//
//	Mate.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Mate.h"

NSString *const kMateBase = @"base";
NSString *const kMateRemark = @"remark";
NSString *const kMateWork = @"work";

@interface Mate ()
@end
@implementation Mate




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMateBase] isKindOfClass:[NSNull class]]){
		self.base = [[Base alloc] initWithDictionary:dictionary[kMateBase]];
	}

	if(![dictionary[kMateRemark] isKindOfClass:[NSNull class]]){
		self.remark = dictionary[kMateRemark];
	}	
	if(![dictionary[kMateWork] isKindOfClass:[NSNull class]]){
		self.work = [[Work alloc] initWithDictionary:dictionary[kMateWork]];
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
		dictionary[kMateBase] = [self.base toDictionary];
	}
	if(self.remark != nil){
		dictionary[kMateRemark] = self.remark;
	}
	if(self.work != nil){
		dictionary[kMateWork] = [self.work toDictionary];
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
		[aCoder encodeObject:self.base forKey:kMateBase];
	}
	if(self.remark != nil){
		[aCoder encodeObject:self.remark forKey:kMateRemark];
	}
	if(self.work != nil){
		[aCoder encodeObject:self.work forKey:kMateWork];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.base = [aDecoder decodeObjectForKey:kMateBase];
	self.remark = [aDecoder decodeObjectForKey:kMateRemark];
	self.work = [aDecoder decodeObjectForKey:kMateWork];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Mate *copy = [Mate new];

	copy.base = [self.base copy];
	copy.remark = [self.remark copy];
	copy.work = [self.work copy];

	return copy;
}
@end