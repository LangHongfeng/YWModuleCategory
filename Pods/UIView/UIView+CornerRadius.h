//
//  UIView+CornerRadius.h
//  UIViewTest
//
//  Created by Artron_LQQ on 16/2/20.
//  Copyright © 2016年 Artup. All rights reserved.
//
/**
 *  @author LQQ, 16-02-20 23:02:40
 *
 *  github地址:https://github.com/LQQZYY/UIViewCornerDemo
 *
 *  喜欢的话就给颗星支持一下,感谢!
 *
 *
 */

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,UILayoutCornerRadiusType) {
    UILayoutCornerRadiusTop    = 0,
    UILayoutCornerRadiusLeft   = 1,
    UILayoutCornerRadiusBottom = 2,
    UILayoutCornerRadiusRight  = 3,
    UILayoutCornerRadiusAll    = 4,
};

@interface UIView (CornerRadius)

/**
 *  @author
 *
 *  设置不同边的圆角
 *
 *  @param sideType 圆角类型
 *  @param cornerRadius 圆角半径
 */
- (void)UILayoutCornerRadiusType:(UILayoutCornerRadiusType)sideType withCornerRadius:(CGFloat)cornerRadius;

/*
 *videoURL:视频地址(本地/网络)
 *time      :第N帧
 */
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;
@end
