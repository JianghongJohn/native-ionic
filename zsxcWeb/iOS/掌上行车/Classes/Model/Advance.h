#import <UIKit/UIKit.h>

@interface Advance : NSObject

@property (nonatomic, strong) NSString * account;
@property (nonatomic, strong) NSString * agentman;
@property (nonatomic, strong) NSString * agenttime;
@property (nonatomic, strong) NSString * assessfee;
@property (nonatomic, strong) NSString * bank;
@property (nonatomic, strong) NSString * canalsprice;
@property (nonatomic, strong) NSString * chargetype;
@property (nonatomic, strong) NSString * firstinsure;
@property (nonatomic, strong) NSString * from;
@property (nonatomic, strong) NSString * gopledge;
@property (nonatomic, strong) NSString * gpsfee;
@property (nonatomic, strong) NSString * gpsnum;
@property (nonatomic, strong) NSString * homevisit;
@property (nonatomic, strong) NSString * insureway;
@property (nonatomic, strong) NSString * invoiceorg;
@property (nonatomic, strong) NSString * keepprice;
@property (nonatomic, strong) NSString * money;
@property (nonatomic, strong) NSString * mortgagecash;
@property (nonatomic, strong) NSString * mortgagehigh;
@property (nonatomic, strong) NSString * mortgageprice;
@property (nonatomic, strong) NSString * notaryfee;
@property (nonatomic, strong) NSString * paytotal;
@property (nonatomic, strong) NSString * pledgefee;
@property (nonatomic, strong) NSString * puttotal;
@property (nonatomic, strong) NSString * receiptorg;
@property (nonatomic, strong) NSString * sales;
@property (nonatomic, strong) NSString * secondinsure;
@property (nonatomic, strong) NSString * sellfee;
@property (nonatomic, strong) NSString * thirdinsure;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end