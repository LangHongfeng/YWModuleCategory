//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import "NSString+Category.h"
#import "NSString+Predicate.h"

//校验字符串
#define YW_IsAvailableString(_ref)   (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]) && ([_ref isKindOfClass:[NSString class]]) && (_ref.length > 0) && (![_ref isEqualToString:@"<null>"]) && (![_ref isEqualToString:@"(null)"]))

//获取屏幕宽高
#define YW_ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

#define YW_ADPT YW_ScreenWidth / 750.0

//根据ip6的屏幕来拉伸 px
#define YW_RatioADPX(with) ((with) * YW_ADPT)

#define YW_PFHeFont(SIZE) [UIFont fontWithName:@"PingFangSC-Semibold" size:SIZE * YW_ADPT]

#define YW_rgba(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@implementation NSString (Category)


+ (NSString *)weekDayStr:(NSString *)dateStr
{
    
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    // 1）自定义方法
    //NSDate -> NSString
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    NSInteger weekday= [calendar component:NSCalendarUnitWeekday fromDate:date];
    NSString *weekdaystring = @"";
    switch (weekday) {
        case 1:
            weekdaystring = @"星期天";
            break;
        case 2:
            weekdaystring = @"星期一";
            break;
        case 3:
            weekdaystring = @"星期二";
            break;
        case 4:
            weekdaystring = @"星期三";
            break;
        case 5:
            weekdaystring = @"星期四";
            break;
        case 6:
            weekdaystring = @"星期五";
            break;
        case 7:
            weekdaystring = @"星期六";
            break;
        default:
            break;
    }
    return weekdaystring;
}


+ (int)weekDayWithInt:(NSString *)dateStr
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    // 1）自定义方法
    //NSDate -> NSString
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    NSInteger weekday= [calendar component:NSCalendarUnitWeekday fromDate:date];
    return (int)weekday - 1;
}

+ (NSArray *)getDatesWithStartDate:(NSString *)startDate endDate:(NSString *)endDate
{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];

    //字符串转时间
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    matter.dateFormat = @"yyyy-MM-dd";

    NSDate *start = [matter dateFromString:startDate];
    NSDate *end = [matter dateFromString:endDate];
    
    NSMutableArray *componentAarray = [NSMutableArray array];
    NSComparisonResult result = [start compare:end];
    NSDateComponents *comps;
    while (result != NSOrderedDescending) {
        comps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |  NSCalendarUnitWeekday fromDate:start];
        [componentAarray addObject:start];
        
        //后一天
        [comps setDay:([comps day]+1)];
        start = [calendar dateFromComponents:comps];
        
        //对比日期大小
        result = [start compare:end];
    }
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSDate *itemdate in componentAarray) {
        //字符串转时间
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"yyyy-MM-dd";
        [df setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8*3600]];
        
        [tempArr addObject:[df stringFromDate:itemdate]];
    }
    
    
    return tempArr;
}



+(NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        [scanner scanUpToString:@"<" intoString:nil];
        [scanner scanUpToString:@">" intoString:&text];
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    return html;
}

+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum
{
    NSMutableString *newStr = [NSMutableString stringWithString:phoneNum];
    NSRange range = NSMakeRange(3, 4);
    [newStr replaceCharactersInRange:range withString:@"****"];
    return newStr;
}
+ (NSString*) getSecrectStringWithAccountNo:(NSString*)accountNo
{
    NSMutableString *newStr = [NSMutableString stringWithString:accountNo];
    NSRange range = NSMakeRange(4, 8);
    if (newStr.length>12) {
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    return newStr;
    
}

-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

/*抹除运费小数末尾的0*/
- (NSString *)removeUnwantedZero {
    if ([[self substringWithRange:NSMakeRange(self.length- 3, 3)] isEqualToString:@"000"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-4)]; // 多一个小数点
    } else if ([[self substringWithRange:NSMakeRange(self.length- 2, 2)] isEqualToString:@"00"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-2)];
    } else if ([[self substringWithRange:NSMakeRange(self.length- 1, 1)] isEqualToString:@"0"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-1)];
    } else {
        return self;
    }
}

