//
//  WZSelectVIew.m
//  QiXiuWangApp
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "WZSelectVIew.h"
@interface WZSelectVIew()
/**  line  */
@property (nonatomic, strong) UIView *line;
@end
@implementation WZSelectVIew
-(instancetype)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    
    if (self) {
        
    }
    return self;
}

-(void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    
    [self createButton];

}
-(void)createButton
{
    [self removeAllSubviews];
    CGFloat width = kScreenWidth/_dataArr.count;
    for (int i =0; i<_dataArr.count; i++) {
        UIButton*button = [UIButton new];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        [button setTitle:_dataArr[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(chooseType:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        button.tag = 100+i;
        if (i ==0) {
            button.selected = YES;
        }
        [self  addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.height.equalTo(self);
            make.left.equalTo(self).offset(i*width);
            make.width.mas_equalTo(width);
        }];
        
    }
    UIView*line2 = [UIView new];
    [self addSubview:line2];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width-30, 2));
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(15);

    }];
    line2.backgroundColor = [UIColor blackColor];
    _line = line2;
}

-(void)chooseType:(UIButton*)btn
{
    NSInteger index = btn.tag-100;
    
    for (UIView*view in btn.superview.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            
            UIButton*button = (UIButton*)view;
            
            button.selected = NO;
        }
    }
    btn.selected = YES;    
    _line.centerX = btn.centerX;
    _returnSelectIndex(index);
}
@end
