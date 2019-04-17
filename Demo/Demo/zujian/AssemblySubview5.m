//
//  AssemblySubview5.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview5.h"
static int maxnum =4;
static int height =83;
@implementation AssemblySubview5

-(void)createSubView
{
    
    int i =0;
    for (NSString*title in self.dataModel.titleArr) {
        QMUIButton*button = [[QMUIButton alloc]init];
        [button setImage:[UIImage imageNamed:self.dataModel.imageArr[i]] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:button];
        float width = kScreenWidth / 4;
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset((i%4)*width);
            make.size.mas_equalTo(CGSizeMake(width, height));
            make.top.equalTo(self).offset(i/4*(height+10)+10);
            if (i == self.dataModel.titleArr.count-1) {
                make.bottom.equalTo(self);
            }
        }];
//        button.titleEdgeInsets = UIEdgeInsetsMake(50, -button.imageView.bounds.size.width, 0,0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(0, button.titleLabel.frame.size.width/2, button.titleLabel.frame.size.height+9, -button.titleLabel.frame.size.width/2);
//
        button.imagePosition = QMUIButtonImagePositionTop;
        i++;
    }
    
}

@end
