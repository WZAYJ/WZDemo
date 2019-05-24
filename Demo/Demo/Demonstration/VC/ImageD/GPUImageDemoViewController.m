//
//  GPUImageDemoViewController.m
//  Demo
//
//  Created by apple on 2019/4/20.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "GPUImageDemoViewController.h"
#import <GPUImage/GPUImage.h>
@interface GPUImageDemoViewController ()
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic,strong) GPUImageFilter *filter;
@property (nonatomic, strong) UIButton *doneBtn;

@end

@implementation GPUImageDemoViewController

-(UIImageView *)imageV
{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]init];
    }
    return _imageV;
}

-(UIButton *)doneBtn
{
    if (!_doneBtn) {
        
        _doneBtn = [[UIButton alloc]init];
        [_doneBtn setTitle:@"变变变" forState:UIControlStateNormal];
        [_doneBtn addTarget:self action:@selector(changeAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"图片处理";
    [self.view addSubview:self.imageV];
    
    [self.rightBtn setTitle:@"变变变" forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(changeAct:) forControlEvents:UIControlEventTouchUpInside];

    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(150, 200));
    }];
    UIImage *inputImage =[UIImage imageNamed:@"zzy.png"];
    self.imageV.image = inputImage;
    self.filter = [[GPUImageBulgeDistortionFilter alloc]init];
//GPUImageBulgeDistortionFilter.h
}
-(void)changeAct:(UIButton*)btn
{
    
    UIImage *inputImage =[UIImage imageNamed:@"zzy.png"];
    //设置要渲染的区域
    [self.filter forceProcessingAtSize:inputImage.size];
    [self.filter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    //添加上滤镜
    [stillImageSource addTarget:self.filter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [self.filter imageFromCurrentFramebuffer];
    
    self.imageV.image = newImage;
}

@end
