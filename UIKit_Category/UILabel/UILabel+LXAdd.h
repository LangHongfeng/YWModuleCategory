//
//  UILabel+LXAdd.h
//  LXLabelDemo
//
//  Created by 刘鑫 on 16/4/13.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LXAdd)
/**
 *  字间距
 */
@property (nonatomic,assign)CGFloat characterSpace;

/**
 *  行间距
 */
@property (nonatomic,assign)CGFloat lineSpace;

/**
 *  关键字
 */
@property (nonatomic,copy)NSString *keywords;
@property (nonatomic,strong)UIFont *keywordsFont;
@property (nonatomic,strong)UIColor *keywordsColor;

/**
 *  下划线
 */
@property (nonatomic,copy)NSString *underlineStr;
@property (nonatomic,strong)UIColor *underlineColor;

/**
 *  中划线
 */
@property (nonatomic,copy)NSString *cencerlineStr;
@property (nonatomic,strong)UIColor *cencerlineColor;

/**
 *  计算label宽高，必须调用
 *
 *  @param maxWidth 最大宽度
 *
 *  @return label的rect
 */
- (CGRect)getLableHeightWithMaxWidth:(CGFloat)maxWidth;

+(CGFloat)getLableHeight:(UILabel *)label;

-(void)alignTop;

/**
 * 中划线
 */
+(NSMutableAttributedString *)cencerlineStrAttribute:(NSString *)cencerstr;


//设置不同字体颜色
-(void)setTextColor:(UILabel *)label FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor;

@end
