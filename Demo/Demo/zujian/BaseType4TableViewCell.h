//
//  BaseType4TableViewCell.h
//  Demo
//
//  Created by apple on 2019/5/28.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseType4TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, copy) void (^didSelect)(UITextField*);

@end

NS_ASSUME_NONNULL_END
