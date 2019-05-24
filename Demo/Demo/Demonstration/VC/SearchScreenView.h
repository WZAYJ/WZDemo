//
//  SearchScreenView.h
//  Demo
//
//  Created by apple on 2019/5/18.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchScreenView : UIView
@property (nonatomic, copy) void (^screen)(void);
@end

NS_ASSUME_NONNULL_END
