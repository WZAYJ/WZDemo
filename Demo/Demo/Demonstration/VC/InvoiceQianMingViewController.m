//
//  InvoiceQianMingViewController.m
//  HZ_Haiergc
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "InvoiceQianMingViewController.h"
#import "CustomBorad.h"

@interface InvoiceQianMingViewController ()
@property (nonatomic ,strong) CustomBorad *drawBorad;

@end

@implementation InvoiceQianMingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.drawBorad];
    UIButton*button = [[UIButton alloc]init];
    button.bottom = self.view.height;
    [button addTarget:self  action:@selector(clearAct) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"清 除" forState:UIControlStateNormal];
    [self .view addSubview:button];
    UIButton*button2 = [[UIButton alloc]init];

    button2.centerY = button.centerY;

    [button2 addTarget:self  action:@selector(saveAct) forControlEvents:UIControlEventTouchUpInside];

    button2.backgroundColor = [UIColor blueColor];

    [button2 setTitle:@"确 定" forState:UIControlStateNormal];

    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self .view addSubview:button2];
    [self.drawBorad mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(button.mas_top).offset(-10);
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.5);
        make.height.mas_equalTo(49);
        make.top.equalTo(self.drawBorad.mas_bottom).offset(10);
    }];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
        make.right.equalTo(self.view);
        make.size.equalTo(button);
    }];
    [self setNav];
}
-(void)setNav
{
    self.title = @"签名";
}
- (CustomBorad *)drawBorad
{
    if (!_drawBorad) {

        _drawBorad = [[CustomBorad alloc] initWithFrame:CGRectMake(20, 84, self.view.width-40,kScreenHeight-84-50)];
        _drawBorad.backgroundColor = [UIColor lightGrayColor];

        _drawBorad.image = [UIImage imageNamed:@"qianming_bg"];
    }

    return _drawBorad;
}

-(void)clearAct
{
 [self.drawBorad clearAction];

}

-(void)saveAct{
    UIImage *image = [self.drawBorad getImageFromView];
    _returnImage(image);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
