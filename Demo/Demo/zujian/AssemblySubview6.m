//
//  AssemblySubview6.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview6.h"
#import "AssemblySetupViewController.h"
@interface AssemblySubview6()
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *messageL;
@end

@implementation AssemblySubview6

-(void)createSubView
{
    UILabel*titleL = [Tools createLabelWithTextColor:[UIColor blackColor] Font:[UIFont fontWithName: @"Helvetica-Bold" size :17] TextAlignment:NSTextAlignmentLeft];
    [self addSubview:titleL];
    
    UILabel*messageL = [Tools createLabelWithTextColor:[UIColor grayColor] Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentLeft];
    messageL.numberOfLines = 0;
    [self addSubview:messageL];
    
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.height.mas_equalTo(20);
    }];
    
    [messageL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(titleL);
        make.top.equalTo(titleL.mas_bottom).offset(15);
        make.bottom.equalTo(self).offset(-30);
    }];
    self.titleL = titleL;
    self.messageL =messageL;
    [self bindData];
   
}
-(void)bindData
{
    self.titleL.text = self.dataModel.title;
    self.messageL.text = self.dataModel.desc;
}
-(void)setupData
{
    AssemblySetupViewController*vc = [[AssemblySetupViewController alloc]init];
    vc.dataModel = self.dataModel;
    vc.assemblyType = @"6";
    vc.titleArr = @[@"标题",@"介绍"];
    vc.typeArr =@[@"2",@"3"];
    [vc setReturnRuestData:^(BaseUIDataModel * _Nonnull model) {
        self.dataModel = model;
        [self bindData];
    }];
    [self.viewController.navigationController pushViewController:vc animated:NO];
}
@end
