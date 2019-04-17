//
//  BaseItemSectionModel.m
//  Demo
//
//  Created by apple on 2019/4/12.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseItemSectionModel.h"

@implementation BaseItemSectionModel
+ (instancetype)sectionWithItems:(NSArray<BaseWordItemModel *> *)items andHeaderTitle:(NSString *)headerTitle
{
    BaseItemSectionModel *item = [[self alloc] init];
    if (items.count) {
        [item.items addObjectsFromArray:items];
    }
    
    item.headerTitle = headerTitle;
    
    return item;
}

- (NSMutableArray*)items
{
    if(!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end
