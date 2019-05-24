//
//  AssemblySubview2.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview2.h"
#import "AssembleSetup2ViewController.h"
@interface AssemblySubview2()<MAMapViewDelegate>
@property (nonatomic, strong) MAMapView *mapView;
@end
@implementation AssemblySubview2
-(void)createSubView
{
    _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 100)];
    _mapView.zoomLevel = 14;
    _mapView.delegate = self;
    _mapView.userInteractionEnabled = NO;
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 12);

    [self addSubview:_mapView];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.height.mas_equalTo(200);
        make.bottom.equalTo(self);
    }];

    [self bindData];
   
    
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
//    label.text = self.dataModel.title;
//    [self.mapView addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(imageV.mas_right).offset(15);
//        make.centerY.equalTo(imageV);
//        make.right.equalTo(self.mapView);
//    }];
//
//    if ([self.dataModel.maptitleType isEqualToString:@"1"]) {
//        [imageV setImage:[UIImage imageNamed:@"location_01"]];
//        titleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shadow"]];
//        label.textColor = [UIColor whiteColor];
//    }
//    else
//    {
//        [imageV setImage:[UIImage imageNamed:@"location_02"]];
//        label.textColor = [UIColor blackColor];
//        titleView.backgroundColor = [UIColor whiteColor];
//    }
}

-(void)bindData
{
    _mapView.centerCoordinate = CLLocationCoordinate2DMake([self.dataModel.latitude doubleValue], [self.dataModel.longitude doubleValue]);
    [_mapView removeAnnotations:_mapView.annotations];
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake([self.dataModel.latitude doubleValue], [self.dataModel.longitude doubleValue]);
    [_mapView addAnnotation:pointAnnotation];
}


-(void)setupData
{
    AssembleSetup2ViewController*vc = [[AssembleSetup2ViewController alloc]init];
    vc.dataModel = self.dataModel;

    [vc setReturnRuestData:^(BaseUIDataModel * _Nonnull model) {
        self.dataModel = model;
        [self bindData];
    }];
    [self.viewController.navigationController pushViewController:vc animated:NO];
}


#pragma mark — MapDelegate

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.image = [UIImage imageNamed:@"pin"];

        return annotationView;
    }
    return nil;
}


@end
