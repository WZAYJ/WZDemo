//
//  AssemblySubview6.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview6.h"

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
    
    titleL.text = self.dataModel.title;
    messageL.text = self.dataModel.desc;
}

@end
