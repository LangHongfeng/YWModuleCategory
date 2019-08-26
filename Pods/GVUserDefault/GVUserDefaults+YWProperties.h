//
//  GVUserDefaults+YWProperties.h
//  ChinaTimeHonoredBrand
//
//  Created by LHF on 16/12/17.
//  Copyright © 2016年 YiWang. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>

@interface GVUserDefaults (YWProperties)

@property (nonatomic) BOOL isLogin;
@property (nonatomic) BOOL isLoginPwd;
@property (nonatomic) BOOL is3rdLogin;

@property (nonatomic) NSInteger thirdloginType; //0:未登录 1:微信 2:微博 3:qq
@property (nonatomic) NSInteger selectType; //0:首页

@property (nonatomic, weak) NSString *thirdpartyaccount;
/**微信openid*/
@property (nonatomic, weak) NSString *thirdopenid;
/**微信名字*/
@property (nonatomic, weak) NSString *third_get_name;
/**微信头像*/
@property (nonatomic, weak) NSString *wx_img;

@property (nonatomic, weak) NSString *realname;  //用户名称
@property (nonatomic, weak) NSString *nickname;  //用户名称
@property (nonatomic, weak) NSString *balance;  //用户名称
@property (nonatomic, weak) NSString *birth;  //生日
@property (nonatomic, weak) NSString *age;  //年龄
@property (nonatomic, weak) NSString *lastfootmark;  //最近观看时间
@property (nonatomic, weak) NSString *collectionnum;  // 收藏量
@property (nonatomic, weak) NSString *subscriptionnum;  //订阅量
@property (nonatomic, weak) NSString *todayplaycount;  //今日观看次数
@property (nonatomic, weak) NSString *clickViewIdex;  //首页  视力恢复  缓解疲劳


@property (nonatomic,weak) NSString * issetpaypassword;//是否设置支付密码

@property (nonatomic, weak) NSString *mobile;   //手机号
@property (nonatomic, weak) NSString *memberId; //用户ID
@property (nonatomic, weak) NSString *headimg; //用户头像
@property (nonatomic, weak) NSString *city;//市
@property (nonatomic, weak) NSString *province;//省
@property (nonatomic,weak) NSString *district;//县

@property (nonatomic,weak) NSString *select_school;
@property (nonatomic,weak) NSString *select_schoolid;
@property (nonatomic,weak) NSString *select_child_id;



/**x性别 可选值:1(男),2(女)*/
@property (nonatomic,weak) NSString *sex;
/*民族*/
@property (nonatomic, weak) NSString *nation;
/*身份证*/
@property (nonatomic, weak) NSString *idcard;
/*身份证照片正面*/
@property (nonatomic, weak) NSString *idcardzimg;
/*身份证照片反面*/
@property (nonatomic, weak) NSString *idcardfimg;
/*现居住地址*/
@property (nonatomic, weak) NSString *address;
/*身份证地址*/
@property (nonatomic, weak) NSString *idcardaddress;
/*认定单位id*/
@property (nonatomic, weak) NSString *departid;
/**认定单位名字*/
@property (nonatomic, weak) NSString *departname;
/*主要获奖经历*/
@property (nonatomic, weak) NSString *zhuyaohjjl;
/*个人简历*/
@property (nonatomic, weak) NSString *gerenjianll;
/*用户类型 可选值:1(个人),2(团体),3(游客)*/
@property (nonatomic, weak) NSString *type;
/*审核状态 可选值:0(未通过审核),1(通过审核),2(审核中)*/
@property (nonatomic, weak) NSString *status;

/** 游客登录*/
@property (nonatomic) BOOL isTouristLogin;

//微信登录
@property (nonatomic, weak) NSString *wx_code;
@property (nonatomic, weak) NSString *wx_access_token;

//微博登录
@property (nonatomic, weak) NSString *wb_access_token;
//@property (nonatomic, weak) NSString *wb_current_userid;


//历史搜索
@property (nonatomic, weak) NSArray *searchList;
//历史搜索
@property (nonatomic, weak) NSArray *searchAreaList;
//开通工作室 选择的分类
@property (nonatomic, copy) NSArray *workList;

