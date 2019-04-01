//
//  HttpTools.h
//  FisherPaykel
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 TanSi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface HttpTools : NSObject
+(void)postJsonFromURLString:(NSString *)urlString andParameters:(NSDictionary *)params success:(void(^)(id json))success fail:(void(^)(void))fail;

+(void)postJsonInfoFromURLString:(NSString *)urlString andParameters:(NSDictionary *)params WithQImag:(UIImage *)image success:(void(^)(id json))success  failBlock:(void (^)(NSHTTPURLResponse *))failBlock;
//
//+(void)postJsonInfoFromURLString:(NSString *)urlString andParameters:(NSDictionary *)params  WithImageArr:(NSArray *)images WithQImag:(UIImage *)Qimage success:(void(^)(id json))success  failBlock:(void (^)(NSHTTPURLResponse *))failBlock;
@end
