//
//	CarOrderListModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CarOrderListModel.h"

NSString *const kCarOrderListModelCustomidnumber = @"customidnumber";
NSString *const kCarOrderListModelCustomname = @"customname";
NSString *const kCarOrderListModelOrderaddtime = @"orderaddtime";
NSString *const kCarOrderListModelOrderid = @"orderid";
NSString *const kCarOrderListModelOrdernumber = @"ordernumber";
NSString *const kCarOrderListModelOrderstatus = @"orderstatus";

@interface CarOrderListModel ()
@end
@implementation CarOrderListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCarOrderListModelCustomidnumber] isKindOfClass:[NSNull class]]){
		self.customidnumber = dictionary[kCarOrderListModelCustomidnumber];
	}	
	if(![dictionary[kCarOrderListModelCustomname] isKindOfClass:[NSNull class]]){
		self.customname = dictionary[kCarOrderListModelCustomname];
	}	
	if(![dictionary[kCarOrderListModelOrderaddtime] isKindOfClass:[NSNull class]]){
		self.orderaddtime = dictionary[kCarOrderListModelOrderaddtime];
	}	
	if(![dictionary[kCarOrderListModelOrderid] isKindOfClass:[NSNull class]]){
		self.orderid = dictionary[kCarOrderListModelOrderid];
	}	
	if(![dictionary[kCarOrderListModelOrdernumber] isKindOfClass:[NSNull class]]){
		self.ordernumber = dictionary[kCarOrderListModelOrdernumber];
	}	
	if(![dictionary[kCarOrderListModelOrderstatus] isKindOfClass:[NSNull class]]){
		self.orderstatus = dictionary[kCarOrderListModelOrderstatus];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.customidnumber != nil){
		dictionary[kCarOrderListModelCustomidnumber] = self.customidnumber;
	}
	if(self.customname != nil){
		dictionary[kCarOrderListModelCustomname] = self.customname;
	}
	if(self.orderaddtime != nil){
		dictionary[kCarOrderListModelOrderaddtime] = self.orderaddtime;
	}
	if(self.orderid != nil){
		dictionary[kCarOrderListModelOrderid] = self.orderid;
	}
	if(self.ordernumber != nil){
		dictionary[kCarOrderListModelOrdernumber] = self.ordernumber;
	}
	if(self.orderstatus != nil){
		dictionary[kCarOrderListModelOrderstatus] = self.orderstatus;
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
	if(self.customidnumber != nil){
		[aCoder encodeObject:self.customidnumber forKey:kCarOrderListModelCustomidnumber];
	}
	if(self.customname != nil){
		[aCoder encodeObject:self.customname forKey:kCarOrderListModelCustomname];
	}
	if(self.orderaddtime != nil){
		[aCoder encodeObject:self.orderaddtime forKey:kCarOrderListModelOrderaddtime];
	}
	if(self.orderid != nil){
		[aCoder encodeObject:self.orderid forKey:kCarOrderListModelOrderid];
	}
	if(self.ordernumber != nil){
		[aCoder encodeObject:self.ordernumber forKey:kCarOrderListModelOrdernumber];
	}
	if(self.orderstatus != nil){
		[aCoder encodeObject:self.orderstatus forKey:kCarOrderListModelOrderstatus];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.customidnumber = [aDecoder decodeObjectForKey:kCarOrderListModelCustomidnumber];
	self.customname = [aDecoder decodeObjectForKey:kCarOrderListModelCustomname];
	self.orderaddtime = [aDecoder decodeObjectForKey:kCarOrderListModelOrderaddtime];
	self.orderid = [aDecoder decodeObjectForKey:kCarOrderListModelOrderid];
	self.ordernumber = [aDecoder decodeObjectForKey:kCarOrderListModelOrdernumber];
	self.orderstatus = [aDecoder decodeObjectForKey:kCarOrderListModelOrderstatus];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CarOrderListModel *copy = [CarOrderListModel new];

	copy.customidnumber = [self.customidnumber copy];
	copy.customname = [self.customname copy];
	copy.orderaddtime = [self.orderaddtime copy];
	copy.orderid = [self.orderid copy];
	copy.ordernumber = [self.ordernumber copy];
	copy.orderstatus = [self.orderstatus copy];

	return copy;
}
@end