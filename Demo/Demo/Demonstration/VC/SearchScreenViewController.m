//
//  SearchScreenViewController.m
//  Demo
//
//  Created by apple on 2019/5/18.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "SearchScreenViewController.h"
#import "SearchScreenView.h"
#import "ScreenView.h"
@interface SearchScreenViewController ()
@property (nonatomic, strong) SearchScreenView *topView;
@property (nonatomic, strong) ScreenView* screenView;
@end

@implementation SearchScreenViewController
-(ScreenView *)screenView{
    if (!_screenView) {
        _screenView = [[NSBundle mainBundle]loadNibNamed:@"ScreenView" owner:nil options:nil].firstObject;
        _screenView.hidden = YES;
    }
    return _screenView;
}
-(SearchScreenView *)topView
{
    if (!_topView) {
        _topView =  [[NSBundle mainBundle]loadNibNamed:@"SearchScreenView" owner:nil options:nil].firstObject;
    }
    return _topView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
    }];
    WeakSelf
    [self.topView setScreen:^{
        weakSelf.screenView.hidden = ! weakSelf.screenView.hidden ;
    }];
    [self.view addSubview:self.screenView];
    [self.screenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom);
//        make.top.equalTo(self.topView).offset(60);
        make.bottom.left.right.equalTo(self.view);
    }];
}



@end
