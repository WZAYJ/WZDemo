//
//  Tools.h
//  TeYouDianCustomClient
//
//  Created by baixunios on 17/4/13.
//  Copyright © 2017年 BaiXun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define WZSpace 15

#define WZSetValue(v,k) [[NSUserDefaults standardUserDefaults]setObject:v forKey:k]

#define WZGetValue(k) [[NSUserDefaults standardUserDefaults] objectForKey:k]

#define WZRemoveValue(k)     [[NSUserDefaults standardUserDefaults]removeObjectForKey:k]
@interface Tools : NSObject


+ (UIView *)getMainView;
//验证手机号是否合法
+ (BOOL) validateMobile:(NSString *)mobile;

//密码
+ (BOOL) validatePassword:(NSString *)passWord;

//邮箱
//+ (BOOL) validateEmail:(NSString *)email;

//昵称
+ (BOOL) validateNickname:(NSString *)nickname;

//用户名
+ (BOOL) validateUserName:(NSString *)name;
//字符串编码转换
+(NSString *)changeUrlToUTF:(NSString *)nurl;

//计算文件大小
+(long long)fileSizeAtPath:(NSString*) filePath;

//计算文件夹大小
+(float) folderSizeAtPath:(NSString*) folderPath;

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

//有效银行卡号验证
+ (BOOL) isValidCreditNumber:(NSString*)value;

//打电话
+(void)callPhone:(NSString *)phoneNumber;

//跳转网页
+(void)jumpWebWithUrl:(NSString*)url;
//自定义navagition item

/**
 通过 url 返回图片
 
 @param url 传输的 url
 
 @return 返回的图片
 */
//+ (UIImage *)returnWithUrl:(NSString *)url;


/**
 比较两个时间大小
 
 @param firstTime      输入的第一个时间
 @param timeOneFormat 第一个时间格式
 @param twoTime       第二个时间
 @param timeTwoFormat 第二个时间格式
 
 @return 返回比较结果
 */
+(BOOL)compareTimeWtiFirstTime:(NSString *)firstTime
                 timeOneFormat:(NSString *)timeOneFormat
                       twoTime:(NSString *)twoTime
                 timeTwoFormat:(NSString *)timeTwoFormat;
/**
 解析本地json文件
 */

+ (NSArray *)readLocalFileWithName:(NSString *)name;

/**
获取当前时间
*/
+(NSDateComponents*)getCurrentTime;

//图像识别
+(void)imageRecognitionWithImage:(UIImage*)image success:(void(^)(id json))success fail:(void(^)(void))fail;

+ (void)showMessaage:(NSString*)str;

+ (void)showTextOnly:(NSString *)msg;
+ (void)showAlert:(NSString *) message;

/**
数组转换成json字符串 */
+(NSString*)getStringWithModelArr:(NSArray*)array;

@end
