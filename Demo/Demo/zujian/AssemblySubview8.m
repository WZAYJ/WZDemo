//
//  AssemblySubview8.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview8.h"

@implementation AssemblySubview8

-(void)createSubView
{
    UILabel*label = [Tools createLabelWithTextColor:[UIColor blackColor] Font:[UIFont fontWithName:@"Helvetica-Bold" size:17] TextAlignment:NSTextAlignmentLeft];
    
    [self addSubview:label];
    label.text = self.dataModel.title;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(15);
        make.height.mas_equalTo(20);
    }];
    
    UIView*messageV = [UIView new];
    messageV.backgroundColor = WZColorFromHex(0xe6e0f0);
    [self addSubview:messageV];
    
    [messageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(label.mas_bottom).offset(15);
    }];
    int i =0;
    for (NSString*string in self.dataModel.titleArr) {
        CGFloat vspace = 10;
        CGFloat height = 256;
        CGFloat width = (kScreenWidth-30-vspace)/2;
        UIView*view = [self createViewWithTitle:string Image:self.dataModel.imageArr[i]];
        view.backgroundColor = [UIColor whiteColor];
        [messageV addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(messageV).offset(((int)i%2)*(width+vspace)+15);
            make.top.equalTo(messageV).offset(10+((int)(i/2))*(height+10));
            if (i == self.dataModel.titleArr.count-1) {
                make.bottom.equalTo(messageV).offset(-20);
            }
            make.size.mas_equalTo(CGSizeMake(width, height));
        }];
        i++;

    }
    
}

-(UIView*)createViewWithTitle:(NSString*)title Image:(NSString*)image
{
    UIView*view = [UIView new];
    
    UIImageView*imageV = [[UIImageView alloc]init];
    imageV.clipsToBounds = YES;
    [imageV sd_setImageWithURL:[NSURL URLWithString:image]];
    [view addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
//        make.height.mas_equalTo(180);
    }];
    
    UILabel*label = [Tools createLabelWithTextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentLeft];
    label.text = title;
    label.numberOfLines = 2;
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageV);
        make.right.equalTo(view).offset(-10);
        make.bottom.equalTo(view).offset(-20);
        make.height.mas_equalTo(40);
        make.top.equalTo(imageV.mas_bottom).offset(15);
    }];
    
    
    
    return view;
}

@end
