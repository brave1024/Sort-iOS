//
//  BubbleSort.h
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//  1.冒泡排序 Bubble Sort

/*
 基本思想：
 两个数比较大小，较大的数下沉，较小的数冒起来。
 过程：
 比较相邻的两个数据，如果第二个数小，就交换位置。
 从后向前两两比较，一直到比较最前两个数据。最终最小数被交换到起始的位置，这样第一个最小数的位置就排好了。
 继续重复上述过程，依次将第2.3...n-1个最小数排好位置。
 平均时间复杂度：O(n2)
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BubbleSort : NSObject

+ (NSArray *)bubbleSort:(NSArray *)list;

@end

NS_ASSUME_NONNULL_END
