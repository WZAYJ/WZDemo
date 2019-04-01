//
//  BlockViewController.m
//  Demo
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()
@property (nonatomic, assign) NSInteger index;
@end

@implementation BlockViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_queue_t myqueue = dispatch_queue_create("com.test.dask", NULL);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self goDoSomethingLongAndInvolved];
        NSLog(@"1");
        NSLog(@"2");
        NSLog(@"3");
        NSLog(@"4");
        NSLog(@"5");
        NSLog(@"6");

    });
    
}


-(void)goDoSomethingLongAndInvolved
{
    NSLog(@"hahhahaha");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
