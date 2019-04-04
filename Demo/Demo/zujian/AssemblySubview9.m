//
//  AssemblySubview9.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview9.h"

@implementation AssemblySubview9

-(void)createSubView
{
    self.backgroundColor = [UIColor whiteColor];
    UIImageView*imageV = [UIImageView new];
    [self addSubview:imageV];
    UIView*shdowV = [UIView new];
    shdowV.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self addSubview:shdowV];
  
    

    UILabel*nameL = [Tools createLabelWithTextColor:[UIColor whiteColor] Font:[UIFont fontWithName:@"Helvetica-Bold" size :30] TextAlignment:NSTextAlignmentLeft];
    [shdowV addSubview:nameL];
    
    UILabel*subheadingL = [Tools createLabelWithTextColor:[UIColor whiteColor] Font:[UIFont  systemFontOfSize:16] TextAlignment:NSTextAlignmentLeft];
    [shdowV addSubview:subheadingL];
    
    UILabel*commentL = [Tools createLabelWithTextColor:WZColorFromHex(0xa5b2b5) Font:[UIFont  systemFontOfSize:14] TextAlignment:NSTextAlignmentLeft];
    [shdowV addSubview:commentL];
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(215);
        make.bottom.equalTo(self);
    }];
    [shdowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(imageV);
    }];
 
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(shdowV).offset(15);
        make.right.equalTo(shdowV).offset(-15);
        make.bottom.equalTo(subheadingL.mas_top).offset(-8);
    }];
    
    [subheadingL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(nameL);
        make.bottom.equalTo(commentL.mas_top).offset(-15);
    }];
    [commentL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(nameL);
        make.bottom.equalTo(shdowV).offset(-20);
    }];
   
    nameL.text = self.dataModel.title;
    subheadingL.text = self.dataModel.subheading;
    commentL.text = self.dataModel.desc;
    [imageV setImageWithURL:[NSURL URLWithString:self.dataModel.imgurl] options:0];
    
}
@end
