//
//	CarOrderDetailModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CarOrderDetailModel.h"

NSString *const kCarOrderDetailModelAdvance = @"advance";
NSString *const kCarOrderDetailModelAssure = @"assure";
NSString *const kCarOrderDetailModelBaseinfo = @"baseinfo";
NSString *const kCarOrderDetailModelCar = @"car";
NSString *const kCarOrderDetailModelCarman = @"carman";
NSString *const kCarOrderDetailModelMate = @"mate";

@interface CarOrderDetailModel ()
@end
@implementation CarOrderDetailModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCarOrderDetailModelAdvance] isKindOfClass:[NSNull class]]){
		self.advance = [[Advance alloc] initWithDictionary:dictionary[kCarOrderDetailModelAdvance]];
	}

	if(dictionary[kCarOrderDetailModelAssure] != nil && [dictionary[kCarOrderDetailModelAssure] isKindOfClass:[NSArray class]]){
		NSArray * assureDictionaries = dictionary[kCarOrderDetailModelAssure];
		NSMutableArray * assureItems = [NSMutableArray array];
		for(NSDictionary * assureDictionary in assureDictionaries){
			Assure * assureItem = [[Assure alloc] initWithDictionary:assureDictionary];
			[assureItems addObject:assureItem];
		}
		self.assure = assureItems;
	}
	if(![dictionary[kCarOrderDetailModelBaseinfo] isKindOfClass:[NSNull class]]){
		self.baseinfo = [[Baseinfo alloc] initWithDictionary:dictionary[kCarOrderDetailModelBaseinfo]];
	}

	if(![dictionary[kCarOrderDetailModelCar] isKindOfClass:[NSNull class]]){
		self.car = [[Car alloc] initWithDictionary:dictionary[kCarOrderDetailModelCar]];
	}

	if(![dictionary[kCarOrderDetailModelCarman] isKindOfClass:[NSNull class]]){
		self.carman = [[Carman alloc] initWithDictionary:dictionary[kCarOrderDetailModelCarman]];
	}

	if(![dictionary[kCarOrderDetailModelMate] isKindOfClass:[NSNull class]]){
		self.mate = [[Mate alloc] initWithDictionary:dictionary[kCarOrderDetailModelMate]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.advance != nil){
		dictionary[kCarOrderDetailModelAdvance] = [self.advance toDictionary];
	}
	if(self.assure != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Assure * assureElement in self.assure){
			[dictionaryElements addObject:[assureElement toDictionary]];
		}
		dictionary[kCarOrderDetailModelAssure] = dictionaryElements;
	}
	if(self.baseinfo != nil){
		dictionary[kCarOrderDetailModelBaseinfo] = [self.baseinfo toDictionary];
	}
	if(self.car != nil){
		dictionary[kCarOrderDetailModelCar] = [self.car toDictionary];
	}
	if(self.carman != nil){
		dictionary[kCarOrderDetailModelCarman] = [self.carman toDictionary];
	}
	if(self.mate != nil){
		dictionary[kCarOrderDetailModelMate] = [self.mate toDictionary];
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
	if(self.advance != nil){
		[aCoder encodeObject:self.advance forKey:kCarOrderDetailModelAdvance];
	}
	if(self.assure != nil){
		[aCoder encodeObject:self.assure forKey:kCarOrderDetailModelAssure];
	}
	if(self.baseinfo != nil){
		[aCoder encodeObject:self.baseinfo forKey:kCarOrderDetailModelBaseinfo];
	}
	if(self.car != nil){
		[aCoder encodeObject:self.car forKey:kCarOrderDetailModelCar];
	}
	if(self.carman != nil){
		[aCoder encodeObject:self.carman forKey:kCarOrderDetailModelCarman];
	}
	if(self.mate != nil){
		[aCoder encodeObject:self.mate forKey:kCarOrderDetailModelMate];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.advance = [aDecoder decodeObjectForKey:kCarOrderDetailModelAdvance];
	self.assure = [aDecoder decodeObjectForKey:kCarOrderDetailModelAssure];
	self.baseinfo = [aDecoder decodeObjectForKey:kCarOrderDetailModelBaseinfo];
	self.car = [aDecoder decodeObjectForKey:kCarOrderDetailModelCar];
	self.carman = [aDecoder decodeObjectForKey:kCarOrderDetailModelCarman];
	self.mate = [aDecoder decodeObjectForKey:kCarOrderDetailModelMate];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CarOrderDetailModel *copy = [CarOrderDetailModel new];

	copy.advance = [self.advance copy];
	copy.assure = [self.assure copy];
	copy.baseinfo = [self.baseinfo copy];
	copy.car = [self.car copy];
	copy.carman = [self.carman copy];
	copy.mate = [self.mate copy];

	return copy;
}
@end