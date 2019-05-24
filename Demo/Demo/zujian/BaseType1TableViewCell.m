//
//  BaseType1TableViewCell.m
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseType1TableViewCell.h"

@implementation BaseType1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.imageV addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer*)sender {
    UIImageView*imageV =(UIImageView*)sender.view;
    if (self.selectImage) {
        _selectImage(imageV);
    }
}


@end
