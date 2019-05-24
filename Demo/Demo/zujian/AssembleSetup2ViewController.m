//
//  AssembleSetup2ViewController.m
//  Demo
//
//  Created by apple on 2019/5/17.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssembleSetup2ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface AssembleSetup2ViewController ()<MAMapViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) MAMapView *mapview;
@property (nonatomic, strong) CLGeocoder *geoC;

@property (nonatomic, strong) UITextField *searchT;
@property (nonatomic, copy) NSString* address;
@end

@implementation AssembleSetup2ViewController
-(UITextField *)searchT
{
    if (!_searchT) {
        _searchT = [[UITextField alloc]initWithFrame:CGRectMake(20, 74, kScreenWidth-40, 44)];
        _searchT.delegate = self;
        _searchT.backgroundColor = [UIColor whiteColor];
        _searchT.placeholder = @"请输入地址";
        _searchT.leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 44)];
        _searchT.layer.cornerRadius = 8;
        _searchT.clipsToBounds = YES;
        _searchT.leftViewMode = UITextFieldViewModeAlways;
        _searchT.layer.zPosition = 10;
        _searchT.returnKeyType = UIReturnKeyDone;
    }
    return _searchT;
}
/** 地理编码管理器 */
- (CLGeocoder *)geoC
{
    if (!_geoC) {
        _geoC = [[CLGeocoder alloc] init];
    }
    return _geoC;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"编辑地址";
    [self createMap];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.searchT resignFirstResponder];
}
-(void)createMap
{
    _mapview = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 100)];
    _mapview.zoomLevel = 14;
    _mapview.delegate = self;
//    _mapview.userInteractionEnabled = NO;
    _mapview.scaleOrigin= CGPointMake(_mapview.scaleOrigin.x, 12);
    [self.view addSubview:_mapview];
    [_mapview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);

    }];

    [self.view addSubview:self.searchT];
    [self.view bringSubviewToFront:self.searchT];
    
    _mapview.centerCoordinate = CLLocationCoordinate2DMake([self.dataModel.latitude doubleValue], [self.dataModel.longitude doubleValue]);
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake([self.dataModel.latitude doubleValue], [self.dataModel.longitude doubleValue]);
    [_mapview addAnnotation:pointAnnotation];
    self.searchT.text = self.dataModel.address;
    

    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];//取消第一响应者
    
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length>0) {
        
        self.address = textField.text;
        [self geoCode];
    }
}

// 地理编码(地址关键字 ->经纬度 )
- (void)geoCode {
    
    NSString *address = self.address;
    // 容错处理
    if([address length] == 0)
    {
        return;
    }

    // 根据地址关键字, 进行地理编码
    [self.geoC geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {

        /**
         *  CLPlacemark : 地标对象
         *  location : 对应的位置对象
         *  name : 地址全称
         *  locality : 城市
         *  按相关性进行排序
         */
        CLPlacemark *pl = [placemarks firstObject];

        if(error == nil)
        {
            NSLog(@"%f----%f", pl.location.coordinate.latitude, pl.location.coordinate.longitude);
            NSLog(@"%@", pl.name);
            self.mapview.centerCoordinate = pl.location.coordinate;
            NSString*lat = [NSString stringWithFormat:@"%f",pl.location.coordinate.latitude];
            NSString*lon = [NSString stringWithFormat:@"%f",pl.location.coordinate.longitude];
//            self.returnCooder(lon,lat);
            self.dataModel.latitude =lat;
            self.dataModel.longitude = lon;
            MAPointAnnotation *pointAnnotation1 = [[MAPointAnnotation alloc] init];
            pointAnnotation1.coordinate =pl.location.coordinate;
            [self.mapview addAnnotation:pointAnnotation1];
        }
    }];
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.image= [UIImage imageNamed:@"pin"];       //设置气泡可以弹出，默认为NO
        
        return annotationView;
    }
    return nil;
}

-(void)back
{
    if (self.returnRuestData) {
        _returnRuestData(self.dataModel);
    }
    [self.navigationController popViewControllerAnimated:NO];
}

@end
