//
//  NSArray+SHYUtil.h
//  WaywardPoint_Code
//
//  Created by 韩盼盼 on 15/12/22.
//  Copyright © 2015年 易网新科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface NSArray (SHYUtil)
/*!
 @method objectAtIndexCheck:
 @abstract 检查是否越界和NSNull如果是返回nil
 @result 返回对象
 */
- (id)objectAtIndexCheck:(NSUInteger)index;
@end


