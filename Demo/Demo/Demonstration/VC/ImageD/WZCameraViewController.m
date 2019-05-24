//
//  WZCameraViewController.m
//  Demo
//
//  Created by apple on 2019/4/20.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "WZCameraViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface WZCameraViewController ()
@property (nonatomic, strong) UIImageView *imageV;

@end

@implementation WZCameraViewController
/*
 1. 获取相机权限(AVCaptureDevice)
 2. 获取需要控制的设备分辨率、相机镜头等(AVCaptureDevice)
 3. 初始化输入（AVCaptureDeviceInput）
 4. 初始化并设置核心控制类 （AVCaptureSession）
 5. 设置输出 （AVCaptureVideoDataOutput）
 6. 设置相机视频流预览 (AVCaptureVideoPreviewLayer)
 */

-(UIImageView *)imageV
{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]init];
    }
    return _imageV;
}
//   脸部识别
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"图片处理";
    [self.view addSubview:self.imageV];
    
    [self.rightBtn setTitle:@"变变变" forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(changeAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(420, 512));
    }];
    self.imageV.image = [UIImage imageNamed:@"zzy"];

}

-(void)changeAct:(UIButton*)btn
{
    CIContext*context = [CIContext contextWithOptions:nil];
    
    UIImage*imageInput = [UIImage imageNamed:@"zzy"];
    float factor = self.imageV.bounds.size.width/imageInput.size.width;

    CIImage*image = [CIImage imageWithCGImage:self.imageV.image.CGImage];
    image = [image imageByApplyingTransform:CGAffineTransformMakeScale(factor, factor)];

    NSDictionary* param = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    
    //声明一个CIDetector，并设定识别类型
    
    CIDetector* faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace
                                                  context:context
                                                  options:param];
    //取得识别结果
    NSArray* detectResult = [faceDetector featuresInImage:image];
    UIView* resultView = [[UIView alloc]initWithFrame:self.imageV.frame];
    [self.view addSubview:resultView];
    for(CIFaceFeature* faceFeature in detectResult) {
        CGFloat faceWidth = faceFeature.bounds.size.width;
        // 标出脸部
        UIView* faceView = [[UIView alloc] initWithFrame:faceFeature.bounds];
        faceView.frame = CGRectMake(faceView.frame.origin.x, self.imageV.bounds.size.height-faceView.frame.origin.y - faceView.bounds.size.height, faceView.frame.size.width, faceView.frame.size.height);
        faceView.layer.borderWidth = 1;
        faceView.layer.borderColor = [[UIColor redColor] CGColor];
        [resultView addSubview:faceView];

//        //脸部
//        UIView* faceView = [[UIView alloc]initWithFrame:faceFeature.bounds];
//
//        faceView.layer.borderWidth=1;
//        faceView.layer.borderColor= [UIColor orangeColor].CGColor;
//        [resultView addSubview:faceView];
        //左眼
        if(faceFeature.hasLeftEyePosition) {
            
            UIView* leftEyeView = [[UIView alloc] initWithFrame:
                                   CGRectMake(faceFeature.leftEyePosition.x-faceWidth*0.15,
                                              self.imageV.bounds.size.height-(faceFeature.leftEyePosition.y-faceWidth*0.15)-faceWidth*0.3, faceWidth*0.3, faceWidth*0.3)];
            [leftEyeView setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
            //            [leftEyeView setCenter:faceFeature.leftEyePosition];
            leftEyeView.layer.cornerRadius = faceWidth*0.15;
            [resultView  addSubview:leftEyeView];
      
            
        }
        //右眼
        if(faceFeature.hasRightEyePosition) {
            UIView* leftEye = [[UIView alloc] initWithFrame:
                               CGRectMake(faceFeature.rightEyePosition.x-faceWidth*0.15,
                                          self.imageV.bounds.size.height-(faceFeature.rightEyePosition.y-faceWidth*0.15)-faceWidth*0.3, faceWidth*0.3, faceWidth*0.3)];
            [leftEye setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
            leftEye.layer.cornerRadius = faceWidth*0.15;
            [resultView  addSubview:leftEye];
          
        }
        //嘴巴
        if(faceFeature.hasMouthPosition) {
            UIView* mouth = [[UIView alloc] initWithFrame:
                             CGRectMake(faceFeature.mouthPosition.x-faceWidth*0.2,
                                        self.imageV.bounds.size.height-(faceFeature.mouthPosition.y-faceWidth*0.2)-faceWidth*0.4, faceWidth*0.4, faceWidth*0.4)];
            [mouth setBackgroundColor:[[UIColor greenColor] colorWithAlphaComponent:0.3]];
            
            mouth.layer.cornerRadius = faceWidth*0.2;
            [resultView  addSubview:mouth];
        }
        
//        [resultView setTransform:CGAffineTransformMakeScale(1, -1)];
        

    }
}


@end
