//
//  ViewController.m
//  Demo
//
//  Created by apple on 2019/3/20.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "ViewController.h"
#import "WZPopView.h"
#import "HttpTools.h"
#import "Tools.h"
#import "BlockViewController.h"
#import <SJBaseVideoPlayer/SJBaseVideoPlayer+PlayStatus.h>
#import "SJVideoPlayer.h"
#import "CoverFlowLayout.h"

@interface ViewController ()<UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(nonatomic,copy)NSString*token;
@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, strong) SJVideoPlayer *player;
@property (nonatomic, strong) UICollectionView *collectionView;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CoverFlowLayout *layout=[[CoverFlowLayout alloc]init];
    CGFloat margin = 20;
    //创建layout
    layout.minimumInteritemSpacing=margin;
    layout.sectionInset=UIEdgeInsetsMake(margin, margin, margin, margin);
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.height =350;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:15 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    });
    QMUIButton*button = [[QMUIButton alloc]init];
//    button.imagePosition  =
    [self setupTimer];
}

- (void)setupTimer
{
    [self invalidateTimer]; // 创建定时器前先停止定时器，不然会出现僵尸定时器，导致轮播频率错误
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)invalidateTimer
{
    [_timer invalidate];
    _timer = nil;
}
- (void)automaticScroll
{
    int currentIndex = [self currentIndex];
    int targetIndex = currentIndex + 1;
    [self scrollToIndex:targetIndex];
}

- (void)scrollToIndex:(int)targetIndex
{
    if (targetIndex >= 30) {
            targetIndex = 15;
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        return;
    }
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];

}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([self currentIndex]>30) {
       [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:15 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    if ([self currentIndex]<=0) {
         [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:15 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    
}

- (int)currentIndex
{
    NSLog(@"%f",_collectionView.contentOffset.x);
    
    int index = 0;
        index = (_collectionView.contentOffset.x + kScreenWidth * 0.5) /300;
    return MAX(0, index);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (IBAction)popviewfromeBottom:(id)sender {
//    WZPopView*popview = [[WZPopView alloc]initWithFrame:ScreenBound];
//    popview.dataArr =<# @[@"选项1",@"选项2",@"选项3",@"选项4"]#>;
//
//    [popview setReturnBackSelectindex:^(NSInteger index){
//
//    }];
//    UIWindow *win =[UIApplication sharedApplication].keyWindow;
//    [win addSubview:popview];
//    // 显示底部视图
//    [popview showOrHidden];
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
//
//    for (NSInteger i = 0; i < 10; i++) {
//
//        dispatch_async(concurrentQueue, ^{
//
//            NSLog(@"%zd",i);
//        });
//    }
//
//    dispatch_barrier_async(concurrentQueue, ^{
//
//        NSLog(@"barrier");
//    });
//
//    for (NSInteger i = 10; i < 20; i++) {
//
//        dispatch_sync(concurrentQueue, ^{
//
//            NSLog(@"%zd",i);
//        });
//    }
    [self barrier];
    
//    dispatch_queue_t serialQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
//
//    NSLog(@"1");
//
//    dispatch_async(serialQueue, ^{
//
//        NSLog(@"2");
//    });
//    sleep(2);
//    NSLog(@"3");
//
//    dispatch_sync(serialQueue, ^{
//
//        NSLog(@"4");
//    });
//
//    NSLog(@"5");
}

/**
 * 栅栏方法 dispatch_barrier_async
 */
- (void)barrier {
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_barrier_async(queue, ^{
        // 追加任务 barrier
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        // 追加任务4
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
}
//普通借口
- (IBAction)pt:(id)sender {
    NSDictionary*parameters = @{@"username":@"13906488619",@"pwd":@"654321"};
    NSString*url = @"http://api.yzykx.com/rest/member/login";
    [HttpTools postJsonFromURLString:url andParameters:parameters success:^(id json) {
        if ([json[@"status"] isEqualToString:@"success"]) {
            
        }
        else
        {
            [Tools showMessaage:json[@"msg"]];
        }
    } fail:^{
        
    }];
    

 
    

}

//上传图片
- (IBAction)updateImage:(id)sender {
    NSDictionary*parameters = @{@"":@""};
    NSString*url = @"";
    UIImage*image = [UIImage imageNamed:@"image.jpg"];
    [HttpTools postJsonInfoFromURLString:url andParameters:parameters WithQImag:image success:^(id json) {
    } failBlock:^(NSHTTPURLResponse *resopse) {
        
    }];
    
}

- (IBAction)blockstart:(id)sender {
//    BlockViewController*vc = [[BlockViewController alloc]init];
//    [self presentViewController:vc animated:YES completion:^{
//    }];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
////    dispatch_async(dispatch_get_main_queue(),^{
////        NSLog(@"3");
////        NSLog(@"4");
//        sleep(2);
//        NSLog(@"5");
//        NSLog(@"6");
//    });
//    NSLog(@"1");
//    NSLog(@"2");
    
    [self loadManyMovie];
}
-(void)goDoSomethingLongAndInvolved
{
    NSLog(@"hahhahaha");
}

- (void)serialSync {
    // 1.创建一个串行队列
    /**
     参数1:队列的表示符号，一般是公司的域名倒写
     参数2:队列的类型
     DISPATCH_QUEUE_SERIAL 串行队列
     DISPATCH_QUEUE_CONCURRENT 并发队列
     */
    dispatch_queue_t serialQuene = dispatch_queue_create("com.baidu", DISPATCH_QUEUE_SERIAL);
    
    // 创建任务
    void (^task1) () = ^() {
        NSLog(@"task1---%@", [NSThread currentThread]);
    };
    
    void (^task2) () = ^() {
        NSLog(@"task2---%@", [NSThread currentThread]);
    };
    
    void (^task3) () = ^() {
        NSLog(@"task3---%@", [NSThread currentThread]);
    };
    
    // 添加任务到队列,同步方法执行
    dispatch_sync(serialQuene, task1);
    dispatch_sync(serialQuene, task2);
    dispatch_sync(serialQuene, task3);
}


- (void)loadManyMovie {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"%@", [NSThread currentThread]);
        // 1.登录，同步在当前线程里面工作
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            
            NSLog(@"登录了---%@", [NSThread currentThread]);
            sleep(3);
            
        });
        
        // 2.同时下载三部电影()
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"正在下载第一个电影---%@", [NSThread currentThread]);
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"正在下载第二个电影---%@", [NSThread currentThread]);
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"正在下载第三个电影---%@", [NSThread currentThread]);
        });
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"计算机将在三秒后关闭---%@", [NSThread currentThread]);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"关机了---%@", [NSThread currentThread]);
            });
        });
        
    });
    
}
@end
