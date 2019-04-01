//
//  TestViewController.m
//  Demo
//
//  Created by apple on 2019/3/29.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "TestViewController.h"
#import "WZTextView.h"
#import "WZSelectView.h"
#import "BaseAssemblyView.h"
#import "BaseUIModel.h"
@interface TestViewController ()
@property (nonatomic, copy) NSString* type;
    @property (nonatomic, strong) NSArray *dataArr;
    @property (nonatomic, strong) WZTextView *textview;
    @property (nonatomic, strong) BaseUIModel *uiModel;

@end

@implementation TestViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"uidata" ofType:@"json"];

    _dataArr = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:nil error:nil];
    for (NSDictionary*dic in _dataArr) {
        BaseAssemblyView*view = [[BaseAssemblyView alloc]initWithDataDic:dic];
        [self.view addSubview:view];        
    }




//    BaseAssemblyView*view = [[BaseAssemblyView alloc]initWithDataDic:<#(nonnull NSDictionary *)#>];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view).offset(20);
//    }];
    
//    BaseAssemblyView*view2 = [[BaseAssemblyView alloc]initWithDataArr:@[@{@"img":@"",@"title":@"11"}, @{@"img":@"",@"title":@"11"}, @{@"img":@"",@"title":@"11"}, @{@"img":@"",@"title":@"11"}, @{@"img":@"",@"title":@"11"}]];
//    [self.view addSubview:view2];
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(view);
//        make.top.equalTo(view.mas_bottom).offset(15);
//
//    }];
    
    
}




@end
