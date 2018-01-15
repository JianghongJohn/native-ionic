//
//	Carman.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Carman.h"

NSString *const kCarmanBase = @"base";
NSString *const kCarmanHouse = @"house";
NSString *const kCarmanRemark = @"remark";
NSString *const kCarmanUrgency = @"urgency";
NSString *const kCarmanWork = @"work";

@interface Carman ()
@end
@implementation Carman




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCarmanBase] isKindOfClass:[NSNull class]]){
		self.base = [[Base alloc] initWithDictionary:dictionary[kCarmanBase]];
	}

	if(![dictionary[kCarmanHouse] isKindOfClass:[NSNull class]]){
		self.house = [[House alloc] initWithDictionary:dictionary[kCarmanHouse]];
	}

	if(![dictionary[kCarmanRemark] isKindOfClass:[NSNull class]]){
		self.remark = dictionary[kCarmanRemark];
	}	
	if(dictionary[kCarmanUrgency] != nil && [dictionary[kCarmanUrgency] isKindOfClass:[NSArray class]]){
		NSArray * urgencyDictionaries = dictionary[kCarmanUrgency];
		NSMutableArray * urgencyItems = [NSMutableArray array];
		for(NSDictionary * urgencyDictionary in urgencyDictionaries){
			Urgency * urgencyItem = [[Urgency alloc] initWithDictionary:urgencyDictionary];
			[urgencyItems addObject:urgencyItem];
		}
		self.urgency = urgencyItems;
	}
	if(![dictionary[kCarmanWork] isKindOfClass:[NSNull class]]){
		self.work = [[Work alloc] initWithDictionary:dictionary[kCarmanWork]];
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
		dictionary[kCarmanBase] = [self.base toDictionary];
	}
	if(self.house != nil){
		dictionary[kCarmanHouse] = [self.house toDictionary];
	}
	if(self.remark != nil){
		dictionary[kCarmanRemark] = self.remark;
	}
	if(self.urgency != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Urgency * urgencyElement in self.urgency){
			[dictionaryElements addObject:[urgencyElement toDictionary]];
		}
		dictionary[kCarmanUrgency] = dictionaryElements;
	}
	if(self.work != nil){
		dictionary[kCarmanWork] = [self.work toDictionary];
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
		[aCoder encodeObject:self.base forKey:kCarmanBase];
	}
	if(self.house != nil){
		[aCoder encodeObject:self.house forKey:kCarmanHouse];
	}
	if(self.remark != nil){
		[aCoder encodeObject:self.remark forKey:kCarmanRemark];
	}
	if(self.urgency != nil){
		[aCoder encodeObject:self.urgency forKey:kCarmanUrgency];
	}
	if(self.work != nil){
		[aCoder encodeObject:self.work forKey:kCarmanWork];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.base = [aDecoder decodeObjectForKey:kCarmanBase];
	self.house = [aDecoder decodeObjectForKey:kCarmanHouse];
	self.remark = [aDecoder decodeObjectForKey:kCarmanRemark];
	self.urgency = [aDecoder decodeObjectForKey:kCarmanUrgency];
	self.work = [aDecoder decodeObjectForKey:kCarmanWork];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Carman *copy = [Carman new];

	copy.base = [self.base copy];
	copy.house = [self.house copy];
	copy.remark = [self.remark copy];
	copy.urgency = [self.urgency copy];
	copy.work = [self.work copy];

	return copy;
}
@end