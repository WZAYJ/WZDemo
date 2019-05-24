//
//  WZSelectSuberVIew.m
//  Demo
//
//  Created by apple on 2019/5/20.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "WZSelectSuberVIew.h"

@implementation WZSelectSuberVIew

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    return self;
}

-(void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    
    [self removeAllSubviews];
    [self createView];
}
-(void)createView
{
    CGFloat height =self.height-10;
    CGFloat space = 10;
    CGFloat width = (kScreenWidth-80)/4;
    _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake((width+space)*self.dataArr.count, height);
    for (int i =0 ; i<self.dataArr.count; i++) {
        UIButton*button = [[UIButton alloc]initWithFrame:CGRectMake((width+space)*i, 5, width, height)];
        [button setTitle:self.dataArr[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize: 15];
        button.enabled =NO;
        button.layer.cornerRadius = 4;
        button.clipsToBounds = YES;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth= 1;
        
        UIButton*delBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        delBtn.right =button.right+5;
        delBtn.bottom = button.top+15;
        delBtn.tag = 100+i;
        
        [delBtn setImage:[UIImage imageNamed:@"icon_del"] forState:UIControlStateNormal];
        //            delBtn.backgroundColor = [UIColor redColor];
        //            if (i == 0) {
        //                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //                button .backgroundColor = WZColor(31, 180, 252);
        //            }
        [delBtn addTarget:self action:@selector(buttonDelect:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:button];
        [_scrollView addSubview:delBtn];
        
    }
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
-(void)buttonSelect:(UIButton*)btn{
    for (UIView*view in _scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton*button = (UIButton*)view;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button .backgroundColor = [UIColor whiteColor];
        }
    }
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn .backgroundColor = WZColor(31, 180, 252);
    NSInteger index = btn.tag-100;
    _returnSelectIndex(index);
}
-(void)buttonDelect:(UIButton*)btn
{
    NSInteger index = btn.tag-100;
    
    if (_returnSelectIndex) {
        _returnSelectIndex(index);
    }
    
    
}


@end
