//
//  ShellSort.h
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//  4.希尔排序 Shell Sort [缩小增量排序] 是直接插入排序的优化版

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShellSort : NSObject

+ (NSArray *)shellSort:(NSArray *)list;

@end

NS_ASSUME_NONNULL_END
