//
//  NSString+DisplayTime.h
//  iOS-Category
//
//  Created by 庄BB的MacBook on 16/7/20.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DisplayTime)

//通过时间戳计算时间差（几小时前、几天前）
//+ (NSString *) compareCurrentTime:(NSTimeInterval) compareDate;
+(NSString *) compareCurrentTime:(NSDate*) compareDate;

//通过时间戳得出显示时间
+ (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp;

//通过时间戳和格式显示时间
+ (NSString *) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;

+(NSString *)getMMSSFromSS:(NSString *)totalTime;

/** 获取时间戳 （几小时前、几天前） */
+ (NSString *)timeIntervalFromLastTime:(NSString *)lastTime andIsExceedTime:(BOOL)IsExceedTime;
+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime andIsExceedTime:(BOOL)IsExceedTime;


@end
