//
//  WZPopView.m
//  JiYouYou
//
//  Created by apple on 2018/9/7.
//  Copyright © 2018年 com.TanSi. All rights reserved.
//

#import "WZPopView.h"


@interface WZPopView()<UIPickerViewDelegate,UIPickerViewDataSource>


@property (nonatomic, assign) NSInteger row;


/**确定按按*/
@property (nonatomic, strong)UIButton *btn;


/**取消按按*/
@property (nonatomic, strong)UIButton *cancle;

@end

@implementation WZPopView


-(NSArray *)dataArr
{
    if (_dataArr==nil) {
        _dataArr=[NSArray array];
    }
    return _dataArr;
}



-(UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat btnW = 50;
        CGFloat btnH = 40;
        _btn.frame = CGRectMake(0, 0, btnW, btnH);
        _btn.right = ScreenWidth-20;
        [_btn setTitle:@"确定" forState:UIControlStateNormal];
        [_btn setTitleColor:BaseFontColor forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}


-(UIButton *)cancle
{
    if (!_cancle) {

        _cancle = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, 50, 40)];
        [_cancle setTitle:@"取消" forState:UIControlStateNormal];
        [_cancle setTitleColor:WZTextColor forState:UIControlStateNormal];
        [_cancle addTarget:self action:@selector(showOrHidden) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancle;
}
//懒加载 遮罩视图
-(UIView *)shadowView{
    if (!_shadowView) {
        //初始化遮罩视图
        _shadowView = [[UIView alloc]initWithFrame:self.bounds];
        _shadowView.backgroundColor = [UIColor blackColor];
        _shadowView.alpha = .4;
        _shadowView.hidden = YES;//默认隐藏

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shadowViewHidden)];
        [_shadowView addGestureRecognizer:tap];
        [self addSubview:_shadowView];
    }
    return _shadowView;
}

//点击事件 隐藏遮罩视图
- (void)shadowViewHidden{
    _isShow = !_isShow;


    [UIView animateWithDuration:.35 animations:^{

        self.contentView.transform = CGAffineTransformIdentity;

    } completion:^(BOOL finished) {

        self.contentView.hidden = YES;
        self.shadowView.hidden = YES;//隐藏
        self.hidden = YES;

    }] ;
}

//是否显示
- (void)showOrHidden{

    _isShow = !_isShow;

    if (_isShow == YES) {//添加遮罩视图

        self.hidden = NO;
        self.contentView.hidden = NO;
        self.shadowView.hidden = NO;//显示

        [UIView animateWithDuration:.35 animations:^{
            [self bringSubviewToFront:self.contentView];
        }];

    }
    if (_isShow == NO) {

        [self.contentView endEditing:YES];
        self.contentView.hidden = YES;
        self.shadowView.hidden = YES;//隐藏
        self.hidden = YES;
        [UIView animateWithDuration:.35 animations:^{

            self.contentView.transform = CGAffineTransformIdentity;

        } completion:^(BOOL finished) {



        }] ;
    }
}


-(UIView *)contentView{

    if (!_contentView) {

        CGFloat height = kScreenHeight/3;
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, height)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView addSubview:self.pickerView];
        [_contentView addSubview:self.btn];
        [_contentView addSubview:self.cancle];
        _contentView.bottom=ScreenHeight;

        _contentView.clipsToBounds = YES;

    }

    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;

    [keyWindow addSubview:_contentView];
    return _contentView;
}




/**确定按钮被点击*/
- (void)btnAction:(UIButton *)btn{
        [self showOrHidden];


        _returnBackSelectindex(_row);

    }








#pragma pickerView设置

-(UIPickerView *)pickerView{
    if (!_pickerView) {
        CGFloat height = kScreenHeight/3;
        CGFloat width = kScreenWidth;
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,0, width, height)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;

    }
    return _pickerView;
}

#pragma mark -UIPickerViewDataSource
/**返回几组*/
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

    return 1;
}

/**返回每一组有多少个*/
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_dataArr count];

}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{



    UILabel *myView = nil;
    if (component == 0) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,self.width, 40)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [self.dataArr objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:17];
        myView.backgroundColor = [UIColor clearColor];
    }

    return myView;
}




#pragma mark -UIPickerViewDelegate
//监听滚动
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
        _row=row;
}
//确定每一项显示的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return [_dataArr objectAtIndex:row];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}



@end
