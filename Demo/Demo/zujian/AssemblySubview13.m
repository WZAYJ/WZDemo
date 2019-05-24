//
//  AssemblySubview13.m
//  Demo
//
//  Created by apple on 2019/5/17.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview13.h"
#import "WZSelectVIew.h"
#import "AssembleSetup13ViewController.h"
@interface AssemblySubview13()
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *nameL;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *messageL;
@property (nonatomic, strong) WZSelectVIew *selectView;
@property (nonatomic, assign) NSInteger index;
@end
@implementation AssemblySubview13
-(void)createSubView
{
    _titleL = [Tools createLabelWithTextColor:[UIColor blackColor] Font:[UIFont fontWithName:@"Helvetica-Bold" size :17] TextAlignment:NSTextAlignmentCenter];
    [self addSubview:_titleL];
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(40);
    }];
    _selectView = [[WZSelectVIew alloc]init];
    _index = 0;
    WeakSelf
    [_selectView setReturnSelectIndex:^(NSInteger index) {
       weakSelf.index = index;
        BaseUIDataModel*currentModel = weakSelf.dataModel.classify[index];
        weakSelf.messageL.text = currentModel.desc;
        weakSelf.nameL.text = currentModel.title;
        [weakSelf.imageV sd_setImageWithURL:[NSURL URLWithString:currentModel.imgurl]];

    }];
    [self addSubview:_selectView];
    [_selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@44);
        make.top.equalTo(self.titleL.mas_bottom);
    }];
    
    _imageV = [UIImageView new];
    _imageV.backgroundColor = [UIColor blackColor];
    [self addSubview:_imageV];
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.selectView.mas_bottom).offset(3);
        make.height.equalTo(@300);
    }];
    _nameL = [Tools createLabelWithTextColor:[UIColor blackColor] Font:[UIFont fontWithName:@"Helvetica-Bold" size :17] TextAlignment:NSTextAlignmentLeft];
    _nameL.numberOfLines = 2;
    [self addSubview:_nameL];
    [_nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self.imageV.mas_bottom).offset(10);
    }];
    _messageL = [Tools createLabelWithTextColor:[UIColor grayColor] Font:[UIFont systemFontOfSize:14] TextAlignment:NSTextAlignmentLeft];
    _messageL.numberOfLines = 0;
    [self addSubview:_messageL];
    
    [_messageL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nameL);
        make.top.equalTo(self.nameL.mas_bottom).offset(10);
        make.bottom.equalTo(self).offset(-15);
    }];
    
    [self bindData];
}
-(void)bindData
{
    self.titleL.text = self.dataModel.title;
    NSMutableArray*arrM = [NSMutableArray array];
    for (BaseUIDataModel*mode in self.dataModel.classify) {
        [arrM addObject:mode.name];
    }
    self.selectView.dataArr = arrM;
    BaseUIDataModel*currentModel = self.dataModel.classify[_index];
    _messageL.text = currentModel.desc;
    _nameL.text = currentModel.title;
    [_imageV sd_setImageWithURL:[NSURL URLWithString:currentModel.imgurl]];
}

-(void)setupData
{
    AssembleSetup13ViewController*vc = [[AssembleSetup13ViewController alloc]init];
    vc.dataModel = self.dataModel;
    
    [vc setReturnRuestData:^(BaseUIDataModel * _Nonnull model) {
        self.dataModel = model;
        [self bindData];
    }];
    [self.viewController.navigationController pushViewController:vc animated:NO];
}
@end