//去掉前后空格
- (NSString *)trimmedString{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

+ (NSString*) stringMobileFormat:(NSString *)mobile {
    if ([mobile isValidMobileNumber]) {
        NSMutableString* value = [[NSMutableString alloc] initWithString:mobile];
        [value insertString:@" " atIndex:3];
        [value insertString:@" " atIndex:8];
        return value;
    }
    
    return nil;
}

+(NSString *)distanceString:(NSString *)distanceStr
{
    float distance = [distanceStr floatValue];
    if (distance > 100) {
        return [NSString stringWithFormat:@"%.2fKm",distance / 1000];
    }else
    {
        return [NSString stringWithFormat:@"%.fm",distance];
    }
    
    return @"";
}


+ (NSString*) stringChineseFormat:(double)value{
    
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.0f亿",value/100000000];
    }
    else if (value / 10000 >= 1 && value / 100000000 < 1) {
        return [NSString stringWithFormat:@"%.0f万",value/10000];
    }
    else {
        return [NSString stringWithFormat:@"%.0f",value];
    }
    
}

/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param text 待计算的字符串
 @param font 字体的大小
 @param  maxW 限制字符串显示区域的宽度
 @result CGSize 返回的高度
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]= font;
    CGSize maxSize=CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}



//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+(NSString *)FirstCharactor:(NSString *)pString
{
    //转成了可变字符串
    NSMutableString *pStr = [NSMutableString stringWithString:pString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)pStr,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)pStr,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pPinYin = [pStr capitalizedString];
    //获取并返回首字母
    return [pPinYin substringToIndex:1];
    
}

//获取[1,6]的随机数

+ (NSString *)getRandomNumber:(int)from to:(int)to
{
    return [NSString stringWithFormat:@"%d",((int) from + (arc4random() % (to - from + 1)))];
}




- (CGFloat)stringHeight:(NSString *)content constrainedWidth:(CGFloat)width font:(UIFont *)font{
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    CGSize contentSize = [content sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT)];
#pragma clang diagnostic pop
    return contentSize.height;
}


- (CGFloat)stringWidth:(NSString *)content constrainedHeight:(CGFloat)Height font:(UIFont *)font{
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    CGSize contentSize = [content sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
#pragma clang diagnostic pop
    return contentSize.width;
}

+(NSMutableAttributedString *)stringToContent:(NSString *)content font:(UIFont *)font color:(UIColor *)color
{
    if (!YW_IsAvailableString(content)) {
        return [[NSMutableAttributedString alloc] initWithString:@" "];;
    }
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:content];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 10 * YW_ADPT;
    [string addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
    [string addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    [string addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length)];
    
    
    return string;
}

+(NSMutableAttributedString *)stringToContent:(NSString *)content font:(UIFont *)font color:(UIColor *)color linespacing:(float)linespacing
{
    if (!YW_IsAvailableString(content)) {
        return [[NSMutableAttributedString alloc] initWithString:@" "];;
    }
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:content];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = linespacing;
    [string addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
    [string addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    [string addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length)];
    
    
    return string;
}

+(NSMutableAttributedString *)stringToContent:(NSString *)content font:(UIFont *)font color:(UIColor *)color linespacing:(float)linespacing textAlinment:(NSTextAlignment)aligment
{
    if (!YW_IsAvailableString(content)) {
        return [[NSMutableAttributedString alloc] initWithString:@" "];;
    }
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:content];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = linespacing;
    style.alignment = aligment;
    [string addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
    [string addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    [string addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length)];
    
    
    return string;
}



+ (NSAttributedString *)getAttributeWith:(id)sender
                                  string:(NSString *)string
                               orginFont:(UIFont *)orginFont
                              orginColor:(UIColor *)orginColor
                           attributeFont:(UIFont *)attributeFont
                          attributeColor:(UIColor *)attributeColor
{
    __block  NSMutableAttributedString *totalStr = [[NSMutableAttributedString alloc] initWithString:string];
    [totalStr addAttribute:NSFontAttributeName value:orginFont range:NSMakeRange(0, string.length)];
    [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColor range:NSMakeRange(0, string.length)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = YW_RatioADPX(10);
    [totalStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
    
    if ([sender isKindOfClass:[NSArray class]]) {
        
        __block NSString *oringinStr = string;
        __weak typeof(self) weakSelf = self;
        [sender enumerateObjectsUsingBlock:^(NSString *  _Nonnull str, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSRange range = [oringinStr rangeOfString:str];
            [totalStr addAttribute:NSFontAttributeName value:attributeFont range:range];
            [totalStr addAttribute:NSForegroundColorAttributeName value:orginColor range:range];
            oringinStr = [oringinStr stringByReplacingCharactersInRange:range withString:[weakSelf getStringWithRange:range]];
        }];
        
    }else if ([sender isKindOfClass:[NSString class]]) {
        
        NSRange range = [string rangeOfString:sender];
        
        [totalStr addAttribute:NSFontAttributeName value:attributeFont range:range];
        [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColor range:range];
    }
    return totalStr;
}

+ (NSString *)getStringWithRange:(NSRange)range
{
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < range.length ; i++) {
        [string appendString:@" "];
    }
    return string;
}




#pragma mark - 获取这个字符串中的所有xxx的所在的index
+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText
{
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:3];
    if (findText == nil && [findText isEqualToString:@""])
    {
        return nil;
    }
    
    NSRange rang = [text rangeOfString:findText]; //获取第一次出现的range
    if (rang.location != NSNotFound && rang.length != 0)
    {
        [arrayRanges addObject:[NSNumber numberWithInteger:rang.location]];//将第一次的加入到数组中
        NSRange rang1 = {0,0};
        NSInteger location = 0;
        NSInteger length = 0;
        for (int i = 0;; i++)
        {
            if (0 == i)
            {//去掉这个xxx
                location = rang.location + rang.length;
                length = text.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            }
            else
            {
                location = rang1.location + rang1.length;
                length = text.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location, length);
            }
            
            //在一个range范围内查找另一个字符串的range
            rang1 = [text rangeOfString:findText options:NSCaseInsensitiveSearch range:rang1];
            if (rang1.location == NSNotFound && rang1.length == 0)
            {
                break;
            }
            else//添加符合条件的location进数组
                [arrayRanges addObject:[NSNumber numberWithInteger:rang1.location]];
        }
        return arrayRanges;
    }
    return nil;
}


