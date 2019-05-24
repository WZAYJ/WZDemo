//
//  BaseAssemblyView.m
//  Demo
//
//  Created by apple on 2019/3/29.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseAssemblyView.h"
@interface BaseAssemblyView()
@property (nonatomic, strong) BaseUIModel *uimodel;
@end
@implementation BaseAssemblyView

+(BaseAssemblyView*)viewWithDataDic:(NSDictionary*)dataDic
{
    BaseUIModel*model = [BaseUIModel modelWithJSON:dataDic];
    NSString*className = [NSString stringWithFormat:@"AssemblySubview%@",dataDic[@"viewType"]];
    
    return  [[NSClassFromString(className) alloc]initwithDataUIModel:model];
}


-(instancetype)initwithDataUIModel:(BaseUIModel*)uiModel
{
    if ([super init]) {
        self.dataModel = uiModel.dataModel;
        [self createSubView];
        self.backgroundColor = [UIColor whiteColor];

        UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setupData)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)setupData
{
    
}

-(void)createSubView
{
    
}
@end
