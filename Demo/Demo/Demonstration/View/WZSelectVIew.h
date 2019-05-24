//
//  WZSelectVIew.h
//  QiXiuWangApp
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WZSelectVIew : UIView
// <#属性block#>
@property (nonatomic, copy) void(^returnSelectIndex)(NSInteger index);

-(instancetype)initWithFrame:(CGRect)frame;

/**  数据源  */
@property (nonatomic, strong) NSArray *dataArr;
@end

NS_ASSUME_NONNULL_END
