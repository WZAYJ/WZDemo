//
//  WZSubsectionButton.h
//  QiXiuWangApp
//
//  Created by apple on 2019/3/22.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WZSubsectionButton : UIView
//-(instancetype)initWithFrame:(CGRect)frame DataArr:(NSArray*)dataArr;

/**  属性注释  */
@property (nonatomic, strong) UIScrollView *scrollView;

// 返回所选button 下标
@property (nonatomic, copy) void(^returnSelectIndex)(NSInteger index);

@property (nonatomic, copy) NSString* selectStr;


@property (nonatomic, strong) NSArray *dataArr;

@end

NS_ASSUME_NONNULL_END
