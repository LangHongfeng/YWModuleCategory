//
//  UIView+Extebsion.h
//  WeiBo
//
//  Created by 韩盼盼 on 15/4/1.
//  Copyright (c) 2015年 韩盼盼. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>




@interface UIView (Extebsion)
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGPoint origin;




- (void)topAdd:(CGFloat)add;
- (void)leftAdd:(CGFloat)add;
- (void)widthAdd:(CGFloat)add;
- (void)heightAdd:(CGFloat)add;

+(void)showAlertMsg:(NSString *)message andShowBgColor:(UIColor *)bgColor andLabelTectColor:(UIColor *)textColor;
+(void)showAlertMsg:(NSString *)message;
+(UIImage*) createImageWithColor:(UIColor*) color;



/**
 *  @brief   cell 自适应 宽度设置
 */
+ (CGFloat)cellContentViewWith;

//
//// each makeToast method creates a view and displays it as toast
//- (void)makeToast:(NSString *)message;
//- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position;
//- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title;
//- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title image:(UIImage *)image;
//- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position image:(UIImage *)image;
//
//// displays toast with an activity spinner
//- (void)makeToastActivity;
//- (void)makeToastActivity:(id)position;
//- (void)hideToastActivity;
//
//// the showToast methods display any view as toast
//- (void)showToast:(UIView *)toast;
//- (void)showToast:(UIView *)toast duration:(CGFloat)interval position:(id)point;
//
//- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH;
//


@end
