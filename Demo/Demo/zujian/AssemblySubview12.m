//
//  AssemblySubview12.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview12.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
@interface AssemblySubview12 ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *cycleScrollview;
@end
@class AssemblySubview12Cell;

@implementation AssemblySubview12

-(void)createSubView
{
    _cycleScrollview = [[SDCycleScrollView alloc]init];
    _cycleScrollview.delegate = self;
    _cycleScrollview.backgroundColor = [UIColor whiteColor];
    [self addSubview:_cycleScrollview];
    
    [_cycleScrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.height.mas_equalTo(535);
    }];
    
    _cycleScrollview.imageURLStringsGroup = self.dataModel.imageArr;
}


-(Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view
{
    return [AssemblySubview12Cell class];
}
- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view
{
    AssemblySubview12Cell*newcell = (AssemblySubview12Cell*)cell;
//    [newcell.headImg sd_setImageWithURL:[NSURL URLWithString:self.dataModel.imageArr[index]]];
//    newcell.titleL.text = self.dataModel.imageArr[index];
    [newcell.headimageV sd_setImageWithURL:[NSURL URLWithString:self.dataModel.imageArr[index]]];
    newcell.titleL.text = self.dataModel.titleArr[index];
    newcell.messageL.text = self.dataModel.messageArr[index];
}




@end

@implementation AssemblySubview12Cell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createSubView];
    }
    
    return self;
}
-(void)createSubView
{
    _headimageV  = [UIImageView new];
    [self addSubview:_headimageV];
    [_headimageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_offset(344);
    }];
    _titleL =[Tools createLabelWithTextColor:[UIColor blackColor] Font:[UIFont fontWithName:@"Helvetica-Bold" size:30] TextAlignment:NSTextAlignmentCenter];
    [self addSubview:_titleL];
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.headimageV.mas_bottom).offset(25);
    }];
    _messageL = [Tools createLabelWithTextColor:WZColorFromHex(0xb2b2b2) Font:[UIFont systemFontOfSize:14] TextAlignment:NSTextAlignmentCenter];
    _messageL.numberOfLines = 0;
    [self addSubview:_messageL];
    
    [_messageL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleL);
        make.top.equalTo(self.titleL.mas_bottom).offset(20);
        
    }];
    
}
@end
