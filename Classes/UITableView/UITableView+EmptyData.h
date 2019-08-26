//
//  UITableView+EmptyData.h
//  BusinessEnterprise
//
//  Created by LHF on 16/10/20.
//  Copyright © 2016年 YiWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyData)

@property (nonatomic, copy) dispatch_block_t block;

- (void)tableViewDisplayWitMsg:(NSString *) message
        ifNecessaryForRowCount:(NSUInteger) rowCount
                andNOImagename:(NSString *)imagenname
                        hasImg:(BOOL)hasImg;

- (void)tableViewDisplayWitMsg:(NSString *) message
        ifNecessaryForRowCount:(NSUInteger) rowCount
                andNOImagename:(NSString *)imagenname
                        hasImg:(BOOL)hasImg
                      andBlock:(dispatch_block_t)block;

@end
