//
//  DemonstrationViewController.m
//  Demo
//
//  Created by apple on 2019/4/12.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "DemonstrationViewController.h"
#import "BaseItemSectionModel.h"
#import "WZPopView.h"
#import "MOFSPickerManager.h"
#import "ZZQAvatarPicker.h"
#import "InvoiceQianMingViewController.h"
#import "MoreImageUpDateViewController.h"
#import "VoiceAnnouncementViewController.h"
#import "SpeechViewController.h"
#import "GPUImageDemoViewController.h"
#import "WZCameraViewController.h"
#import "StartViewController.h"
#import "SearchScreenViewController.h"
@interface DemonstrationViewController ()<QMUITableViewDelegate,QMUITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *sections;
@end

@implementation DemonstrationViewController
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
    
    BaseWordItemModel*item1 = [BaseWordItemModel itemWithTitle:@"条件选择" subTitle:@"传递数组选择"];
    
    BaseWordItemModel*item2 = [BaseWordItemModel itemWithTitle:@"城市选择" subTitle:@"省市区三级联动"];

    BaseWordItemModel*item3 = [BaseWordItemModel itemWithTitle:@"日期选择" subTitle:@"日期选择器"];

    BaseWordItemModel*item4= [BaseWordItemModel itemWithTitle:@"搜索加筛选" subTitle:@"收货地址"];
    item4.destVc = [SearchScreenViewController class];
    BaseItemSectionModel*section1 = [BaseItemSectionModel sectionWithItems:@[item1,item2,item3,item4] andHeaderTitle:@"弹出框"];
    
    
    [self.sections addObject:section1];

     BaseWordItemModel*item5 = [BaseWordItemModel itemWithTitle:@"单张上传" subTitle:@"上传单张"];
   
    BaseWordItemModel*item6 = [BaseWordItemModel itemWithTitle:@"多张上传" subTitle:@""];
    item6.destVc = [MoreImageUpDateViewController class];

    BaseWordItemModel*item7 = [BaseWordItemModel itemWithTitle:@"手写签名" subTitle:@""];
    item7.destVc = [InvoiceQianMingViewController class];

    BaseWordItemModel*item8 = [BaseWordItemModel itemWithTitle:@"星级评价" subTitle:@""];
    item8.destVc = [StartViewController class];
    
    BaseWordItemModel*item9 = [BaseWordItemModel itemWithTitle:@"图片处理GPUImage" subTitle:@"滤镜磨皮等。。"];
    item9.destVc = [GPUImageDemoViewController class];
    
    BaseWordItemModel*item10 = [BaseWordItemModel itemWithTitle:@"相机" subTitle:@"滤镜磨皮等。。"];
    item10.destVc = [WZCameraViewController class];
    
    BaseItemSectionModel*section2 = [BaseItemSectionModel sectionWithItems:@[item5,item6,item7,item8,item9,item10] andHeaderTitle:@"图片"];
    [self.sections addObject:section2];
    
    
    BaseWordItemModel*item12 = [BaseWordItemModel itemWithTitle:@"分段选择" subTitle:@"上传单张"];
    BaseWordItemModel*item13 = [BaseWordItemModel itemWithTitle:@"选择按钮" subTitle:@"上传单张"];
    BaseWordItemModel*item14 = [BaseWordItemModel itemWithTitle:@"" subTitle:@"上传单张"];
   
