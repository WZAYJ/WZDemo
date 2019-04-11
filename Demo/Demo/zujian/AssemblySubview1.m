//
//  AssemblySubView1.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview1.h"
@interface AssemblySubview1()

@end

@implementation AssemblySubview1
-(void)createSubView
{
    self.backgroundColor = [UIColor whiteColor];
    UIImageView*imageV = [UIImageView new];
    [self addSubview:imageV];
    UIView*shdowV = [UIView new];
    shdowV.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self addSubview:shdowV];
    UIView*messageV = [UIView new];
    [self addSubview:messageV];
    
    UILabel*titleL = [Tools createLabelWithTextColor:[UIColor whiteColor] Font:[UIFont fontWithName:@"Helvetica-Bold" size :18] TextAlignment:NSTextAlignmentCenter];
    [shdowV addSubview:titleL];
    
    UILabel*nameL = [Tools createLabelWithTextColor:[UIColor blackColor] Font:[UIFont fontWithName:@"Helvetica-Bold" size :17] TextAlignment:NSTextAlignmentCenter];
    [messageV addSubview:nameL];
    
    UILabel*englishL = [Tools createLabelWithTextColor:[UIColor lightGrayColor] Font:[UIFont  systemFontOfSize:14] TextAlignment:NSTextAlignmentCenter];
    [messageV addSubview:englishL];
    
    UIButton*wxChat = [UIButton new];
    [wxChat setImage:[UIImage imageNamed:@"wechat"] forState:UIControlStateNormal];
    [messageV addSubview:wxChat];
    
    UIButton*web = [UIButton new];
    [web setImage:[UIImage imageNamed:@"web"] forState:UIControlStateNormal];
    [messageV addSubview:web];
    
    UIButton*call = [UIButton new];
    [call setImage:[UIImage imageNamed:@"call"] forState:UIControlStateNormal];
    [messageV addSubview:call];
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(450);
    }];
    [shdowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(imageV);
    }];
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(shdowV);
        make.top.equalTo(shdowV).offset(35);
        make.height.mas_equalTo(20);
    }];
    [messageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.top.equalTo(shdowV.mas_bottom);
        make.height.mas_equalTo(160);
    }];
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(messageV);
        make.top.equalTo(messageV).offset(15);
        make.height.mas_equalTo(20);
    }];
    
    [englishL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(nameL);
        make.top.equalTo(nameL.mas_bottom).offset(5);
    }];
    
    [web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(48, 48));
        make.centerX.equalTo(messageV);
        make.top.equalTo(englishL.mas_bottom).offset(20);
    }];
    
    [wxChat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(web);
        make.centerY.equalTo(web);
        make.right.equalTo(web.mas_left).offset(-25);
    }];
    
    [call mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(web);
        make.centerY.equalTo(web);
        make.left.equalTo(web.mas_right).offset(25);
    }];     
    
    titleL.text = self.dataModel.title;
    nameL.text = self.dataModel.name;
    englishL.text =self.dataModel.englishName;
    [imageV setImageWithURL:[NSURL URLWithString:self.dataModel.imgurl] options:0];
    
}
@end