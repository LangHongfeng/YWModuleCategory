//
//  NSString+SHA1.h
//  ALotShow
//
//  Created by LHF on 16/9/28.
//  Copyright © 2016年 L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>


@interface NSString (SHA1)

- (NSString*) sha1;

@end
