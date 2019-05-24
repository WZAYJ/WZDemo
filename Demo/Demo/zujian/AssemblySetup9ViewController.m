//
//  AssemblySetup9ViewController.m
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySetup9ViewController.h"

@interface AssemblySetup9ViewController ()

@end

@implementation AssemblySetup9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArr = @[@"图片",@"标题",@"副标题",@"介绍"];
    self.typeArr =@[@"1",@"2",@"2",@"2"];
    [self loadData];

}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCellModel*model = self.dataArr[indexPath.row];
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:model.identifier];
    if ([model.type isEqualToString:@"1"]) {
        BaseType1TableViewCell* cell1 = (BaseType1TableViewCell*)cell;
        cell1.titleL.text = model.title;
        [cell1.imageV sd_setImageWithURL:[NSURL URLWithString:self.dataModel.imgurl]];
        [cell1 setSelectImage:^(UIImageView * _Nonnull imageV) {
            [self.view endEditing:YES];
            [ZZQAvatarPicker startSelected:^(UIImage * _Nonnull image) {
                if (image) {
                    [imageV setImage:image];
                    
                }
            }];
            
        }];
    }
    if ([model.type isEqualToString:@"2"]) {
        BaseType2TableViewCell* cell2 = (BaseType2TableViewCell*)cell;
        cell2.nameL.text = model.title;
        if (indexPath.row == 1) {
            cell2.textField.text = self.dataModel.title;
        }
       else if (indexPath.row == 2) {
            cell2.textField.text = self.dataModel.subheading;
        }
       else if (indexPath.row == 3) {
           cell2.textField.text = self.dataModel.desc;
       }
        WeakSelf
        [[cell2.textField rac_textSignal]subscribeNext:^(id x) {
            if (indexPath.row == 1) {
                weakSelf.dataModel.title = x;
            }
            else if (indexPath.row == 2) {
                weakSelf.dataModel.subheading = x;
            }
            else if (indexPath.row == 3) {
                weakSelf.dataModel.desc = x;
            }
        }];
    }

    cell.selectionStyle = 0;
    return cell;
}
@end
