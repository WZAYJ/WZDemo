//
//  AssmblSetViewController.m
//  Demo
//
//  Created by apple on 2019/5/16.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssmblSetViewController.h"
#import "ZZQAvatarPicker.h"
@interface AssmblSetViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV1;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextField *textField5;
@property (weak, nonatomic) IBOutlet UITextField *textField6;

@end

@implementation AssmblSetViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑信息";
    self.view.backgroundColor = ColorLine;
    
     self.textField1.text = self.dataModel.title;
     self.textField2.text = self.dataModel.name;
     self.textField3.text =self.dataModel.englishName;
    self.textField4.text =self.dataModel.wx;
    self.textField5.text =self.dataModel.gwurl;
    self.textField6.text =self.dataModel.tel;
    [self.imageV1 setImageWithURL:[NSURL URLWithString:self.dataModel.imgurl] options:0];
}



- (IBAction)chooseImage:(id)sender {
    
    [self.view endEditing:YES];
    __weak typeof(self) weakSelf = self;
    [ZZQAvatarPicker startSelected:^(UIImage * _Nonnull image) {
        if (image) {
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf.imageV1 setImage:image];
        }
    }];
}

-(void)back
{
    if (self.returnRuestData) {
        self.dataModel.title =self.textField1.text;
        self.dataModel.name =self.textField2.text;
        self.dataModel.englishName =self.textField3.text;
        self.dataModel.wx =self.textField4.text;
        self.dataModel.gwurl =self.textField5.text;
        self.dataModel.tel =self.textField6.text;
    
        _returnRuestData(self.dataModel);
        
    }
    [self.navigationController popViewControllerAnimated:NO];
}


@end
