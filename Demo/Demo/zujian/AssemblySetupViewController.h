//
//  AssemblySetupViewController.h
//  Demo
//
//  Created by apple on 2019/5/16.
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

@interface AssemblySetupViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) TPKeyboardAvoidingTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) BaseUIDataModel *dataModel;
@property (nonatomic,copy) void(^returnRuestData)(BaseUIDataModel*);
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray* typeArr;
/**
 组件类型
 */
@property (nonatomic, copy) NSString*assemblyType;

-(void)loadData;
@end

NS_ASSUME_NONNULL_END
