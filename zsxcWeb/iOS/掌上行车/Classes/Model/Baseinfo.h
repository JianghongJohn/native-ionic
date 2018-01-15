#import <UIKit/UIKit.h>

@interface Baseinfo : NSObject

@property (nonatomic, strong) NSString * creditofficer;
@property (nonatomic, strong) NSString * deler;
@property (nonatomic, strong) NSString * delerid;
@property (nonatomic, strong) NSString * department;
@property (nonatomic, strong) NSString * loanid;
@property (nonatomic, strong) NSString * orderid;
@property (nonatomic, strong) NSString * ordernumber;
@property (nonatomic, strong) NSString * signdeler;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end