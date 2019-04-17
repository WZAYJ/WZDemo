//
//  BaseTabBarViewController.m
//  Demo
//
//  Created by apple on 2019/4/11.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "AssemblyViewController.h"
#import "BaseNavigationController.h"
#import "DemonstrationViewController.h"
#import "InterfaceViewController.h"
@implementation BaseTabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubVC];
    UITabBar*tabbarView = [[UITabBar alloc]initWithFrame:self.tabBar.bounds];
    [self setValue:tabbarView forKey:@"tabBar"];
}
- (void)addSubVC{
    DemonstrationViewController *vc1 = [[DemonstrationViewController alloc]init];
    [self addChildViewController:vc1 title:@"演示" image:@"icon_home_02" selImage:@"icon_home_01"];
    AssemblyViewController *vc2 = [[AssemblyViewController alloc]init];
    [self addChildViewController:vc2 title:@"组件" image:@"icon_find_02" selImage:@"icon_find_01"];
    InterfaceViewController *vc3 = [[InterfaceViewController alloc]init];
    [self addChildViewController:vc3 title:@"界面" image:@"icon_publish" selImage:@"icon_publish"];
    AssemblyViewController *vc4 = [[AssemblyViewController alloc]init];
    [self addChildViewController:vc4 title:@"作品" image:@"icon_works_02" selImage:@"icon_works_01"];
    AssemblyViewController*vc5 = [[AssemblyViewController alloc]init];
    [self addChildViewController:vc5 title:@"我的" image:@"icon_user_02" selImage:@"icon_user_01"];
    
}

#pragma mark - 添加子控制器
-(void)addChildViewController:(UIViewController *)childVc  title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage {
    static NSInteger index = 0;
    //设置子控制器的TabBarButton属性
    childVc.tabBarItem.title = title;
    childVc.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.tag = index;
//    if (index == 2) {
//        childVc.tabBarItem.title= @"";
//        childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
//    }
    index++;
    //让子控制器包装一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}
@end
