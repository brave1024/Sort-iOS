//
//  SortHelper.h
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortHelper : NSObject

+ (NSArray *)bubbleSort:(NSArray *)list;

+ (NSArray *)selectSort:(NSArray *)list;

+ (NSArray *)insertSort:(NSArray *)list;

+ (NSArray *)shellSort:(NSArray *)list;

+ (NSArray *)mergeSort:(NSArray *)list;

+ (NSArray *)quickSort:(NSArray *)list;

+ (NSArray *)heapSort:(NSArray *)list;

+ (NSArray *)countSort:(NSArray *)list;


@end

NS_ASSUME_NONNULL_END
