//
//  HttpTools.m
//  FisherPaykel
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 TanSi. All rights reserved.
//

#import "HttpTools.h"
@interface HttpTools ()

@property(nonatomic,strong)AFHTTPSessionManager*manager;

@end
@implementation HttpTools




+(void)postJsonFromURLString:(NSString *)urlString andParameters:(NSDictionary *)params success:(void(^)(id json))success fail:(void(^)(void))fail{

    AFHTTPSessionManager*manager = [[AFHTTPSessionManager alloc] init];

    [manager POST:urlString
            parameters:params
              progress:^(NSProgress * _Nonnull uploadProgress) {
        
               }
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
               success(responseObject);
               }
               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   
                fail();
                   
               }];
    
}
+(void)postJsonInfoFromURLString:(NSString *)urlString andParameters:(NSDictionary *)params WithQImag:(UIImage *)image success:(void(^)(id json))success  failBlock:(void (^)(NSHTTPURLResponse *))failBlock
{
    //
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
            NSData* data = UIImageJPEGRepresentation(image, 0.8);
            [formData appendPartWithFileData:data name:@"billFile" fileName:[NSString stringWithFormat:@"image.jpg"] mimeType:@"image/png"];
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


//+(void)postJsonInfoFromURLString:(NSString *)urlString andParameters:(NSDictionary *)params  WithImageArr:(NSArray *)images WithQImag:(UIImage *)Qimage success:(void(^)(id json))success  failBlock:(void (^)(NSHTTPURLResponse *))failBlock
//{
//    // j 用来确定何时全部上传成功
//    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
//    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//
//    [manager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        for (int i = 0; i < images.count; i++) {
//            UIImage*image = images[i];
//            NSData* data = UIImageJPEGRepresentation(image, 0.8);
//            [formData appendPartWithFileData:data name:@"billFile" fileName:[NSString stringWithFormat:@"fujian%d.jpg",i] mimeType:@"image/png"];
//        }
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        success(responseObject);
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
//
//
//
//}


@end
