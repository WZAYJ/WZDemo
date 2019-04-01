//
//  Tools.m
//  TeYouDianCustomClient
//
//  Created by baixunios on 17/4/13.
//  Copyright © 2017年 BaiXun. All rights reserved.
//

#import "Tools.h"

#define WZFont(a) [UIFont systemFontOfSize:a]
#define SYSTEM_VERSION_LESS_THAN(v)                                            \
([[[UIDevice currentDevice] systemVersion] compare:v                         \
options:NSNumericSearch] ==       \
NSOrderedAscending)

@implementation Tools
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile{
    //手机号以13，17，15，18开头，八个 \d 数字字符
    
    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:mobile];
}

//密码
+ (BOOL) validatePassword:(NSString *)passWord{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

//用户名
+ (BOOL) validateUserName:(NSString *)name{
    NSString *regi=@"^[\u4E00-\u9FFF]+$";
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regi];
    BOOL a=[pre evaluateWithObject:name];
    if (a==YES) {
        return a;
    }
    NSString *userNameRegex = @"^[A-Za-z]+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
    
}
//昵称
+ (BOOL) validateNickname:(NSString *)nickname{
    
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

// 判断是否有效银行卡号
+ (BOOL) isValidCreditNumber:(NSString*)value {
    BOOL result = NO;
    NSInteger length = [value length];
    if (length >= 13) {
        result = [self isValidNumber:value];
        if (result)
        {
            int sum = 0;
            int digit = 0;
            int addend = 0;
            BOOL timesTwo = false;
            for (NSInteger i = value.length - 1; i >= 0; i--)
            {
                digit = [value characterAtIndex:i] - '0';
                if (timesTwo) {
                    addend = digit * 2;
                    if (addend > 9) {
                        addend -= 9;
                    }
                } else {
                    addend = digit;
                }
                sum += addend;
                timesTwo = !timesTwo;
            }
            int modulus = sum % 10;
            return modulus == 0;
        }
        
    }else {
        
        result = FALSE;
        
    }
    return result;
}

// 是否是纯数字
+ (BOOL)isValidNumber:(NSString*)value{
    NSString* num = @"^[0-9]+$";
    NSPredicate *regextestnum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", num];
    return [regextestnum evaluateWithObject:value];;
}

//计算文件大小
+(long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

//计算文件夹大小
+(float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath])
        return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}


//打电话
+(void)callPhone:(NSString *)phoneNumber {
    if (![phoneNumber isEqualToString:@""]) {
        NSString *phoneFormat = [NSString stringWithFormat:@"tel://%@",phoneNumber];
        if ([self supportCallPhone])
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString:phoneFormat]  options:nil completionHandler:nil];
//        [[UIApplication sharedApplication] openURL:phoneFormat options:nil completionHandler:nil];
        else {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"提示" message:@"您的设备不能打电话" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

+(BOOL)supportCallPhone {
    NSString *deviceType = [UIDevice currentDevice].model;
    if ([deviceType isEqualToString:@"iPod touch"]  || [deviceType isEqualToString:@"iPhone Simulator"] ) {
        return NO;
    }
    return YES;
}

//跳转网页
+(void)jumpWebWithUrl:(NSString*)url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:nil completionHandler:nil];

}
+(NSDateComponents*)getCurrentTime{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    return dateComponent;
}
//比较两个时间大小

+ (BOOL)compareTimeWtiFirstTime:(NSString *)firstTime
                  timeOneFormat:(NSString *)timeOneFormat
                        twoTime:(NSString *)twoTime
                  timeTwoFormat:(NSString *)timeTwoFormat{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:timeOneFormat];
    NSDate *timeOne = [formatter dateFromString:firstTime];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:timeTwoFormat];
    NSDate *timeTwoTemp = [dateFormatter dateFromString:twoTime];
    
    NSString *timeTwoStr=[formatter stringFromDate:timeTwoTemp];
    
    NSDate *timeTwo=[formatter dateFromString:timeTwoStr];
    
    NSCalendar*calendar=[NSCalendar currentCalendar];
    NSDateComponents*cmps=[calendar components:NSCalendarUnitMinute fromDate:timeOne toDate:timeTwo options:NSCalendarMatchStrictly];
    
    
    return (cmps.minute>0)?YES:NO;
}

// 读取本地JSON文件
+ (NSArray *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

+ (UIView *)getMainView {
    if (SYSTEM_VERSION_LESS_THAN(@"8.0")) {
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        if (!window)
            window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        return [window subviews].lastObject;
    } else {
        UIWindow *window =[[UIApplication sharedApplication] keyWindow];
        if (window == nil)
            window = [[[UIApplication sharedApplication] delegate] window];//#14
        return window;
    }
}

+ (void)showMessaage:(NSString*)str{
    UIView* view = [UIApplication sharedApplication].keyWindow;;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = str;
    hud.margin = 30.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
}

+ (void)showAlert:(NSString *) message{
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1.5f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}

+ (void)timerFireMethod:(NSTimer*)theTimer//弹出框
{
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];

    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
    
}


+(NSString*)getStringWithModelArr:(NSArray*)array
{
    NSMutableArray*arrM = [[NSMutableArray alloc]init];

    for (NSObject * model in array) {
        NSDictionary*dic= [model modelToJSONObject];
        [arrM addObject:dic];
    }
    NSError *parseError = nil;
    NSData *mdata = [NSJSONSerialization dataWithJSONObject:arrM options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString * string = [[NSString alloc] initWithData:mdata encoding:NSUTF8StringEncoding];

    return string;
}
@end
