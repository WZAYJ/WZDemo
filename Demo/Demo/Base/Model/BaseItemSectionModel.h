//
//  BaseItemSectionModel.h
//  Demo
//
//  Created by apple on 2019/4/12.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWordItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseItemSectionModel : NSObject
/** <#digest#> */
@property (nonatomic, copy) NSString *headerTitle;

/** <#digest#> */
@property (nonatomic, copy) NSString *footerTitle;

/** <#digest#> */
@property (nonatomic, strong) NSMutableArray<BaseWordItemModel *> *items;

@property (nonatomic, assign) BOOL hiddenSection;

+ (instancetype)sectionWithItems:(NSArray<BaseWordItemModel *> *)items andHeaderTitle:(NSString *)headerTitle;
@end

NS_ASSUME_NONNULL_END