/**
 
 改变字符串里面包含的所有相同字符串的的颜色和字号
 @param FontColorDict @{@"defaultColor":@"",@"SelectColor":@"",@"defaultFont":@"",@"selectFont":@""}
 @param linespacing 行间距
 @param totalString 整个字符串
 @param subArray 需要改变字符串的数组
 */
+ (NSMutableAttributedString *)yw_changeTotalString:(NSString *)totalString AndDict:(NSDictionary *)FontColorDict linespacing:(float)linespacing  SubStringArray:(NSArray *)subArray
{
    
    UIColor *default_color = [FontColorDict objectForKey:@"defaultColor"];
    UIColor *select_color = [FontColorDict objectForKey:@"SelectColor"];
    UIFont *defaule_font =  [FontColorDict objectForKey:@"defaultFont"];
    UIFont *select_font =  [FontColorDict objectForKey:@"selectFont"];
    

    
    NSArray *result = [subArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = linespacing;
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attributedStr.length)];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attributedStr.length)];
    [attributedStr addAttribute:NSFontAttributeName value:defaule_font range:NSMakeRange(0, attributedStr.length)];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:default_color range:NSMakeRange(0, attributedStr.length)];
    
    for (int index=0; index<result.count; index++) {
        NSString *cstrTemp = result[index];
        NSMutableArray *locationArr = [self getRangeStr:totalString findText:cstrTemp];
        for (int i=0; i<locationArr.count; i++) {
            NSNumber *location = locationArr[i];
            NSRange rang =NSMakeRange(location.integerValue, cstrTemp.length);
            [attributedStr addAttribute:NSForegroundColorAttributeName value:select_color range:rang];
            [attributedStr addAttribute:NSFontAttributeName value:select_font range:rang];
        }
    }
    return attributedStr;
}

