//
//  WZSelectSuberVIew.h
//  Demo
//
//  Created by apple on 2019/5/20.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WZSelectSuberVIew : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
// 返回所选button 下标
@property (nonatomic, copy) void(^returnSelectIndex)(NSInteger index);

@property (nonatomic, strong) NSArray *dataArr;
@end

NS_ASSUME_NONNULL_END
