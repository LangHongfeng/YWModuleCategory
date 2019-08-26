//
//  UIView+BGFrame
//  AIFCore
//
//  Created by yintengxiang on 14-1-27.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BGFrame)

//不用再蛋疼的写某view.frame=CGRectMake(x,y,z,o)了。
- (CGFloat)left;
- (CGFloat)right;

- (CGSize)size;
- (CGFloat)top;
- (CGFloat)bottom;
- (CGFloat)width;
- (CGFloat)height;
- (CGFloat)centerX;
- (CGFloat)centerY;
- (CGFloat)maxX;
- (CGFloat)maxY;

- (void)setLeft:(CGFloat)left;
- (void)setRight:(CGFloat)right;
- (void)setSize:(CGSize)size;
- (void)setTop:(CGFloat)top;
- (void)setBottom:(CGFloat)bottom;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)setOrigin:(CGPoint)point;
- (void)setAddTop:(CGFloat)top;
- (void)setAddLeft:(CGFloat)left;


+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 *  制作圆角
 */

+(void)getRoundIcon:(id)sender borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor  cornerRadius:(float)cornerRadius;

+(void)getRoundIcon:(id)sender borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor  cornerRadius:(float)cornerRadius offset:(CGSize)size layerName:(NSString *)name;


+(void)getHalfRoundIcon:(UIView *)view bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
+(void)showHUDView:(NSString *)msg;

/** 绘制毛玻璃效果*/
+ (void)TranslucentWithImageView:(UIImageView *)bgImgView;

@end
