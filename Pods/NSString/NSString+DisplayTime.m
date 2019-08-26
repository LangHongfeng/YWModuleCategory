//
//  NSString+DisplayTime.m
//  iOS-Category
//
//  Created by 庄BB的MacBook on 16/7/20.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import "NSString+DisplayTime.h"

@implementation NSString (DisplayTime)



+(NSString *) compareCurrentTime:(NSDate*) compareDate
{
    
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    timeInterval -=240;
    int temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%d分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%d小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%d天前",temp];
    }
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%d月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%d年前",temp];
    }
    return  result;
}
+ (NSString*) getDateStringWithTimestamp:(NSTimeInterval)timestamp
{
    NSDate *confromTimesp    = [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
    NSCalendar *calendar     = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags      = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:confromTimesp];
    NSInteger referenceYear  =referenceComponents.year;
    NSInteger referenceMonth =referenceComponents.month;
    NSInteger referenceDay   =referenceComponents.day;
    
    return [NSString stringWithFormat:@"%ld年%ld月%ld日",referenceYear,(long)referenceMonth,(long)referenceDay];
}



+ (NSString*) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter
{
    if ([NSString stringWithFormat:@"%@", @(timestamp)].length == 13) {
        timestamp /= 1000.0f;
    }
    NSDate*timestampDate=[NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSString *strDate = [dateFormatter stringFromDate:timestampDate];
    
    return strDate;
}



/**
 *  计算上次日期距离现在多久
 *
 *  @param lastTime    上次日期(需要和格式对应)
 *  @return xx分钟前、xx小时前、xx天前
 */
#define DATEFORMATTER @"yyyy-MM-dd HH:mm:ss"

+ (NSString *)timeIntervalFromLastTime:(NSString *)lastTime andIsExceedTime:(BOOL)IsExceedTime
{
    //上次时间
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc]init];
    dateFormatter1.dateFormat = DATEFORMATTER;
    NSDate *lastDate = [dateFormatter1 dateFromString:lastTime];
    //当前时间
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc]init];
    dateFormatter2.dateFormat = DATEFORMATTER;
    NSDate *currentDate = [dateFormatter2 dateFromString:[dateFormatter2 stringFromDate:[NSDate date]]];
    return [NSString timeIntervalFromLastTime:lastDate ToCurrentTime:currentDate andIsExceedTime:IsExceedTime];
}

+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime andIsExceedTime:(BOOL)IsExceedTime
{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    //上次时间
    NSDate *lastDate = [lastTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:lastTime]];
    //当前时间
    NSDate *currentDate = [currentTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:currentTime]];
    //时间间隔
    NSInteger intevalTime = [lastDate timeIntervalSinceReferenceDate] - [currentDate timeIntervalSinceReferenceDate];
    
    //秒、分、小时、天、月、年
    NSInteger minutes = intevalTime / 60;
    NSInteger hours = intevalTime / 60 / 60;
    NSInteger day = intevalTime / 60 / 60 / 24;
    NSInteger month = intevalTime / 60 / 60 / 24 / 30;
    NSInteger yers = intevalTime / 60 / 60 / 24 / 365;
    if (IsExceedTime) {
        return [NSString stringWithFormat: @"%ld小时",-(long)hours];
    }
    else
    {
        if (minutes <= 10) {
            return  @"刚刚";
        }else if (minutes < 60){
            return [NSString stringWithFormat: @"%ld分钟",(long)minutes];
        }else if(hours < 24)
        {
            return [NSString stringWithFormat: @"%ld小时",(long)hours];
        }
        else if (day < 30){
            return [NSString stringWithFormat: @"%ld天后",(long)day];
        }else if (month < 12){
            NSDateFormatter * df =[[NSDateFormatter alloc]init];
            df.dateFormat = @"M月d日";
            NSString * time = [df stringFromDate:lastDate];
            return time;
        }else if (yers >= 1){
            NSDateFormatter * df =[[NSDateFormatter alloc]init];
            df.dateFormat = @"yyyy年M月d日";
            NSString * time = [df stringFromDate:lastDate];
            return time;
        }
    }
    
    return @"";
}



@end
