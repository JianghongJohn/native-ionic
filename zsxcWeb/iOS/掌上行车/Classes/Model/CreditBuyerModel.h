#import <UIKit/UIKit.h>

@interface CreditBuyerModel : NSObject

@property (nonatomic, strong) NSString * authletterPhotoFilegroup;
@property (nonatomic, strong) NSString * authletterPhotoFilename;
@property (nonatomic, strong) NSString * authletterPhotoFilepath;
@property (nonatomic, strong) NSString * cardno;
@property (nonatomic, strong) NSString * cardnoBackphotoFilegroup;
@property (nonatomic, strong) NSString * cardnoBackphotoFilename;
@property (nonatomic, strong) NSString * cardnoBackphotoFilepath;
@property (nonatomic, strong) NSString * cardnoFrontphotoFilegroup;
@property (nonatomic, strong) NSString * cardnoFrontphotoFilename;
@property (nonatomic, strong) NSString * cardnoFrontphotoFilepath;
@property (nonatomic, strong) NSString * creditRecord;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * sex;
@property (nonatomic, strong) NSString * signaturePhotoFilegroup;
@property (nonatomic, strong) NSString * signaturePhotoFilename;
@property (nonatomic, strong) NSString * signaturePhotoFilepath;
@property (nonatomic, strong) NSString * tel;
@property (nonatomic, strong) NSString * type;
//购车人才有的信息
@property(nonatomic,copy)NSString *loanBank;
@property(nonatomic,copy)NSString *dealer;
//图片信息
@property(nonatomic,strong)UIImage *cardnoFrontphotoFile;
@property(nonatomic,strong)UIImage *cardnoBackphotoFile;
@property(nonatomic,strong)UIImage *authletterPhotoFile;
@property(nonatomic,strong)UIImage *signaturePhotoFile;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
