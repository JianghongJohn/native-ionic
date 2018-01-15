//
//  JH_ImagePickerSheet.m
//  haoqibaoyewu
//
//  Created by hyjt on 2017/3/27.
//  Copyright © 2017年 jianghong. All rights reserved.
//

#import "JH_ImagePickerSheet.h"
#import "JH_RuntimeTool.h"
#import "JH_PrivateHelper.h"
@implementation JH_ImagePickerSheet

/**
 创建imagePicker

 @param vc VC
 @param canEdit 是否可编辑
 */
-(void)_setImagePickerForClass:(UIViewController *)vc canEditing:(BOOL )canEdit{
    

    JHActionSheet *action = [[JHActionSheet alloc] initWithTitle:@"选择照片" cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"拍照",@"从手机相册选择"] handler:^(JHActionSheet *actionSheet, NSInteger index) {
        //相机资源
        UIImagePickerControllerSourceType sourceType;
        
        if (index==1) {//拍照
            //判断是否可用
            sourceType = UIImagePickerControllerSourceTypeCamera;
            
            
        }else if (index==2) {//从手机相册选择
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }else{
            return;
        }
        //调出相册
        UIImagePickerController *picker = [self  creatImagePickerControllerForVC:vc sourceType:sourceType];
        picker.allowsEditing = canEdit;
    }];

    [action show];
    
}
/**
 给某个类创建UIImagePickerController
 
 @param vc vc
 @param sourceType 相册或者相机
 @return UIImagePickerController
 */
-(UIImagePickerController * )creatImagePickerControllerForVC:(UIViewController *)vc sourceType:(UIImagePickerControllerSourceType )sourceType{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera) {//拍照
        
        //摄像头是否可用
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear|UIImagePickerControllerCameraDeviceFront];
        if (!isCamera) {
            kTipAlert(@"该设备不支持拍照");
            return nil;
        }
        if (![JH_PrivateHelper checkCameraAuthorizationStatus]) {
            return nil;
        }
        
    }else if (sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {//从手机相册选择
        if (![JH_PrivateHelper checkPhotoLibraryAuthorizationStatus]) {
            return nil;
        }
    }else{
        return nil;
    }
    
    //调出相册
    picker.sourceType = sourceType;
    //动态添加协议
    [JH_RuntimeTool addProtocolForClass:[vc class]fromClass:[self class]];
    //由于动态添加了协议所以不会报错
    picker.delegate = vc;
    
    [vc.navigationController presentViewController:picker animated:YES completion:nil];
    
    return picker;
}

@end
