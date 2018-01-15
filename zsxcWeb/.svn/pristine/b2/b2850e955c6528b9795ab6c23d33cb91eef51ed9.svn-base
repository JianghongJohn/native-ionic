//
//  JHImageViewerController.m
//  JHImageViewerController
//
//  Created by hyjt on 2017/4/10.
//  Copyright © 2017年 haoyungroup. All rights reserved.
//

#import "JHImageViewerController.h"
#import "JHImageViewerWindow.h"
//#import "UINavigationController+Cloudox.h"
@interface JHImageViewerController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collection;
@property(nonatomic,strong)UICollectionViewFlowLayout *flayout;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIView *navView;
@end

@implementation JHImageViewerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //register collectionCell
    [self.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"imageCell"];
    
    [self.view addSubview:self.collection];
    [self.collection setContentOffset:CGPointMake((self.view.bounds.size.width)*_imageIndex, 0)];
    
    [self creatBackAndTitle];
}

/**
 手动创建返回按钮和标题
 */
-(void)creatBackAndTitle{
    [self _setOneTapGesture];
    [self.view addSubview:self.navView];
 
}
-(UIView *)navView{
    if (!_navView) {
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kNavHeight)];
        _navView.backgroundColor = kBaseColor;
        [_navView addSubview:self.backButton];
        [_navView addSubview:self.titleLabel];
    }
    return _navView;
}
/**
 设置单点事件
 */
-(void)_setOneTapGesture{
    UITapGestureRecognizer *_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapAction)];
    [self.view addGestureRecognizer:_tap];
}
/**
 点击事件，关闭视图
 */
-(void)_tapAction{
    [UIView animateWithDuration:0.3 animations:^{
        _navView.top = _navView.top==0?-64:0;
    } completion:^(BOOL finished) {
        
    }];
    
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 50, 44)];
        _titleLabel.textColor = kBaseTextColor;
        _titleLabel.text = [NSString stringWithFormat:@"%i/%i",_imageIndex+1,_imageArray.count];
        _titleLabel.center = CGPointMake(kScreen_Width/2, 20+22);
    }
    return _titleLabel;
}

-(UIButton *)backButton{
    if (!_backButton) {
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 50, 44)];
        [_backButton setImage:[UIImage imageNamed:@"button_back"] forState:0];
        [_backButton setTitle:@"退出" forState:0];
        _backButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_backButton setTitleColor:kBaseTextColor forState:0];
        [_backButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _backButton;
}
-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
/**
 create Collection
 */
-(UICollectionView *)collection{
    if (!_collection ) {
        _collection                 = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0,kScreen_Width+10, kScreen_Height) collectionViewLayout:self.flayout];
        _collection.pagingEnabled   = YES;
        _collection.delegate        = self;
        _collection.dataSource      = self;
        _collection.backgroundColor = [UIColor blackColor];
    }
    
    return _collection;
}
-(UICollectionViewFlowLayout *)flayout{
    if (!_flayout) {
        _flayout                         = [[UICollectionViewFlowLayout alloc] init];
        _flayout.itemSize                = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
        _flayout.sectionInset            = UIEdgeInsetsMake(0, 0, 0, 10);
        _flayout.minimumInteritemSpacing = 0;
        _flayout.minimumLineSpacing      = 10;
        _flayout.scrollDirection         = UICollectionViewScrollDirectionHorizontal;
        
    }
    return _flayout;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return _imageArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    if ([_imageArray[indexPath.row] isKindOfClass:[NSString class]]) {
        //addImageView
        JHImageViewerWindow *imageView = [[JHImageViewerWindow alloc] initWithFrame:imageCell.contentView.bounds WithImageUrl:_imageArray[indexPath.row]];
        [imageCell.contentView addSubview:imageView];
    }else{
        //addImageView
        JHImageViewerWindow *imageView = [[JHImageViewerWindow alloc] initWithFrame:imageCell.contentView.bounds WithImage:_imageArray[indexPath.row]];
        [imageCell.contentView addSubview:imageView];
    }
    return imageCell;
}
#pragma -mark collectionWillShow setTitleAndIndex
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
//监听滚动，用于改变title
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = (NSInteger )scrollView.contentOffset.x/self.view.bounds.size.width;
    self.titleLabel.text = [NSString stringWithFormat:@"%d/%d",page+1,_imageArray.count];
}
@end
