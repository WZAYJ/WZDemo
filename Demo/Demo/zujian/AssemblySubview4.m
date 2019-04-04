//
//  AssemblySubview4.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview4.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
@interface AssemblySubview4 ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *cycleScrollview;
@end
@implementation AssemblySubview4

-(void)createSubView
{
    _cycleScrollview = [[SDCycleScrollView alloc]init];
    _cycleScrollview.delegate = self;
    [self addSubview:_cycleScrollview];
    
    [_cycleScrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.height.mas_equalTo(200);
    }];
    
    _cycleScrollview.imageURLStringsGroup = self.dataModel.imageArr;
}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

@end
