//
//  ScreenTableViewCell.m
//  Demo
//
//  Created by apple on 2019/5/20.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "ScreenTableViewCell.h"
@implementation ScreenTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    WZSubsectionButton*subsectionView = [[WZSubsectionButton alloc]initWithFrame:CGRectMake(0, 0, self.classView.width,_classView.height)];
    self.subsectionView = subsectionView;
//    WeakSelf
//    [subsectionView setReturnSelectIndex:^(NSInteger index) {
//        [weakSelf.dataArr removeObjectAtIndex:index];
//        weakSelf.subsectionView.dataArr = weakSelf.dataArr;
//        if (weakSelf.dataArr.count == 0) {
//            weakSelf.classViewHeight.constant = 0;
//        }
//    }];
    [_classView addSubview:subsectionView];

    [subsectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.classView);
    }];
//    self.subsectionView = subsectionView;
    
    subsectionView.dataArr =@[@"haha",@"天人合一",@"35cfc",@"dddd",@"haha",@"天人合一"];
    
    subsectionView.selectStr = @"天人合一";

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
