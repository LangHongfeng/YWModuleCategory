//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (Category)

+ (NSString *)weekDayStr:(NSString *)dateStr;

+ (int)weekDayWithInt:(NSString *)dateStr;

+ (NSArray *)getDatesWithStartDate:(NSString *)startDate endDate:(NSString *)endDate;

+(NSString *)filterHTML:(NSString *)html;
//电话号码中间4位****显示
+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum;

//银行卡号中间8位**** ****显示
+ (NSString*) getSecrectStringWithAccountNo:(NSString*)accountNo;

//计算文字高度
- (CGFloat   ) heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;

/**抹除运费小数末尾的0*/
- (NSString *) removeUnwantedZero;

//去掉前后空格
- (NSString *) trimmedString;


+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW;

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+(NSString *)FirstCharactor:(NSString *)pString;

+(NSString *)distanceString:(NSString *)distanceStr;

+ (NSString *)getRandomNumber:(int)from to:(int)to;




- (CGFloat)stringHeight:(NSString *)content constrainedWidth:(CGFloat)width font:(UIFont *)font;


- (CGFloat)stringWidth:(NSString *)content constrainedHeight:(CGFloat)Height font:(UIFont *)font;


+(NSMutableAttributedString *)stringToContent:(NSString *)content font:(UIFont *)font color:(UIColor *)color;

+(NSMutableAttributedString *)stringToContent:(NSString *)content font:(UIFont *)font color:(UIColor *)color linespacing:(float)linespacing;

+(NSMutableAttributedString *)stringToContent:(NSString *)content font:(UIFont *)font color:(UIColor *)color linespacing:(float)linespacing textAlinment:(NSTextAlignment)aligment;


+ (NSAttributedString *)getAttributeWith:(id)sender
                                  string:(NSString *)string
                               orginFont:(UIFont *)orginFont
                              orginColor:(UIColor *)orginColor
                           attributeFont:(UIFont *)attributeFont
                          attributeColor:(UIColor *)attributeColor;

#pragma mark - 获取这个字符串中的所有xxx的所在的index
+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText;

/**
 
 改变字符串里面包含的所有相同字符串的的颜色和字号
 @param FontColorDict @{@"defaultColor":@"",@"SelectColor":@"",@"defaultFont":@"",@"selectFont":@""}
 @param linespacing 行间距
 @param totalString 整个字符串
 @param subArray 需要改变字符串的数组
 */
+ (NSMutableAttributedString *)yw_changeTotalString:(NSString *)totalString AndDict:(NSDictionary *)FontColorDict linespacing:(float)linespacing  SubStringArray:(NSArray *)subArray;

+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice;

+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice andTitle:(NSString *)title;

+(NSMutableAttributedString *)getOldPriceAttribute:(NSString *)oldPrice;

+(NSString *)countNumAndChangeformat:(NSString *)num;

/**现金*/
+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice andPriceFontSize:(float)size;

+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice andPriceFontSize:(float)size andColor:(UIColor *)color;
+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice andPriceFontSize:(float)size andColor:(UIColor *)color
                                            andCha:(float)cha;

/**佣金百分比*/
+(NSMutableAttributedString *)getNowPercent:(NSString *)percent andPriceFontSize:(float)size;

@end


@interface NSString (Base64)
//Data类型转换为Base64
+ (NSString *)base64StringFromData:(NSData *)data length:(NSUInteger)length;
@end


@interface NSString (Format)
//转为电话格式
+ (NSString*) stringMobileFormat:(NSString*)mobile;

//数组中文格式（几万）可自行添加
+ (NSString*) stringChineseFormat:(double)value;
@end
