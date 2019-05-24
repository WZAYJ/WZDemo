//
//  WZSubsectionButton.m
//  QiXiuWangApp
//
//  Created by apple on 2019/3/22.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "WZSubsectionButton.h"
@interface WZSubsectionButton()
/**    */
//@property (nonatomic, strong) NSMutableArray *dataArrM;

@end
@implementation WZSubsectionButton

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
    CGFloat height =self.height;
    CGFloat space = 10;
    CGFloat width = (kScreenWidth-80)/4;
    _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake((width+space)*self.dataArr.count, height);
    for (int i =0 ; i<self.dataArr.count; i++) {
        UIButton*button = [[UIButton alloc]initWithFrame:CGRectMake((width+space)*i, 0, width, height)];
        [button setTitle:self.dataArr[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize: 15];
        button.tag = 100+i;
        button.layer.cornerRadius = 4;
        button.clipsToBounds = YES;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth= 1;
        [button addTarget:self action:@selector(buttonSelect:) forControlEvents:UIControlEventTouchUpInside];
//        [button setImage:[UIImage imageNamed:@"icon_del"] forState:UIControlStateNormal];
        [_scrollView addSubview:button];
    }
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

-(void)setSelectStr:(NSString *)selectStr
{
    _selectStr = selectStr;
    for (UIView*view in _scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton*button = (UIButton*)view;
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                button.selected = NO;
                button .backgroundColor = [UIColor whiteColor];
            
            if ([button.titleLabel.text isEqualToString:selectStr]) {
                button.selected = YES;
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                button .backgroundColor = WZColor(31, 180, 252);
            }
        }
    }
}

-(void)buttonSelect:(UIButton*)btn{
    for (UIView*view in _scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            
            UIButton*button = (UIButton*)view;
            if (button != btn) {
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                button.selected = NO;
                button .backgroundColor = [UIColor whiteColor];
            }
        }
    }
    if (btn.selected) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn .backgroundColor = [UIColor whiteColor];
        _returnSelectIndex(-1);
        
    }
    else
    {
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn .backgroundColor = WZColor(31, 180, 252);
    NSInteger index = btn.tag-100;
    _returnSelectIndex(index);

    }
    btn.selected = !btn.selected;
}


@end
