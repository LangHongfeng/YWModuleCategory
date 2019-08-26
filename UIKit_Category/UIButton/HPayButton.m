//
//  HPayButton.m
//  MiaoguoVideoProTest
//
//  Created by 韩盼盼 on 2017/12/23.
//  Copyright © 2017年 HG. All rights reserved.
//

#import "HPayButton.h"

@interface HPayButton()
@property (nonatomic,strong) NSTimer *drawCircletimer;
@property (nonatomic,strong) CAShapeLayer *waitingShapeLayer;
@end

@implementation HPayButton


//支付中
-(void)excuting
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    [self setTitle:@"正在支付..." forState:UIControlStateNormal];
    self.userInteractionEnabled = NO;
    // 添加定时器
    [self addTimer];
}

#pragma mark 添加定时器
-(void)addTimer
{
    self.drawCircletimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(drawCircleAnimation) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.drawCircletimer forMode:NSRunLoopCommonModes];
}

#pragma mark  取消定时器
-(void)cancel
{
    [self.drawCircletimer timeInterval];
    self.drawCircletimer = nil;
}

-(void)drawCircleAnimation
{
    if (self.waitingShapeLayer == nil) {
        [self createRaitineShapeLayer];
    }
    
    if (self.waitingShapeLayer.strokeEnd<1) {
        self.waitingShapeLayer.strokeEnd += 0.1;
    }
    
    if (self.waitingShapeLayer.strokeEnd >= 0.6) {
        self.waitingShapeLayer.strokeStart += 0.1;
    }
    
    if (self.waitingShapeLayer.strokeStart >= 1) {
        [_waitingShapeLayer removeFromSuperlayer];
        _waitingShapeLayer = nil;
        [self createRaitineShapeLayer];
    }
    
    
}

-(void)createRaitineShapeLayer
{
    _waitingShapeLayer = [CAShapeLayer layer];
    _waitingShapeLayer.fillColor = [UIColor clearColor].CGColor;
    //设置线条的宽度和颜色
    _waitingShapeLayer.lineWidth = 1.5f;
    _waitingShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    _waitingShapeLayer.strokeStart = 0;
    _waitingShapeLayer.strokeEnd = 0;
    
    //圆圈的路径
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(20, 20) radius:10 startAngle:M_PI*3 /2 endAngle:M_PI *7 /2 clockwise:YES];
    circlePath.lineCapStyle = kCGLineCapRound;//线条拐角
    circlePath.lineJoinStyle = kCGLineCapRound;//线条拐角
    _waitingShapeLayer.path = circlePath.CGPath;
    [self.layer addSublayer:_waitingShapeLayer];

}


@end