//    BaseWordItemModel*item15 = [BaseWordItemModel itemWithTitle:@"单张上传" subTitle:@"上传单张"];
//    BaseWordItemModel*item16 = [BaseWordItemModel itemWithTitle:@"单张上传" subTitle:@"上传单张"];
    BaseItemSectionModel*section3 = [BaseItemSectionModel sectionWithItems:@[item12,item13,item14] andHeaderTitle:@"按钮"];
    [self.sections addObject:section3];

    BaseWordItemModel*item20 = [BaseWordItemModel itemWithTitle:@"语音播报" subTitle:@""];
    item20.destVc = [VoiceAnnouncementViewController class];
    BaseWordItemModel*item21 = [BaseWordItemModel itemWithTitle:@"语音识别" subTitle:@""];
    item21.destVc = [SpeechViewController class];
    BaseItemSectionModel*section4 = [BaseItemSectionModel sectionWithItems:@[item20,item21] andHeaderTitle:@"语音"];
    [self.sections addObject:section4];
    
    BaseWordItemModel*item30 = [BaseWordItemModel itemWithTitle:@"pop动画" subTitle:@""];
    item20.destVc = [VoiceAnnouncementViewController class];
    BaseWordItemModel*item31 = [BaseWordItemModel itemWithTitle:@"Cor" subTitle:@""];
    item21.destVc = [SpeechViewController class];
    BaseItemSectionModel*section5 = [BaseItemSectionModel sectionWithItems:@[item30,item31] andHeaderTitle:@"动画"];
    [self.sections addObject:section5];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BaseItemSectionModel*sectionItem = _sections[section];
    if (sectionItem.hiddenSection) {
        return 0;
    }
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
//-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    BaseItemSectionModel*sectionItem = _sections[section];
//
//    return sectionItem.headerTitle;
//}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton*view = [UIButton new];
    view.backgroundColor = WZColor(235, 235, 235);
    view.tag = 1000+section;
    [view addTarget:self action:@selector(showOrHidden:) forControlEvents:UIControlEventTouchUpInside];
    BaseItemSectionModel*sectionItem = _sections[section];
    UILabel*titleLabel = [Tools createLabelWithTextColor:[UIColor grayColor] Font:[UIFont systemFontOfSize:13] TextAlignment:NSTextAlignmentLeft];
    titleLabel.frame = CGRectMake(20, 0, 80, 44);
    titleLabel.text= sectionItem.headerTitle;
    [view addSubview:titleLabel];
    return view;
}
-(void)showOrHidden:(UIButton*)btn
{
    NSInteger section = btn.tag-1000;
//只保留一个
//    for (BaseItemSectionModel*sectionItem in _sections) {
//        if (sectionItem != _sections[section]) {
//            sectionItem.hiddenSection = NO;
//        }
//        else
//        {
//            sectionItem.hiddenSection = !sectionItem.hiddenSection;
//        }
//    }
    BaseItemSectionModel*sectionItem =_sections[section];
    sectionItem.hiddenSection = !sectionItem.hiddenSection;
    [self.tableView reloadData];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QMUITableViewCell*cell = [tableView cellForRowAtIndexPath:indexPath];
    BaseItemSectionModel*sectionItem =_sections[indexPath.section];
    BaseWordItemModel*item = sectionItem.items[indexPath.row];
    if (indexPath.section == 0) {
    switch (indexPath.row) {
        case 0:{
            WZPopView*popview = [[WZPopView alloc]initWithFrame:ScreenBound];
            NSArray*arr =@[@"选项1",@"选项2",@"选项3",@"选项4"];
            popview.dataArr = arr;
            [popview setReturnBackSelectindex:^(NSInteger index){
                cell.detailTextLabel.text =arr[index];
            }];
            UIWindow *win =[UIApplication sharedApplication].keyWindow;
            [win addSubview:popview];
            [popview showOrHidden];
        }
            break;
        case 1:
        {
            [[MOFSPickerManager shareManger] showMOFSAddressPickerWithDefaultZipcode:@"" title:@"" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString * _Nullable address, NSString * _Nullable zipcode) {
                NSLog(@"%@", zipcode);
                NSArray * array = [address componentsSeparatedByString:@"-"];//以“,”切割
                if (array.count>2) {
                    NSString* province = array[0];
                    NSString*city = array[1];
                    NSString*district = array[2];
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@%@",province,city,district];
                }
            } cancelBlock:^{
            }];
        }
            break;
        case 2:
        {
            [[MOFSPickerManager shareManger]showDatePickerWithTag:1 firstDate:[NSDate date] minDate:[NSDate dateWithString:@"1949-01-01" format:@"yyyy-mm-dd"] maxDate:[NSDate date] datePickerMode:1 commitBlock:^(NSDate * _Nonnull date) {
                cell.detailTextLabel.text = [date stringWithFormat:@"yyyy-mm-dd"];
            } cancelBlock:^{
            }];
        }
            break;
        case 3:
        {
            BaseViewController*vc =  [[item.destVc alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
    }
    if (indexPath.section == 1) {

        switch (indexPath.row) {
            case 0:
            {
                //单张上传
//                __weak typeof(self) weakSelf = self;
//                __strong typeof(self) strongSelf = weakSelf;

                [ZZQAvatarPicker startSelected:^(UIImage * _Nonnull image) {
                    if (image) {
                        cell.imageView.image = image;
                    }
                }];
            }
                break;
            case 1:
            {
                //多张上传
                MoreImageUpDateViewController*vc = [[MoreImageUpDateViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                
                break;
            case 2:
            {
                //手写签名
                InvoiceQianMingViewController*vc = [[InvoiceQianMingViewController alloc]init];
                [vc setReturnImage:^(UIImage *image) {
                    
                }];
                [self.navigationController pushViewController:vc animated:NO];
            }
                
                break;
            default:
            {
                BaseViewController*vc =  [[item.destVc alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
        }
    }
    if (indexPath.section == 3) {

   BaseViewController*vc =  [[item.destVc alloc]init];
        
   [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
