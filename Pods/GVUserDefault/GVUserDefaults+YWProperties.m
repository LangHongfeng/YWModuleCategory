//
//  GVUserDefaults+YWProperties.m
//  ChinaTimeHonoredBrand
//
//  Created by LHF on 16/12/17.
//  Copyright © 2016年 YiWang. All rights reserved.
//

#import "GVUserDefaults+YWProperties.h"

@implementation GVUserDefaults (YWProperties)


@dynamic isLogin;
@dynamic isLoginPwd;
@dynamic selectType;
@dynamic is3rdLogin;
@dynamic isverified;
@dynamic todayintegral;
@dynamic memberId;
@dynamic headimg;
@dynamic sex;
@dynamic realname;
@dynamic type;
@dynamic province;
@dynamic city;
@dynamic district;
@dynamic nickname;
@dynamic balance;
@dynamic invitationcode;
@dynamic nation;
@dynamic idcard;
@dynamic idcardzimg;
@dynamic idcardfimg;
@dynamic address;
@dynamic idcardaddress;
@dynamic departname;
@dynamic departid;
@dynamic zhuyaohjjl;
@dynamic gerenjianll;
@dynamic status;
@dynamic birth;
@dynamic age;
@dynamic thirdloginType;
@dynamic searchList;
@dynamic workList;
@dynamic isUseGPRS;
@dynamic wx_code;
@dynamic thirdpartyaccount;
@dynamic wx_access_token;
@dynamic gq_password;
@dynamic heart;
@dynamic lastfootmark;
@dynamic wx_editHeadimagedata;
@dynamic collectionnum;
@dynamic subscriptionnum;
@dynamic todayplaycount;
@dynamic clickViewIdex;
@dynamic searchAreaList;
@dynamic select_school;
@dynamic select_schoolid;
@dynamic select_child_id;


@dynamic wb_access_token;
//@dynamic wb_current_userid;

@dynamic thirdopenid;
@dynamic wx_img;
@dynamic third_get_name;

@dynamic token;

@dynamic todayscore;
@dynamic todaypercent;

@dynamic isFirstStart;
@dynamic pageidex;
@dynamic select_city;
@dynamic longitude;
@dynamic latitude;

@dynamic oldarea;
@dynamic oldcity;
@dynamic oldprovince;
@dynamic oldcitycode;
@dynamic cart_count;
//@dynamic babyAge;
//@dynamic babySex;
//@dynamic babyBirth;

-(void)OutLoginAction
{
    NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dictionary = [defatluts dictionaryRepresentation];
   
    for(NSString *key in [dictionary allKeys]){
        
        if (![key isEqualToString:@"appVersion"] && ![key isEqualToString:@"searchList"]&& ![key isEqualToString:@"isTouristLogin"]&&![key isEqualToString:@"isUseGPRS"]&&![key isEqualToString:@"isShowMsg"]) {
            
            [defatluts removeObjectForKey:key];
            [defatluts synchronize];
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
}

@end
