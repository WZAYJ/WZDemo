//
//  AssembleSetup2ViewController.h
//  Demo
//
//  Created by apple on 2019/5/17.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseUIModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AssembleSetup2ViewController : BaseViewController
@property (nonatomic, strong) BaseUIDataModel *dataModel;
@property (nonatomic,copy) void(^returnRuestData)(BaseUIDataModel*);

@end

NS_ASSUME_NONNULL_END
