#import <UIKit/UIKit.h>

@interface Work : NSObject

@property (nonatomic, strong) NSString * companyaddress;
@property (nonatomic, strong) NSString * companyname;
@property (nonatomic, strong) NSString * companyphone;
@property (nonatomic, strong) NSString * industry;
@property (nonatomic, strong) NSString * monthincome;
@property (nonatomic, strong) NSString * operatingperiod;
@property (nonatomic, strong) NSString * position;
@property (nonatomic, strong) NSString * share;
@property (nonatomic, strong) NSString * vocation;
@property (nonatomic, strong) NSString * workage;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end