//
//  AssemblySubview7.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview7.h"

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
    
    titleL.text = self.dataModel.title;
    [imageV sd_setImageWithURL:[NSURL URLWithString:self.dataModel.imgurl]];
    messageL.text = self.dataModel.desc;
}


@end
