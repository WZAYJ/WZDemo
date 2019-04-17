//
//  MoreImageUpDateViewController.m
//  Demo
//
//  Created by apple on 2019/4/12.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "MoreImageUpDateViewController.h"
#import "HXPhotoPicker.h"

@interface MoreImageUpDateViewController ()<HXPhotoViewDelegate>
@property (nonatomic,strong) HXPhotoManager *manager;

@property (nonatomic,strong) HXPhotoView *photoV;
@property (nonatomic,strong) NSMutableArray *imagArr;

@end

@implementation MoreImageUpDateViewController
// 懒加载 照片管理类
- (HXPhotoManager *)manager {
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _manager.configuration.photoMaxNum =9;
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    HXPhotoView *photoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(20 , 100, kScreenWidth-40, 80) manager:self.manager];
    photoView.delegate = self;
    photoView.spacing = 30;
    photoView.outerCamera = YES;
    photoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:photoView];
    
    
//给控件赋值
//    NSArray*urlArr = [];
//    NSMutableArray*arrM = [NSMutableArray array];
//    for (NSString*url in urlArr) {
//        [arrM addObject:url];
//    }
//    [self.manager addNetworkingImageToAlbum:arrM selected:YES];
//    [self.photoV refreshView];
//    self.photoV.showAddCell =NO;
//    self.photoV.hideDeleteButton = YES;
//    [self.photoV.collectionView reloadData];
}

// 代理返回 选择、移动顺序、删除之后的图片以及视频
- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal
{
    NSMutableArray*arrM = [NSMutableArray array];
    for (HXPhotoModel *model in allList) {
        [arrM addObject:model.thumbPhoto];
    }
    self.imagArr = arrM;
    
}

// 当view更新高度时调用
- (void)photoView:(HXPhotoView *)photoView updateFrame:(CGRect)frame
{
//    _photoViewHeight.constant = frame.size.height;
}


// 删除网络图片的地址
- (void)photoView:(HXPhotoView *)photoView deleteNetworkPhoto:(NSString *)networkPhotoUrl
{
    
}



@end