+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice
{
    NSRange range = [nowPrice rangeOfString:@"."];
    if (range.location != NSNotFound) {
        NSString *string = [NSString stringWithFormat:@"¥%.1f",[nowPrice floatValue]];
        NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont(24) color:YW_rgba(34, 34, 34, 1)];
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(36) range:NSMakeRange(1, range.location - 1)];
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(22) range:range];
        }
        
        return attribute;
    }else
    {
        NSString *string = [NSString stringWithFormat:@"¥%.1f",[nowPrice floatValue] / 100];
        NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont(24) color:YW_rgba(34, 34, 34, 1)];
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(36) range:NSMakeRange(1, range.location - 1)];
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(22) range:range];
        }
        
        return attribute;
    }
}

+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice andPriceFontSize:(float)size
{
    NSRange range = [nowPrice rangeOfString:@"."];
    if (range.location != NSNotFound) {
        NSString *string = [NSString stringWithFormat:@"¥%.1f",[nowPrice floatValue]];
        NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont(24) color:YW_rgba(34, 34, 34, 1)];
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(size) range:NSMakeRange(1, range.location - 1)];
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(22) range:range];
        }
        
        return attribute;
    }else
    {
        NSString *string = [NSString stringWithFormat:@"¥%.1f",[nowPrice floatValue] / 100];
        NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont(24) color:YW_rgba(240, 73, 73, 1)];
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(size) range:NSMakeRange(1, range.location - 1)];
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(22) range:range];
        }
        
        return attribute;
    }
}

+(NSMutableAttributedString *)getNowPercent:(NSString *)percent andPriceFontSize:(float)size
{
    NSString *string = [NSString stringWithFormat:@"佣金：%.1f%%",[percent floatValue]];
    
    NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont((size - 6)) color:YW_rgba(240, 73, 73, 1)];
    NSRange range = [string rangeOfString:@"."];
    if (range.location != NSNotFound) {
        [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(size) range:NSMakeRange(3, range.location - 3)];
        [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont((size - 8)) range:range];
    }
    
    return attribute;
}

+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice andTitle:(NSString *)title
{
    NSString *string = [NSString stringWithFormat:@"%@¥%.1f",title,[nowPrice floatValue] / 100];
    NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont(24) color:YW_rgba(34, 34, 34, 1)];
    NSRange range = [string rangeOfString:@"."];
    NSRange clipRange = [string rangeOfString:@"¥"];
    if (range.location != NSNotFound) {
        [attribute addAttribute:NSForegroundColorAttributeName value:YW_rgba(153, 153, 153, 1) range:NSMakeRange(0, clipRange.location)];
        [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(36) range:NSMakeRange(clipRange.location + clipRange.length, range.location - (clipRange.location + clipRange.length))];
        [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(22) range:range];
    }
    
    return attribute;
}

+(NSMutableAttributedString *)getOldPriceAttribute:(NSString *)oldPrice
{
    NSString *string = [NSString stringWithFormat:@"¥%.2f",[oldPrice floatValue] / 100];
    NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont(20) color:YW_rgba(153, 153, 153, 1)];
    [attribute addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, string.length)];
    [attribute addAttribute:NSStrikethroughColorAttributeName value:YW_rgba(153, 153, 153, 1) range:NSMakeRange(0, string.length)];
    
    return attribute;
}

+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice andPriceFontSize:(float)size andColor:(UIColor *)color
{
    NSRange range = [nowPrice rangeOfString:@"."];
    if (range.location != NSNotFound) {
        NSString *string = [NSString stringWithFormat:@"¥%.1f",[nowPrice floatValue]];
        NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont((size - 12)) color:color];
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(size) range:NSMakeRange(1, range.location - 1)];
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont((size - 14)) range:range];
        }
        
        return attribute;
    }else
    {
        NSString *string = [NSString stringWithFormat:@"¥%.1f",[nowPrice floatValue] / 100];
        NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont((size - 12)) color:color];
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(size) range:NSMakeRange(1, range.location - 1)];
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont((size - 14)) range:range];
        }
        
        return attribute;
    }
}

