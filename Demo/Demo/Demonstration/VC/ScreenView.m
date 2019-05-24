//
//  ScreenView.m
//  Demo
//
//  Created by apple on 2019/5/20.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "ScreenView.h"
#import "ScreenTableViewCell.h"
@interface ScreenView()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableVIewHeight;
@end
@implementation ScreenView

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor =[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    self.cancelBtn .layer.cornerRadius = 5;
    self.cancelBtn.clipsToBounds = YES;
    self.cancelBtn.layer.borderWidth = 1;
    self.cancelBtn.layer.borderColor = ColorLine.CGColor;
    self.doneBtn .layer.cornerRadius = 5;
    self.doneBtn.clipsToBounds = YES;
    
    self.tableView.estimatedRowHeight = 80; //设置估计高度
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}




#pragma mark — tableviewDatasouce

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScreenTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"ScreenTableViewCell"];
    
    if (!cell) {
        
        cell = [[NSBundle mainBundle]loadNibNamed:@"ScreenTableViewCell" owner:nil options:nil].lastObject;
    }
    cell.selectionStyle = 0;
    [cell.subsectionView setReturnSelectIndex:^(NSInteger index) {
        
    }];
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == ((NSIndexPath *)[[tableView indexPathsForVisibleRows] lastObject]).row) {
        //end of loading
        
        dispatch_async(dispatch_get_main_queue(), ^{
                self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, kScreenWidth, tableView.contentSize.height);
                self.tableVIewHeight.constant =tableView.contentSize.height;
            
            NSLog(@"%f",tableView.contentSize.height);
        });
    }
    //    ---------------------
}

/**
 清空
 */
- (IBAction)cancel:(id)sender {
    
}
/**
 选择
 */
- (IBAction)done:(id)sender {
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
