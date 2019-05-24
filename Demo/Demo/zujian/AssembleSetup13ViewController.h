//
//  AssembleSetup13ViewController.h
//  Demo
//
//  Created by apple on 2019/5/17.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseUIModel.h"
#import "BaseType1TableViewCell.h"
#import "BaseType2TableViewCell.h"
#import "BaseType3TableViewCell.h"
#import "BaseCellModel.h"
#import "ZZQAvatarPicker.h"
NS_ASSUME_NONNULL_BEGIN

@interface AssembleSetup13ViewController : BaseViewController
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) BaseUIDataModel *dataModel;
@property (nonatomic,copy) void(^returnRuestData)(BaseUIDataModel*);

@end

NS_ASSUME_NONNULL_END
