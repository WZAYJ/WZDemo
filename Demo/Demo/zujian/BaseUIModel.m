//
//  BaseUIModel.m
//  Demo
//
//  Created by apple on 2019/3/30.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseUIModel.h"

@implementation BaseUIModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"dataModel" : [BaseUIDataModel class]};
}
@end

@implementation BaseUIDataModel

@end
