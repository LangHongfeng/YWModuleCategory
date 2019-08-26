//
//  NSArray+SHYUtil.m
//  WaywardPoint_Code
//
//  Created by 韩盼盼 on 15/12/22.
//  Copyright © 2015年 易网新科技. All rights reserved.
//

#import "NSArray+SHYUtil.h"

@implementation NSArray (SHYUtil)

- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

@end
