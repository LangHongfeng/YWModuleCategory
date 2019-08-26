//
//  NSString+encrypto.h
//  ShopTypeProject
//
//  Created by 韩盼盼 on 16/8/8.
//  Copyright © 2016年 Hanley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (encrypto)
- (NSString *) md5;
- (NSString *) sha1;
+ (NSString *)MD5_sha1:(NSString *)str;
+ (NSString *)Sign_Splice:(NSArray *)valueArr;

+ (NSString *)ImageWithbase64:(NSData *)image;
+ (NSString *)typeForImageData:(NSData *)data;
+ (NSString *)returnNumSign;

/** 手机号 验证*/
+ (BOOL)isMobileNumber_str:(NSString *)mobileNum;

/**身份证 验证*/
+ (BOOL)verifyIDCardNumber:(NSString *)value;

/** 判断是否包含*/

+ (BOOL) judgeRange:(NSArray*) _termArray Password:(NSString*) _password;
/** 条件*/

+ (NSString*) judgePasswordStrength:(NSString*) _password;


/** 数组、字典对象转JSONObject*/
+(NSString *)stringWithJSONObject:(id)obj;


@end

