//
//  BaseUIModel.h
//  Demo
//
//  Created by apple on 2019/3/30.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface  BaseUIDataModel: NSObject
@property (nonatomic, copy) NSString* viewType;
@end

@interface BaseUIModel : NSObject
@property (nonatomic, copy) NSString* viewType;
@property (nonatomic, strong) BaseUIDataModel* dataModel;
@end



NS_ASSUME_NONNULL_END
