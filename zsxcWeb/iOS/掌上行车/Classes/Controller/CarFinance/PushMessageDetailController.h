//
//  PushMessageDetailController.h
//  掌上行车
//
//  Created by hyjt on 2017/7/21.
//
//

#import "Root_BaseController.h"

@interface PushMessageDetailController : Root_BaseController
@property(nonatomic,strong)NSDictionary *mes_data;
@property(nonatomic,assign)BOOL isPush;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labAddTime;
@property (weak, nonatomic) IBOutlet UILabel *labContent;
@property (weak, nonatomic) IBOutlet UIView *viewHeader;

@end
