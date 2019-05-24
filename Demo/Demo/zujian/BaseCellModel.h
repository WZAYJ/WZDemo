//
//  BaseCellModel.h
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCellModel : NSObject
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* image;
@property (nonatomic, copy) NSString* identifier;
/**
 1.图片
 2.单行输入
 3.多行输入框
 */
@property (nonatomic, copy) NSString* type;
@end

NS_ASSUME_NONNULL_END
