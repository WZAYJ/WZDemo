//
//  BaseType3TableViewCell.m
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseType3TableViewCell.h"

@implementation BaseType3TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.textView.delegate = self;
}

-(void)textViewDidEndEditing:(YYTextView *)textView
{
    if (self.returnTextBlock) {
        self.returnTextBlock(textView.text);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
