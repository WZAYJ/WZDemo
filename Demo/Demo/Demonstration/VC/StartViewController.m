//
//  StartViewController.m
//  Demo
//
//  Created by apple on 2019/5/8.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "StartViewController.h"
#import "TggStarEvaluationView.h"
@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TggStarEvaluationView *tggStarEvaView1 = [TggStarEvaluationView evaluationViewWithChooseStarBlock:nil];
    tggStarEvaView1.spacing = 0.1;
        tggStarEvaView1.starCount = 4.7;
//    tggStarEvaView1.tapEnabled = NO;
    [self.view addSubview:tggStarEvaView1];
    
    [tggStarEvaView1 setReturnBackChooseStar:^(NSInteger count) {
        
        NSLog(@"选择-----  %ld 星",count);
    }];
    
    [tggStarEvaView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(80);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(80);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
