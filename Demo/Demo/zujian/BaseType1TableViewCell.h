//
//  BaseType1TableViewCell.h
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseType1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (nonatomic, copy) void (^selectImage)(UIImageView*);
@end

NS_ASSUME_NONNULL_END
