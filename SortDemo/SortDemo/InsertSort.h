//
//  InsertSort.h
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//  3.插入排序 Insertion Sort

/*
 基本思想：
 在要排序的一组数中，假定前n-1个数已经排好序，现在将第n个数插到前面的有序数列中，使得这n个数也是排好顺序的。如此反复循环，直到全部排好顺序。
 平均时间复杂度：O(n2)
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InsertSort : NSObject

+ (NSArray *)insertSort:(NSArray *)list;

@end

NS_ASSUME_NONNULL_END
