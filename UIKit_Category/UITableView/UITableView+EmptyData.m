//
//  UITableView+EmptyData.m
//  BusinessEnterprise
//
//  Created by LHF on 16/10/20.
//  Copyright © 2016年 YiWang. All rights reserved.
//

#import "UITableView+EmptyData.h"

#import "SDAutoLayout.h"

#import "UIView+BGFrame.h"

#import <objc/runtime.h>

#define YW_ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

#define YW_ADPT YW_ScreenWidth / 750.0
//设置字体
#define kPFMeFont(SIZE) [UIFont fontWithName:@"PingFangSC-Medium" size:SIZE * YW_ADPT]
//设置颜色
#define YW_rgba(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//获取本地图片
#define kLocalImg(path) [UIImage imageNamed:path]

//根据ip6的屏幕来拉伸 px
#define YW_RatioADPX(with) ((with) * YW_ADPT)

@implementation UITableView (EmptyData)

static NSString *nameKey = @"nameKey";

/**
 没有发布动态:
 [tableView tableViewDisplayWitMsg:Localized(@"no_dynamic") ifNecessaryForRowCount:0 andNOImagename:nil hasImg:YES];
 没有记录
 [tableView tableViewDisplayWitMsg:Localized(@"no_record") ifNecessaryForRowCount:0 andNOImagename:nil hasImg:YES];
 没有评论
 [tableView tableViewDisplayWitMsg:Localized(@"no_comment") ifNecessaryForRowCount:0 andNOImagename:nil hasImg:YES];
 没有消息
 [tableView tableViewDisplayWitMsg:Localized(@"no_message") ifNecessaryForRowCount:0 andNOImagename:nil hasImg:YES];
 */

- (void)tableViewDisplayWitMsg:(NSString *) message
        ifNecessaryForRowCount:(NSUInteger) rowCount
                andNOImagename:(NSString *)imagenname
                        hasImg:(BOOL)hasImg
{
    if (rowCount == 0) {
        // Display a message when the table is empty
        // 没有数据的时候，UILabel的显示样式
        UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
        [bgView setBackgroundColor:[UIColor whiteColor]];
        UIImageView *imgView = [UIImageView new];
        [bgView addSubview:imgView];
        UIImage *pic = [UIImage imageNamed:imagenname];
        imgView.sd_layout.widthIs(pic.size.width)
        .heightIs(pic.size.height)
        .centerXEqualToView(bgView)
        .centerYEqualToView(bgView).offset(-20);
        imgView.image = pic;
        
        UILabel *messageLabel = [UILabel new];
        messageLabel.text = message;
        messageLabel.font = kPFMeFont(30);
        messageLabel.textColor = YW_rgba(153, 153, 153, 1);
        [bgView addSubview:messageLabel];
        messageLabel.sd_layout
        .centerXEqualToView(bgView)
        .topSpaceToView(imgView, YW_RatioADPX(60))
        .heightIs(YW_RatioADPX(30));
        
        [messageLabel setSingleLineAutoResizeWithMaxWidth:YW_RatioADPX(400)];
        
        messageLabel.textAlignment = NSTextAlignmentCenter;
        
        self.backgroundView = bgView;
        
        
    } else {
        self.backgroundView = nil;
    }
}

- (void)tableViewDisplayWitMsg:(NSString *) message
        ifNecessaryForRowCount:(NSUInteger) rowCount
                andNOImagename:(NSString *)imagenname
                        hasImg:(BOOL)hasImg
                      andBlock:(dispatch_block_t)block
{
    if (rowCount == 0) {
        
        self.block = block;
        
        // Display a message when the table is empty
        // 没有数据的时候，UILabel的显示样式
        UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
        [bgView setBackgroundColor:[UIColor whiteColor]];
        UIImageView *imgView = [UIImageView new];
        
        [bgView addSubview:imgView];
        UIImage *pic = kLocalImg(imagenname);
        imgView.sd_layout.widthIs(pic.size.width)
        .heightIs(pic.size.height)
        .centerXEqualToView(bgView)
        .centerYEqualToView(bgView).offset(- 140 * YW_ADPT);
        imgView.image = pic;
        
//        UIImageView *nodataImg = [UIImageView new];
//        [bgView addSubview:nodataImg];
//        UIImage *img = kLocalImg(imagenname);
//        nodataImg.sd_layout
//        .centerXEqualToView(bgView)
//        .centerYEqualToView(bgView).offset(- 60 * YW_ADPT)
//        .widthIs(img.size.width)
//        .heightIs(img.size.height);
        
        UILabel *messageLabel = [UILabel new];
        messageLabel.text = message;
        messageLabel.font = kPFMeFont(30);
        messageLabel.textColor = YW_rgba(153, 153, 153, 1);
        [bgView addSubview:messageLabel];
        messageLabel.sd_layout
        .centerXEqualToView(bgView)
        .topSpaceToView(imgView, YW_RatioADPX(60))
        .heightIs(YW_RatioADPX(30));
        
        [messageLabel setSingleLineAutoResizeWithMaxWidth:YW_RatioADPX(400)];
        
        messageLabel.textAlignment = NSTextAlignmentCenter;
        
        
        if ([message isEqualToString:@"你还没有进货单"]) {
            UIButton *goCarBtn = [UIButton new];
            [bgView addSubview:goCarBtn];
            goCarBtn.sd_layout
            .centerXEqualToView(bgView)
            .topSpaceToView(messageLabel, 187 * YW_ADPT)
            .widthIs(500 * YW_ADPT)
            .heightIs(90 * YW_ADPT);
            [UIView getRoundIcon:goCarBtn borderWidth:2 * YW_ADPT borderColor:YW_rgba(255, 112, 118, 1) cornerRadius:12 * YW_ADPT];
            [goCarBtn setTitle:@"前往选货" forState:UIControlStateNormal];
            goCarBtn.titleLabel.font = kPFMeFont(24);
            [goCarBtn setTitleColor:YW_rgba(255, 112, 118, 1) forState:UIControlStateNormal];
        }else if([message isEqualToString:@"暂无收货地址"])
        {
            UIButton *goCarBtn = [UIButton new];
            [bgView addSubview:goCarBtn];
            goCarBtn.sd_layout
            .centerXEqualToView(bgView)
            .topSpaceToView(messageLabel, 120 * YW_ADPT)
            .widthIs(690 * YW_ADPT)
            .heightIs(90 * YW_ADPT);
            [UIView getRoundIcon:goCarBtn borderWidth:2 * YW_ADPT borderColor:YW_rgba(255, 112, 118, 1) cornerRadius:12 * YW_ADPT];
            [goCarBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
            goCarBtn.titleLabel.font = kPFMeFont(36);
            [goCarBtn setTitleColor:YW_rgba(34, 34, 34, 1) forState:UIControlStateNormal];
            [goCarBtn setBackgroundColor:YW_rgba(255, 232, 0, 1)];
            [UIView getRoundIcon:goCarBtn borderWidth:.5 borderColor:[UIColor clearColor] cornerRadius:12 * YW_ADPT];
            [goCarBtn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
        }
        
        self.backgroundView = bgView;
        
        
    } else {
        self.backgroundView = nil;
    }
}

-(void)btnEvent
{
    if (self.block) {
        self.block();
    }
}

-(void)setBlock:(dispatch_block_t)block
{
    objc_setAssociatedObject(self, &nameKey, block, OBJC_ASSOCIATION_COPY);
}

-(dispatch_block_t)block
{
    return objc_getAssociatedObject(self, &nameKey);
}


@end
