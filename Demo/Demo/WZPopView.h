//
//  WZPopView.h
//  JiYouYou
//
//  Created by apple on 2018/9/7.
//  Copyright © 2018年 com.TanSi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZPopView : UIView
@property (nonatomic, strong)UIPickerView *pickerView;

/**数据数组*/
@property (nonatomic, strong)NSArray *dataArr;

/**内容视图*/
@property (nonatomic, strong)UIView *contentView;

/**遮罩视图*/
@property (nonatomic, strong)UIView *shadowView;
/**是否显示*/
@property (nonatomic,assign) BOOL isShow;

@property (nonatomic,copy) void(^returnBackSelectindex)(NSInteger);

/**记录*/
@property (nonatomic, assign)NSInteger index;

//是否显示
- (void)showOrHidden;
@end
