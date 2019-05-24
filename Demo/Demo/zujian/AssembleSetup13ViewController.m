//
//  AssembleSetup13ViewController.m
//  Demo
//
//  Created by apple on 2019/5/17.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssembleSetup13ViewController.h"

@interface AssembleSetup13ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray* typeArr;
@property (nonatomic, strong) TPKeyboardAvoidingTableView *tableView;

@end

@implementation AssembleSetup13ViewController
-(TPKeyboardAvoidingTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[TPKeyboardAvoidingTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
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
    self.titleArr = @[@"分类名",@"图片",@"标题",@"内容"];
    self.typeArr = @[@"2",@"1",@"2",@"3"];
    [self loadData];
    
    // Do any additional setup after loading the view.
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCellModel*model = self.dataArr[indexPath.row];
    
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:model.identifier];
   
    NSMutableArray*arrM =[NSMutableArray arrayWithArray:self.dataModel.classify];
    BaseUIDataModel*data= arrM[indexPath.section];
    if ([model.type isEqualToString:@"1"]) {
        BaseType1TableViewCell* cell1 = (BaseType1TableViewCell*)cell;
        cell1.titleL.text = model.title;
        [cell1.imageV sd_setImageWithURL:[NSURL URLWithString:data.imgurl]];
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
        
        switch (indexPath.row) {
            case 0:
            {
                cell2.textField.text = data.name;
                WeakSelf
                [[cell2.textField rac_textSignal]subscribeNext:^(id x) {
                   data.name = x;
                    arrM[indexPath.section] = data;
                    weakSelf.dataModel.classify = arrM;
                }];
            }
                break;
            case 2:
            {
                cell2.textField.text = data.title;
                WeakSelf
                [[cell2.textField rac_textSignal]subscribeNext:^(id x) {
                    data.title = x;
                    arrM[indexPath.section] = data;
                    weakSelf.dataModel.classify = arrM;
                }];
            }
                break;
                
            default:
                break;
        }
//        [self operationWithCell:cell2 Indexpath:indexPath];
//}
        
        
        
    }
    if ([model.type isEqualToString:@"3"]) {
        BaseType3TableViewCell* cell3 = (BaseType3TableViewCell*)cell;
        cell3.titleL.text = model.title;
        cell3.textView.text = data.desc;
        WeakSelf
        [cell3 setReturnTextBlock:^(NSString * _Nonnull string) {
            data.desc = string;
            arrM[indexPath.section] = data;
            weakSelf.dataModel.classify = arrM;
        }];
    }
    cell.selectionStyle = 0;
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 1;
//}
//-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"分类%ld",section+1];
//}
-(void)back
{
    if (self.returnRuestData) {
        _returnRuestData(self.dataModel);
    }
    [self.navigationController popViewControllerAnimated:NO];
}


@end
