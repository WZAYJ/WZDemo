//
//  BaseViewController.m
//  JiYouYou
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 com.TanSi. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WZColor(255, 255, 255);
    [self creatNavBar];
    
    [self.view addSubview:self.bgView];
    
    [self.view sendSubviewToBack:self.bgView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



- (void)creatNavBar{
    
    _leftBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    _leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_leftBtn setImage:[UIImage imageNamed:@"icon_head_goback_black"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_leftBtn];
    [_leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    _rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(0, 0, 50, 44);
    [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _rightBtn.contentMode = UIViewContentModeScaleAspectFit;
    _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
    UIView *barBack = self.navigationController.navigationBar.subviews[0];
    UIView *line = [barBack valueForKeyPath:@"_shadowView"];
    [line setHidden:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

//     [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:WZColor(254, 36, 3)] forBarMetrics:nil];
    self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@""];

    //标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,nil]];  
    //    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
}
-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;

}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    NSString* url = [NSString stringWithFormat:@"%@%@",BaseUrl,@"getAttenceById"];
//
//    [HttpTools postJsonFromURLString:url andParameters:@{@"token":MyToken} success:^(id json) {
//
//        if ([json[@"code"] isEqualToString:@"00002"]) {
//
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:json[@"message"] preferredStyle:UIAlertControllerStyleAlert];
//            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
//                [self Logout];
//            }]];
//            // 弹出对话框
//            [self presentViewController:alert animated:true completion:nil];
//
//        }
//    } fail:^{
//
//    }];

}

-(void)Logout{
    WZRemoveValue(@"userCode");
    WZRemoveValue(@"token");
    WZRemoveValue(@"userName");
//    UIViewController*login = [[LoginViewController alloc]init];
//    [UIApplication sharedApplication].keyWindow.rootViewController = login;
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    //    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    return UIInterfaceOrientationMaskPortrait;
}




@end
