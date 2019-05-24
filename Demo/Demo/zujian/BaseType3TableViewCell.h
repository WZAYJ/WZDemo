//
//  BaseType3TableViewCell.h
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseType3TableViewCell : UITableViewCell<YYTextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet YYTextView *textView;

@property (nonatomic, copy) void (^returnTextBlock)(NSString*);
@end

NS_ASSUME_NONNULL_END
