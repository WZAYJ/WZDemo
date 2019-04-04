//
//  WZAddressMapView.m
//  Demo
//
//  Created by apple on 2019/4/3.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "WZAddressMapView.h"
//@interface WZAddressMapView()<MAMapViewDelegate>
//@property (nonatomic, strong) MAMapView *mapView;
//@property (nonatomic, strong) BaseUIDataModel *dataModel;
//@property (nonatomic, copy) NSString* title;
//@property (nonatomic, copy) NSString* type;
//
//@end
@implementation WZAddressMapView

//-(instancetype)initwithDataUIModel:(BaseUIModel*)uiModel
//{
//    if ([super init]) {
//        _dataModel = uiModel.dataModel;
//        _title = _dataModel.title;
//        self.backgroundColor = [UIColor whiteColor];
//        [self createView];
//
//    }
//    return self;
//}
//
//-(void)createView
//{
//    _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 100)];
//    _mapView.centerCoordinate = CLLocationCoordinate2DMake([_dataModel.latitude doubleValue], [_dataModel.longitude doubleValue]);
//    _mapView.zoomLevel = 14;
//    _mapView.delegate = self;
//    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 12);
//    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
//    pointAnnotation.coordinate = CLLocationCoordinate2DMake([_dataModel.latitude doubleValue], [_dataModel.longitude doubleValue]);
//    [_mapView addAnnotation:pointAnnotation];
//
//    [self addSubview:_mapView];
//
//    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//        make.height.mas_equalTo(200);
//    }];
//
//    UIView*titleView = [[UIView alloc]init];
//    titleView.backgroundColor = [UIColor whiteColor];
//    [_mapView addSubview:titleView];
//    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.mapView);
//        make.height.mas_equalTo(40);
//    }];
//
//    UIImageView*imageV = [[UIImageView alloc]init];
//    imageV.image = [UIImage imageNamed:@"location_02"];
//    [_mapView addSubview:imageV];
//    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(16, 16));
//        make.top.equalTo(self.mapView).offset(10);
//        make.left.equalTo(self.mapView).offset(15);
//    }];
//
//    UILabel*label = [[UILabel alloc]init];
//    label.font = [UIFont systemFontOfSize:13];
//    label.text = _title;
//    [self.mapView addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(imageV.mas_right).offset(15);
//        make.centerY.equalTo(imageV);
//        make.right.equalTo(self.mapView);
//    }];
//
//    if ([_dataModel.maptitleType isEqualToString:@"1"]) {
//        [imageV setImage:[UIImage imageNamed:@"location_01"]];
////        titleView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
//
//        titleView.backgroundColor = [UIColor clearColor];
//
////
//
////        [titleView.layer addSublayer:layer];
//        label.textColor = [UIColor whiteColor];
//
//
//        CAGradientLayer *layer = [CAGradientLayer new];
//        //colors存放渐变的颜色的数组
//        layer.colors=@[(__bridge id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6].CGColor,(__bridge id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0].CGColor];
//        /**
//         * 起点和终点表示的坐标系位置，(0,0)表示左上角，(1,1)表示右下角
//         */
//        layer.startPoint = CGPointMake(1, 0);
//        layer.endPoint = CGPointMake(1, 1);
//       layer.frame = CGRectMake(0, 0, kScreenWidth, 40);
//        [self.layer addSublayer:layer];
//    }
//    else
//    {
//        [imageV setImage:[UIImage imageNamed:@"location_02"]];
//        label.textColor = [UIColor blackColor];
//        titleView.backgroundColor = [UIColor whiteColor];
//    }
//}
//
//#pragma mark — MapDelegate
//
//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
//        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//        }
//        annotationView.image = [UIImage imageNamed:@"pin"];
////        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
////        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
////        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
////        annotationView.pinColor = MAPinAnnotationColorPurple;
//        return annotationView;
//    }
//    return nil;
//}
@end