+(NSMutableAttributedString *)getNowPriceAttribute:(NSString *)nowPrice andPriceFontSize:(float)size andColor:(UIColor *)color
                                            andCha:(float)cha
{
    NSRange range = [nowPrice rangeOfString:@"."];
    if (range.location != NSNotFound) {
        NSString *string = [NSString stringWithFormat:@"¥%.1f",[nowPrice floatValue]];
        NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont((size - cha)) color:color];
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(size) range:NSMakeRange(1, range.location - 1)];
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont((size - cha - 2)) range:range];
        }
        
        return attribute;
    }else
    {
        NSString *string = [NSString stringWithFormat:@"¥%.1f",[nowPrice floatValue] / 100];
        NSMutableAttributedString *attribute = [NSString stringToContent:string font:YW_PFHeFont((size - cha)) color:color];
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont(size) range:NSMakeRange(1, range.location - 1)];
            [attribute addAttribute:NSFontAttributeName value:YW_PFHeFont((size - cha - 2)) range:range];
        }
        
        return attribute;
    }
}


//金钱每三位加一个逗号
+(NSString *)countNumAndChangeformat:(NSString *)num
{
    if([num rangeOfString:@"."].location != NSNotFound)  {
        NSString *losttotal = [NSString stringWithFormat:@"%.2f",[num floatValue]];//小数点后只保留两位
        NSArray *array = [losttotal componentsSeparatedByString:@"."];
        //小数点前:array[0]
        //小数点后:array[1]
        int count = 0;
        num = array[0];
        long long int a = num.longLongValue;
        while (a != 0)
        {
            count++;
            a /= 10;
        }
        NSMutableString *string = [NSMutableString stringWithString:num];
        NSMutableString *newstring = [NSMutableString string];
        while (count > 3) {
            count -= 3;
            NSRange rang = NSMakeRange(string.length - 3, 3);
            NSString *str = [string substringWithRange:rang];
            [newstring insertString:str atIndex:0];
            [newstring insertString:@"," atIndex:0];
            [string deleteCharactersInRange:rang];
        }
        [newstring insertString:string atIndex:0];
        NSMutableString *newString = [NSMutableString string];
        newString =[NSMutableString stringWithFormat:@"%@.%@",newstring,array[1]];
        return newString;
    }else {
        int count = 0;
        long long int a = num.longLongValue;
        while (a != 0)
        {
            count++;
            a /= 10;
        }
        NSMutableString *string = [NSMutableString stringWithString:num];
        NSMutableString *newstring = [NSMutableString string];
        while (count > 3) {
            count -= 3;
            NSRange rang = NSMakeRange(string.length - 3, 3);
            NSString *str = [string substringWithRange:rang];
            [newstring insertString:str atIndex:0];
            [newstring insertString:@"," atIndex:0];
            [string deleteCharactersInRange:rang];
        }
        [newstring insertString:string atIndex:0];
        return newstring;
    }
}

@end







static char base64EncodingTable[64] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};

@implementation NSString (Base64)

+ (NSString *)base64StringFromData:(NSData *)data length:(NSUInteger)length {
    unsigned long ixtext, lentext;
    long ctremaining;
    unsigned char input[3], output[4];
    short i, charsonline = 0, ctcopy;
    const unsigned char *raw;
    NSMutableString *result;
    
    lentext = [data length];
    if (lentext < 1) {
        return @"";
    }
    result = [NSMutableString stringWithCapacity: lentext];
    raw = [data bytes];
    ixtext = 0;
    
    while (true) {
        ctremaining = lentext - ixtext;
        if (ctremaining <= 0) {
            break;
        }
        for (i = 0; i < 3; i++) {
            unsigned long ix = ixtext + i;
            if (ix < lentext) {
                input[i] = raw[ix];
            }
            else {
                input[i] = 0;
            }
        }
        output[0] = (input[0] & 0xFC) >> 2;
        output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
        output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
        output[3] = input[2] & 0x3F;
        ctcopy = 4;
        switch (ctremaining) {
            case 1:
                ctcopy = 2;
                break;
            case 2:
                ctcopy = 3;
                break;
        }
        
        for (i = 0; i < ctcopy; i++) {
            [result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
        }
        
        for (i = ctcopy; i < 4; i++) {
            [result appendString: @"="];
        }
        
        ixtext += 3;
        charsonline += 4;
        
        if ((length > 0) && (charsonline >= length)) {
            charsonline = 0;
        }
    }     
    return result;
}

@end


@implementation NSString (Format)




@end
