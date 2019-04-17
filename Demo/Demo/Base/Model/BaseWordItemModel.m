//
//  BaseWordItemModel.m
//  Demo
//
//  Created by apple on 2019/4/12.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseWordItemModel.h"

@implementation BaseWordItemModel
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    BaseWordItemModel *itemModel = [[self alloc] init];
    itemModel.subTitle = subTitle;
    itemModel.title = title;
    return itemModel;
}
@end
