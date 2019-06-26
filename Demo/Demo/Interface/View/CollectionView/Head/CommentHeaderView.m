//
//  CommentHeaderView.m
//  Demo
//
//  Created by apple on 2019/6/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "CommentHeaderView.h"

@implementation CommentHeaderView
-(void)awakeFromNib
{
    [super awakeFromNib];
    _headView.layer.cornerRadius = 20;
    _headView.clipsToBounds = YES;
}

- (IBAction)zan:(UIButton*)sender {
    
    sender.selected = !sender.selected;
//    NSLog(@"点赞");
}

- (IBAction)more:(id)sender {
    NSLog(@"点击更多");
}
@end
