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
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSMutableArray *subViewArrm;
@property (nonatomic, strong) UIScrollView *bgScrollView;
@end

@implementation TestViewController

-(NSMutableArray *)subViewArrm
{
    if (!_subViewArrm) {
        _subViewArrm = [NSMutableArray array];
    }
    return _subViewArrm;
}
-(UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [UIScrollView new];
        _bgScrollView.showsVerticalScrollIndicator= NO;
    }
    return _bgScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.dataArr = [Tools readLocalFileWithName:@"UIData"];
    [self.view addSubview:self.bgScrollView];
    [self.bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    if (self.dataArr.count>0) {
        [self createSubView];
    }
    
}

-(void)createSubView
{
    for (NSDictionary*dic in self.dataArr) {
        BaseAssemblyView*view = [BaseAssemblyView viewWithDataDic:dic];
        [self.bgScrollView addSubview:view];
        [self.subViewArrm addObject:view];
    }
    [self layoutSubViews];
}

-(void)layoutSubViews
{
    for (int i =0; i<self.subViewArrm.count; i++) {
        BaseAssemblyView*view = self.subViewArrm[i];
        //每个u组件的间隔
        CGFloat space = 15;
        if (i == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.top.equalTo(self.bgScrollView).offset(44);
                
            }];
        }
        else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.subViewArrm[i-1]);
                make.top.equalTo(((BaseAssemblyView*)self.subViewArrm[i-1]).mas_bottom).offset(space);
                if (i == self.subViewArrm.count-1) {
                    make.bottom.equalTo(self.bgScrollView).offset(-20);
                }
            }];
            
        }
    }
}


@end
