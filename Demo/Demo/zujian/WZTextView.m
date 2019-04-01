//
//  WZTextView.m
//  Demo
//
//  Created by apple on 2019/3/29.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "WZTextView.h"
@interface WZTextView()
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* message;
@end
@implementation WZTextView

-(instancetype)initWithDataArr:(NSArray*)dataArr
{
    if ([super init]) {
        _title = dataArr[0];
        _message = dataArr[1];
        self.backgroundColor = [UIColor whiteColor];
        [self createView];
        
    }
    return self;
}

-(void)createView
{
    UILabel*titleLabel = [[UILabel alloc]init];
    titleLabel.text = _title;
    titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.height.mas_equalTo(20);
    }];
    
    UILabel*messageLabel = [[UILabel alloc]init];
    messageLabel.preferredMaxLayoutWidth = kScreenWidth-30;//给一个maxWidth
    [messageLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    messageLabel.textColor = [UIColor grayColor];
    messageLabel.font= [UIFont systemFontOfSize:14];
    messageLabel.numberOfLines = 0;
    messageLabel.text = _message;
    [self addSubview:messageLabel];
    
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self).offset(-10);
    }];
   
    
}

//-(instancetype)init
//{
//    self = [super init];
//
//    if (self ) {
//
//    }
//    return self;
//}
@end
