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
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* desc;
@property (nonatomic, copy) NSString* imgurl;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* englishName;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *messageArr;

@property (nonatomic, copy) NSString* subheading;
//纬度
@property (nonatomic, copy) NSString* latitude;
@property (nonatomic, copy) NSString* longitude;
//"1" = 透明渐变   “2”白色背景
@property (nonatomic, copy) NSString* maptitleType;
@end

@interface BaseUIModel : NSObject
@property (nonatomic, copy) NSString* viewType;
@property (nonatomic, strong) BaseUIDataModel* dataModel;
@end



NS_ASSUME_NONNULL_END
