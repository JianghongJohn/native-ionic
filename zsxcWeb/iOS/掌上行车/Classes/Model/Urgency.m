//
//	Urgency.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Urgency.h"

NSString *const kUrgencyFixedphone = @"fixedphone";
NSString *const kUrgencyName = @"name";
NSString *const kUrgencyPhone = @"phone";
NSString *const kUrgencyRelationship = @"relationship";

@interface Urgency ()
@end
@implementation Urgency




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUrgencyFixedphone] isKindOfClass:[NSNull class]]){
		self.fixedphone = dictionary[kUrgencyFixedphone];
	}	
	if(![dictionary[kUrgencyName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kUrgencyName];
	}	
	if(![dictionary[kUrgencyPhone] isKindOfClass:[NSNull class]]){
		self.phone = dictionary[kUrgencyPhone];
	}	
	if(![dictionary[kUrgencyRelationship] isKindOfClass:[NSNull class]]){
		self.relationship = dictionary[kUrgencyRelationship];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.fixedphone != nil){
		dictionary[kUrgencyFixedphone] = self.fixedphone;
	}
	if(self.name != nil){
		dictionary[kUrgencyName] = self.name;
	}
	if(self.phone != nil){
		dictionary[kUrgencyPhone] = self.phone;
	}
	if(self.relationship != nil){
		dictionary[kUrgencyRelationship] = self.relationship;
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
	if(self.fixedphone != nil){
		[aCoder encodeObject:self.fixedphone forKey:kUrgencyFixedphone];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kUrgencyName];
	}
	if(self.phone != nil){
		[aCoder encodeObject:self.phone forKey:kUrgencyPhone];
	}
	if(self.relationship != nil){
		[aCoder encodeObject:self.relationship forKey:kUrgencyRelationship];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.fixedphone = [aDecoder decodeObjectForKey:kUrgencyFixedphone];
	self.name = [aDecoder decodeObjectForKey:kUrgencyName];
	self.phone = [aDecoder decodeObjectForKey:kUrgencyPhone];
	self.relationship = [aDecoder decodeObjectForKey:kUrgencyRelationship];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Urgency *copy = [Urgency new];

	copy.fixedphone = [self.fixedphone copy];
	copy.name = [self.name copy];
	copy.phone = [self.phone copy];
	copy.relationship = [self.relationship copy];

	return copy;
}
@end