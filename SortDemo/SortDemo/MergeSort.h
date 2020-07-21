//
//  MergeSort.h
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/18.
//  Copyright © 2019 夏志勇. All rights reserved.
//  5.归并排序 Merge Sort

/*
 基本思想：
 归并排序（Merge-Sort）是利用归并的思想实现的排序方法，该算法采用经典的分治（divide-and-conquer）策略（分治法将问题分(divide)成一些小的问题然后递归求解，而治(conquer)的阶段则将分的阶段得到的各答案"修补"在一起，即分而治之)。
 
 将已有序的子序列合并，得到完成有序的序列；即先使每个子序列有序，再使子序列段间有序。
 归并排序是一种稳定的排序方法。
 
 分割：递归地把当前序列平均分割成两半。
 集成：在保持元素顺序的同时将上一步得到的子序列集成到一起（归并）。
 
 https://www.cnblogs.com/chengxiao/p/6194356.html
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MergeSort : NSObject

+ (NSArray *)mergeSort:(NSArray *)list;

@end

NS_ASSUME_NONNULL_END
