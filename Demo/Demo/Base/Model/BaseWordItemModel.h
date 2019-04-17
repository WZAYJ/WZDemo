//
//  BaseWordItemModel.h
//  Demo
//
//  Created by apple on 2019/4/12.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseWordItemModel : NSObject
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** subTitle */
@property (nonatomic, copy) NSString *subTitle;
/** 左边的图片 UIImage 或者 NSURL 或者 URLString 或者 ImageName */
@property (nonatomic, strong) id image;

/** <#digest#> */
@property (assign, nonatomic) Class destVc;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end

NS_ASSUME_NONNULL_END
