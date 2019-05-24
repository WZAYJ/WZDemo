//
//  AssmblSetViewController.h
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseUIModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AssmblSetViewController : BaseViewController
@property (nonatomic, strong) BaseUIDataModel *dataModel;
@property (nonatomic,copy) void(^returnRuestData)(BaseUIDataModel*);

@end

NS_ASSUME_NONNULL_END
