//
//  UIView+BGFrame
//  AIFCore
//
//  Created by yintengxiang on 14-1-27.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "UIView+BGFrame.h"

#import "SDAutoLayout.h"

#define YW_ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

#define YW_ADPT YW_ScreenWidth / 750.0

#define YW_FONT(SIZE) [UIFont systemFontOfSize:SIZE * YW_ADPT]

#define YW_RatioADPX(with) ((with) * YW_ADPT)

#define YW_ScreenHeight [[UIScreen mainScreen] bounds].size.height


@implementation UIView (BGFrame)

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGSize)size{
    return self.frame.size;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)setRight:(CGFloat)right;
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)point
{
    CGRect frame = self.frame;
    frame.origin = point;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)setAddTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y += top;
    self.frame = frame;
}

- (void)setAddLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x += left;
    self.frame = frame;
}


+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

//圆角
+(void)getRoundIcon:(id)sender borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor  cornerRadius:(float)cornerRadius
{
    UIView *view = (UIView *)sender;
    
    if (borderWidth < .5) {
        borderWidth = .5;
    }
    
    view.layer.borderWidth = borderWidth;
    view.layer.cornerRadius = cornerRadius;
    view.layer.borderColor = borderColor.CGColor;
    view.layer.masksToBounds = YES;
}

//圆角阴影
+(void)getRoundIcon:(id)sender borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor  cornerRadius:(float)cornerRadius offset:(CGSize)size layerName:(NSString *)name
{
    UIView *view = (UIView *)sender;
    //
    //    CALayer *sublayer=[CALayer layer]; //初始化层
    //    sublayer.frame = view.frame;
    //    sublayer.backgroundColor=[UIColor whiteColor].CGColor;//设定层的背景色
    //    sublayer.cornerRadius=cornerRadius;//设定层的圆角效果
    //    //设置层的阴影效果----
    //    sublayer.shadowOffset=CGSizeMake(0, 0); //阴影的位置
    //    sublayer.shadowRadius=cornerRadius;//阴影的圆角
    //    sublayer.shadowColor=[UIColor blackColor].CGColor; //阴影的颜色
    //    sublayer.shadowOpacity=0.3;//阴影的透明度
    //    sublayer.name = name;
    //    sublayer.contentsScale = 0.9;
    ////    [view.layer addSublayer:sublayer];
    //    [view.superview.layer insertSublayer:sublayer below:view.layer];
    //    [view.layer insertSublayer:sublayer atIndex:0];
    
    
    //加阴影--任海丽编辑
    //    view.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    //    view.layer.shadowOffset = CGSizeMake(4,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    //    view.layer.shadowRadius = cornerRadius;//阴影半径，默认3
    //    view.layer.cornerRadius = cornerRadius;//设定层的圆角效果
    //    view.layer.shadowOpacity = .8;
    
    
    //圆角
    view.layer.masksToBounds = NO;
    //阴影
    view.layer.shadowColor = [[UIColor blackColor] CGColor];
    view.layer.shadowOffset = CGSizeMake(0, 0); //[水平偏移, 垂直偏移]
    view.layer.shadowOpacity = .3; // 0.0 ~ 1.0 的值
    view.layer.shadowRadius = 5; // 阴影发散的程度
}

+(void)getHalfRoundIcon:(UIView *)view bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii];
    
    // 初始化一个CAShapeLayer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = rect;
    // 将曲线路径设置为layer的路径
    maskLayer.path = path.CGPath;
    
    //    NSLog(@"view.mask ::: %@",view.layer.mask);
    if (view.layer.mask) {
        [view.layer.mask removeFromSuperlayer];
    }
    
    // 设置控件的mask为CAShapeLayer
    view.layer.mask = maskLayer;
    
}



+(void)showHUDView:(NSString *)msg
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 3.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [msg sizeWithFont:YW_FONT(30) constrainedToSize:CGSizeMake(290, 9000)];
    
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = YW_FONT(30);
    [showview addSubview:label];
    showview.frame = CGRectMake((YW_ScreenWidth - LabelSize.width - 20)/2, (YW_ScreenHeight - LabelSize.height-10)/2+YW_RatioADPX(200), LabelSize.width+20, LabelSize.height+10);
    [UIView animateWithDuration:3.0 animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}

+ (void)TranslucentWithImageView:(UIImageView *)bgImgView {
    /**
     iOS7.0
     毛玻璃的样式(枚举)
     UIBarStyleDefault          = 0,
     UIBarStyleBlack            = 1,
     UIBarStyleBlackOpaque      = 1, // Deprecated. Use UIBarStyleBlack
     UIBarStyleBlackTranslucent = 2, // Deprecated. Use UIBarStyleBlack and set the translucent property to YES
     */
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    //    toolbar.frame = (CGRect){0, 0, bgImgView.wh, bgImgView.height};
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    [bgImgView addSubview:toolbar];
    toolbar.sd_layout.leftSpaceToView(bgImgView, 0).rightSpaceToView(bgImgView, 0).topSpaceToView(bgImgView, 0).bottomSpaceToView(bgImgView, 0);
//    toolbar.whc_LeftSpace(0).whc_RightSpace(0).whc_TopSpace(0).whc_BottomSpace(0);
}


@end
