//
//  UILabel+LXAdd.m
//  LXLabelDemo
//
//  Created by 刘鑫 on 16/4/13.
//  Copyright © 2016年 liuxin. All rights reserved.
//
#import "UILabel+LXAdd.h"
#import <objc/runtime.h>
#import <CoreText/CoreText.h>
#import "UIView+BGFrame.h"


@implementation UILabel (LXAdd)

-(CGFloat)characterSpace{
   return [objc_getAssociatedObject(self,_cmd) floatValue];
}

-(void)setCharacterSpace:(CGFloat)characterSpace{
    objc_setAssociatedObject(self, @selector(characterSpace), @(characterSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(CGFloat)lineSpace{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

-(void)setLineSpace:(CGFloat)lineSpace{
    objc_setAssociatedObject(self, @selector(lineSpace), @(lineSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSString *)keywords{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setKeywords:(NSString *)keywords{
    objc_setAssociatedObject(self, @selector(keywords), keywords, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIFont *)keywordsFont{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setKeywordsFont:(UIFont *)keywordsFont{
    objc_setAssociatedObject(self, @selector(keywordsFont), keywordsFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)keywordsColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setKeywordsColor:(UIColor *)keywordsColor{
    objc_setAssociatedObject(self, @selector(keywordsColor), keywordsColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)underlineStr{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnderlineStr:(NSString *)underlineStr{
    objc_setAssociatedObject(self, @selector(underlineStr), underlineStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

-(UIColor *)underlineColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnderlineColor:(UIColor *)underlineColor{
    objc_setAssociatedObject(self, @selector(underlineColor), underlineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}


-(NSString *)cencerlineStr{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCencerlineStr:(NSString *)cencerlineStr{
    objc_setAssociatedObject(self, @selector(cencerlineStr), cencerlineStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(UIColor *)cencerlineColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCencerlineColor:(UIColor *)cencerlineColor{
    objc_setAssociatedObject(self, @selector(cencerlineColor), cencerlineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}


/**
 *  根据最大宽度计算label宽，高
 *
 *  @param maxWidth 最大宽度
 *
 *  @return rect
 */
- (CGRect)getLableHeightWithMaxWidth:(CGFloat)maxWidth{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0,self.text.length)];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    // 行间距
    if(self.lineSpace > 0){
        [paragraphStyle setLineSpacing:self.lineSpace];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,self.text.length)];
    }
    
    // 字间距
    if(self.characterSpace > 0){
        long number = self.characterSpace;
        CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
        [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedString length])];
        
        CFRelease(num);
    }
    
    //关键字
    if (self.keywords) {
        NSRange itemRange = [self.text rangeOfString:self.keywords];
        if (self.keywordsFont) {
            [attributedString addAttribute:NSFontAttributeName value:self.keywordsFont range:itemRange];
            
        }
        
        if (self.keywordsColor) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:self.keywordsColor range:itemRange];
            
        }
    }
    
    //下划线
    if (self.underlineStr) {
        NSRange itemRange = [self.text rangeOfString:self.underlineStr];
        [attributedString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:itemRange];
        if (self.underlineColor) {
            [attributedString addAttribute:NSUnderlineColorAttributeName value:self.underlineColor range:itemRange];
        }
    }
    
    //中划线
    if (self.cencerlineStr) {
        NSRange itemRange = [self.text rangeOfString:self.cencerlineStr];
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle) range:itemRange];
        if (self.cencerlineColor) {
            [attributedString addAttribute:NSStrikethroughStyleAttributeName value:self.cencerlineColor range:itemRange];
        }
    }

    
    self.attributedText = attributedString;
    
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return rect;
}


+(CGFloat)getLableHeight:(UILabel *)label
{
    NSDictionary *dic = @{NSFontAttributeName:label.font};
    CGSize sizeToFit = [label.text boundingRectWithSize:CGSizeMake(label.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return sizeToFit.height;
}

-(void)alignTop
{
    // 对应字号的字体一行显示所占宽高
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    // 多行所占 height*line
    double height = fontSize.height*self.numberOfLines;
    // 显示范围实际宽度
    double width = self.frame.size.width;
    // 对应字号的内容实际所占范围
    CGSize stringSize = [self.text boundingRectWithSize:CGSizeMake(width, height) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.font} context:nil].size;
    // 剩余空行
    NSInteger line = (height - stringSize.height) / fontSize.height;
    // 用回车补齐
    for (int i = 0; i < line; i++) {
        
        self.text = [self.text stringByAppendingString:@"\n "];
    }
}

+(NSMutableAttributedString *)cencerlineStrAttribute:(NSString *)cencerstr
{
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:cencerstr attributes:attribtDic];
    return attribtStr;
}



//设置不同字体颜色
-(void)setTextColor:(UILabel *)label FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    
    label.attributedText = str;
}

@end
