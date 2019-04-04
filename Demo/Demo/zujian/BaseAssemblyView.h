//
//  BaseAssemblyView.h
//  Demo
//
//  Created by apple on 2019/3/29.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUIModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseAssemblyView : UIView
+(BaseAssemblyView*)viewWithDataDic:(NSDictionary*)dataDic;
//-(instancetype)initwithDataUIModel:(BaseUIModel*)uiModel;
@property (nonatomic, strong) BaseUIDataModel *dataModel;
-(void)createSubView;
@end

NS_ASSUME_NONNULL_END
