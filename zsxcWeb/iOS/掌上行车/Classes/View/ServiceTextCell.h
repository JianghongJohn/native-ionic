//
//  ServiceTextCell.h
//  掌上行车
//
//  Created by hyjt on 2017/8/10.
//
//

#import <UIKit/UIKit.h>
typedef void (^RefreshBlock) (NSString *key,NSString *value);
@interface ServiceTextCell : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UITextField *textInput;
@property(nonatomic,copy)NSString *key;
@property(nonatomic,strong)RefreshBlock refreshBlock;
@end
