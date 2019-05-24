//
//  AssemblySubview7.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview7.h"
#import "AssembleSet7ViewController.h"
@interface AssemblySubview7()
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *messageL;
@end
@implementation AssemblySubview7

-(void)createSubView
{
    UILabel*titleL = [Tools createLabelWithTextColor:[UIColor blackColor] Font:[UIFont fontWithName: @"Helvetica-Bold" size :17] TextAlignment:NSTextAlignmentLeft];
    [self addSubview:titleL];
    UIImageView*imageV = [UIImageView new];
    [self addSubview:imageV];
    UILabel*messageL = [Tools createLabelWithTextColor:[UIColor grayColor] Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentLeft];
    messageL.numberOfLines = 0;
    [self addSubview:messageL];
    
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.height.mas_equalTo(20);
    }];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(titleL);
        make.height.mas_equalTo(200);
        make.top.equalTo(titleL.mas_bottom).offset(15);

    }];
    
    [messageL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(titleL);
        make.top.equalTo(imageV.mas_bottom).offset(13);
        make.bottom.equalTo(self).offset(-30);
    }];
    self.titleL = titleL;
    self.imageV =imageV;
    self.messageL = messageL;
    [self bindData];
}

-(void)setupData
{
    AssemblySetupViewController*vc = [[AssemblySetupViewController alloc]init];
    vc.dataModel = self.dataModel;
    vc.assemblyType = @"7";
    vc.titleArr = @[@"图片",@"标题",@"介绍"];
    vc.typeArr =@[@"1",@"2",@"3"];
    [vc setReturnRuestData:^(BaseUIDataModel * _Nonnull model) {
        self.dataModel = model;
        [self bindData];
    }];
    [self.viewController.navigationController pushViewController:vc animated:NO];
}

-(void)bindData
{
   self.titleL.text = self.dataModel.title;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:self.dataModel.imgurl]];
    self.messageL.text = self.dataModel.desc;
}
@end
