#import <UIKit/UIKit.h>
#import "Base.h"
#import "House.h"
#import "Urgency.h"
#import "Work.h"

@interface Carman : NSObject

@property (nonatomic, strong) Base * base;
@property (nonatomic, strong) House * house;
@property (nonatomic, strong) NSString * remark;
@property (nonatomic, strong) NSArray * urgency;
@property (nonatomic, strong) Work * work;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end