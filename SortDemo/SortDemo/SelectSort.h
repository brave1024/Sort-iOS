//
//  SelectSort.h
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//  2.选择排序 Selection Sort

/*
 基本思想：
 在长度为N的无序数组中，第一次遍历n-1个数，找到最小的数值与第一个元素交换；
 第二次遍历n-2个数，找到最小的数值与第二个元素交换；
 ...
 第n-1次遍历，找到最小的数值与第n-1个元素交换，排序完成。
 平均时间复杂度：O(n2)
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectSort : NSObject

+ (NSArray *)selectSort:(NSArray *)list;

@end

NS_ASSUME_NONNULL_END
