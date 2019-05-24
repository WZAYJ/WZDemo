//
//  AssemblySetupViewController.m
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySetupViewController.h"

@interface AssemblySetupViewController ()

@end

@implementation AssemblySetupViewController
-(TPKeyboardAvoidingTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[TPKeyboardAvoidingTableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView= [UIView new];
        _tableView.estimatedRowHeight = 50; //设置估计高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubView];
    [self loadData];
  
}
-(void)createSubView
{
    self.view.backgroundColor =ColorLine;
    self.title = @"编辑内容";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseType1TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BaseType1TableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseType2TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BaseType2TableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseType3TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BaseType3TableViewCell"];
}
-(void)loadData
{    
    self.dataArr = [NSMutableArray array];
    for (int i =0; i<self.titleArr.count; i++) {
        BaseCellModel*model = [BaseCellModel new];
        model.type =self.typeArr[i];
        model.identifier = [NSString stringWithFormat:@"BaseType%@TableViewCell",model.type];
        model.title =self.titleArr[i];
        [self.dataArr addObject:model];
    }
    [self.tableView reloadData];
}
#pragma mark — tableviewDatasouce

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
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

        [self operationWithCell:cell2 Indexpath:indexPath];
      
        
        
        
    }
    if ([model.type isEqualToString:@"3"]) {
        BaseType3TableViewCell* cell3 = (BaseType3TableViewCell*)cell;
        cell3.titleL.text = model.title;
        cell3.textView.text = self.dataModel.desc;
        WeakSelf
        [cell3 setReturnTextBlock:^(NSString * _Nonnull string) {
            
            weakSelf.dataModel.desc = string;
        }];
    }
    cell.selectionStyle = 0;
    return cell;
}

//各个组件处理
-(void)operationWithCell:(BaseType2TableViewCell*)cell Indexpath:(NSIndexPath*)indexPath
{
    if ([self.assemblyType isEqualToString:@"1"]) {
        
        switch (indexPath.row) {
            case 1:
            {
                cell.textField.text = self.dataModel.title;
                WeakSelf
                [[cell.textField rac_textSignal]subscribeNext:^(id x) {
                    weakSelf.dataModel.title = x;
                }];
            }
                break;
            case 2:
            {
                cell.textField.text = self.dataModel.name;
                WeakSelf
                [[cell.textField rac_textSignal]subscribeNext:^(id x) {
                    weakSelf.dataModel.name = x;
                }];
            }
                break;
            case 3:
            {
                cell.textField.text = self.dataModel.englishName;
                WeakSelf
                [[cell.textField rac_textSignal]subscribeNext:^(id x) {
                    weakSelf.dataModel.englishName = x;
                }];
            }
                break;
            case 4:
            {
                cell.textField.text = self.dataModel.wx;
                WeakSelf
                [[cell.textField rac_textSignal]subscribeNext:^(id x) {
                    weakSelf.dataModel.wx = x;
                }];
            }
                break;
            case 5:
            {
                cell.textField.text = self.dataModel.gwurl;
                WeakSelf
                [[cell.textField rac_textSignal]subscribeNext:^(id x) {
                    weakSelf.dataModel.gwurl = x;
                }];
            }
                break;
            case 6:
            {
                cell.textField.text = self.dataModel.tel;
                WeakSelf
                [[cell.textField rac_textSignal]subscribeNext:^(id x) {
                    weakSelf.dataModel.tel = x;
                }];
            }
                break;
                
            default:
                break;
        }
        
    }
   else if ([self.assemblyType isEqualToString:@"7"]) {
        cell.textField.text = self.dataModel.title;
        WeakSelf
        [[cell.textField rac_textSignal]subscribeNext:^(id x) {
            weakSelf.dataModel.title = x;
        }];
    }
    else if ([self.assemblyType isEqualToString:@"9"]) {
        if (indexPath.row == 1) {
            cell.textField.text = self.dataModel.title;
        }
        else if (indexPath.row == 2) {
            cell.textField.text = self.dataModel.subheading;
        }
        else if (indexPath.row == 3) {
            cell.textField.text = self.dataModel.desc;
        }
        WeakSelf
        [[cell.textField rac_textSignal]subscribeNext:^(id x) {
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
    else if ([self.assemblyType isEqualToString:@"6"]) {
        if (indexPath.row == 0) {
            cell.textField.text = self.dataModel.title;
        }
        else if (indexPath.row == 1) {
            cell.textField.text = self.dataModel.desc;
        }
        
        WeakSelf
        [[cell.textField rac_textSignal]subscribeNext:^(id x) {
            if (indexPath.row == 0) {
                weakSelf.dataModel.title = x;
            }
            else if (indexPath.row == 1) {
                weakSelf.dataModel.desc = x;
            }
        }];
    }

}

-(void)back
{
    if (self.returnRuestData) {
        _returnRuestData(self.dataModel);
    }
    [self.navigationController popViewControllerAnimated:NO];
}

@end
