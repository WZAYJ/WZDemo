//
//  ScreenTableViewCell.h
//  Demo
//
//  Created by apple on 2019/5/20.
//  Copyright © 2019 SRT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZSubsectionButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScreenTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *classView;

@property (nonatomic, strong) WZSubsectionButton*subsectionView;

@end

NS_ASSUME_NONNULL_END
