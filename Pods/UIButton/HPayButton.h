//
//  HPayButton.h
//  MiaoguoVideoProTest
//
//  Created by 韩盼盼 on 2017/12/23.
//  Copyright © 2017年 HG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPayButton : UIButton
@property (nonatomic,copy) void(^paySuccessBlock)(void);
@property (nonatomic,copy) void(^payFailBlock)(void);

//支付成功 画v 动画
-(void)paySuccess;

//自定义失败的原因文字
-(void)payFail:(NSString *)failStr;

//支付失败 x 动画
-(void)payFailBlock:(void(^)(void))resultBlock;

//支付中  画圈动画
-(void)excuting;
@end
