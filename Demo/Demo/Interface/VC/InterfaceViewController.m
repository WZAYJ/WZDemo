//
//  InterfaceViewController.m
//  Demo
//
//  Created by apple on 2019/4/15.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "InterfaceViewController.h"
#import "BaseItemSectionModel.h"
#import "CommentViewController.h"
@interface InterfaceViewController ()<QMUITableViewDelegate,QMUITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *sections;

@end

@implementation InterfaceViewController
-(NSMutableArray *)sections
{
    if (!_sections) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =WZColor(240, 240, 240);
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [UIView new];
    BaseWordItemModel*item1 = [BaseWordItemModel itemWithTitle:@"评论" subTitle:@""];
//    BaseWordItemModel*item2 = [BaseWordItemModel itemWithTitle:@"城市选择" subTitle:@"省市区三级联动"];
//
//    BaseWordItemModel*item3 = [BaseWordItemModel itemWithTitle:@"日期选择" subTitle:@"日期选择器"];
//
//    BaseWordItemModel*item4= [BaseWordItemModel itemWithTitle:@"侧滑筛选" subTitle:@"日期选择器"];
    item1.destVc = [CommentViewController class];
    BaseItemSectionModel*section1 = [BaseItemSectionModel sectionWithItems:@[item1] andHeaderTitle:@"商城"];
    [self.sections addObject:section1];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BaseItemSectionModel*sectionItem = _sections[section];
    return sectionItem.items.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseItemSectionModel*sectionItem = _sections[indexPath.section];
    
    BaseWordItemModel*item = sectionItem.items[indexPath.row];
    
    QMUITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"QMUITableViewCell"];
    if (!cell) {
        cell = [[QMUITableViewCell alloc]initWithStyle:1 reuseIdentifier:@"QMUITableViewCell"];
    }
    cell.selectionStyle = 0;
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.subTitle;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    BaseItemSectionModel*sectionItem = _sections[section];
    
    return sectionItem.headerTitle;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseItemSectionModel*sectionItem =_sections[indexPath.section];
    BaseWordItemModel*item = sectionItem.items[indexPath.row];
    BaseViewController*vc =  [[item.destVc alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