#pragma mark - update at 2017/05/18 by lang
/**登录token授权机制*/
@property (nonatomic, weak) NSString *token;
@property (nonatomic, weak) NSString *pageidex;
@property (nonatomic, weak) NSString *cart_count;

/**失效时间*/
@property (nonatomic, weak) NSString *failuretime;
@property (nonatomic, weak) NSString *signature;
@property (nonatomic, weak) NSString *invitationcode;


@property (nonatomic, weak) NSString *isverified;

@property (nonatomic, weak) NSString *attentionednum;
@property (nonatomic, weak) NSString *attentionnum;
@property (nonatomic, weak) NSString *dynamicnum;

@property (nonatomic, weak) NSString *level;

@property (nonatomic, weak) NSNumber *citycode;
@property (nonatomic, weak) NSNumber *oldcitycode;
@property (nonatomic, weak) NSNumber *iscomefromhome;

@property (nonatomic, weak) NSNumber *integral;//积分

@property (nonatomic, weak) NSString *todayintegral;  //今日积分
@property (nonatomic, weak) NSString *totalheart;  //累计爱心
@property (nonatomic, weak) NSString *heart;  //累计爱心

@property (nonatomic, weak) NSString *gq_password;  //果趣密码


@property (nonatomic, weak) NSData *flightPassengerList;

/**是否是vip*/
@property (nonatomic, weak) NSString *isvip;
/**失效时间*/
@property (nonatomic, weak) NSString *validity;
@property (nonatomic) BOOL isUseGPRS;//是否使用GPRS网络
@property (nonatomic) BOOL isShowMsg;//选择的弹窗模式  0  每次提醒  1  提醒一次


@property (nonatomic, copy) NSMutableArray *receiptList;
@property (nonatomic, copy) NSMutableArray *tradenumberList;



@property (nonatomic) BOOL isFirstStart;

@property (nonatomic, weak) NSData *wx_editHeadimagedata;//编辑微信登录的图片


@property (nonatomic, weak) NSString *oldcity;
@property (nonatomic, weak) NSString *oldprovince;
@property (nonatomic, weak) NSString *oldarea;

@property (nonatomic, weak) NSString *select_city;

@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;

//@property (nonatomic) NSInteger babySex;
//@property (nonatomic, weak) NSString *babyBirth;
//@property (nonatomic, weak) NSString *babyAge;

/**今日得分*/
@property (nonatomic, weak) NSString *todayscore;
/**今日击败百分比*/
@property (nonatomic, weak) NSString *todaypercent;
/**用户等级*/
@property (nonatomic, weak) NSString *levelname;

/**实名认证类型 可选值:1(家属),2(机构)*/
@property (nonatomic, weak) NSString *user_type;


@property (nonatomic, weak) NSString *identity;


@property (nonatomic, weak) NSArray *label;
@property (nonatomic, weak) NSString *gx_signature;
@property (nonatomic, weak) NSString *fans_number;
@property (nonatomic, weak) NSString *attention_number;
@property (nonatomic, weak) NSString *gender;
@property (nonatomic, weak) NSString *car_pai_code;
@property (nonatomic, weak) NSString *car_party_code;
@property (nonatomic, weak) NSString *register_time;
@property (nonatomic, weak) NSString *affective_state;
@property (nonatomic, weak) NSString *home;
@property (nonatomic, weak) NSString *career;
@property (nonatomic, weak) NSString *school;
@property (nonatomic, weak) NSString *last_time;
@property (nonatomic, weak) NSString *personal_description;
@property (nonatomic, weak) NSString *constellation;
@property (nonatomic, weak) NSString *distance;
@property (nonatomic, weak) NSString *auth_status;
@property (nonatomic, weak) NSString *is_attention;
@property (nonatomic, weak) NSString *work_address;
@property (nonatomic, weak) NSString *life_address;
@property (nonatomic, weak) NSString *isset_pay_pwd;
@property (nonatomic, weak) NSString *percent;

@property (nonatomic, weak) NSString *friends_count;

@property (nonatomic, weak) NSString *unreadmsgcount;

@property (nonatomic) BOOL isOpenNotification;

-(void)OutLoginAction;


@end
