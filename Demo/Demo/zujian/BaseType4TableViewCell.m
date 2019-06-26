//
//  BaseType4TableViewCell.m
//  Demo
//
//  Created by apple on 2019/5/28.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseType4TableViewCell.h"

@implementation BaseType4TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)didSelect:(id)sender {
    if (self.didSelect) {
        _didSelect(self.textField);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
