//
//  SearchScreenView.m
//  Demo
//
//  Created by apple on 2019/5/18.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "SearchScreenView.h"
#import "WZSelectSuberVIew.h"
#import "ScreenView.h"
@interface SearchScreenView()
@property (nonatomic, strong) WZSelectSuberVIew *subsectionView;
@property (weak, nonatomic) IBOutlet UIView *classView;
@property (nonatomic, strong) NSMutableArray*dataArr;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *classViewHeight;
@property (weak, nonatomic) IBOutlet UIButton *screenBtn;

@property (nonatomic, copy) ScreenView* screenView;
@end

@implementation SearchScreenView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self.screenBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,-self.screenBtn.imageView.image.size.width, 0,self.screenBtn.imageView.image.size.width)];
    [self.screenBtn setImageEdgeInsets:UIEdgeInsetsMake(0,self.screenBtn.titleLabel.bounds.size.width,0, -self.screenBtn.titleLabel.bounds.size.width)];
  
    //分类按钮
    WZSelectSuberVIew*subsectionView = [[WZSelectSuberVIew alloc]initWithFrame:CGRectMake(0, 15, _classView.width,45)];
    WeakSelf
    [subsectionView setReturnSelectIndex:^(NSInteger index) {        
        [weakSelf.dataArr removeObjectAtIndex:index];
         weakSelf.subsectionView.dataArr = weakSelf.dataArr;
        if (weakSelf.dataArr.count == 0) {
            weakSelf.classViewHeight.constant = 0;
        }
    }];
    self.subsectionView = subsectionView;
    [_classView addSubview:subsectionView];
    
    [subsectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(45);
        make.left.right.equalTo(self.classView);
        make.top.equalTo(self.classView).offset(15);
    }];
    
    [self loadData];
}
-(void)loadData
{
    self.dataArr =[NSMutableArray arrayWithArray:@[@"haha",@"天人合一",@"35cfc",@"dddd",@"haha",@"天人合一"]] ;
    _subsectionView.dataArr = self.dataArr;
    self.classViewHeight.constant = 55;
}
/**
 筛选
 */
- (IBAction)screen:(UIButton*)sender {
    sender.selected = !sender.selected;
    if (_screen) {
        _screen();
    }
}
@end
