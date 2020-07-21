//
//  SortHelper.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//  Sort Ascending or Sort Descending

#import "SortHelper.h"
#import "BubbleSort.h"
#import "SelectSort.h"
#import "InsertSort.h"
#import "ShellSort.h"
#import "MergeSort.h"
#import "QuickSort.h"
#import "HeapSort.h"
#import "CountSort.h"


@implementation SortHelper


#pragma mark - BubbleSort

// 1.冒泡排序...<所需要比较的轮数为count-1>
+ (NSArray *)bubbleSort:(NSArray *)list {
    return [BubbleSort bubbleSort:list];
}


#pragma mark - SelectionSort

// 2.选择排序...<所需要比较的轮数为count-1>
+ (NSArray *)selectSort:(NSArray *)list {
    return [SelectSort selectSort:list];
}


#pragma mark - InsertionSort

// 3.插入排序...<所需要比较的轮数为count-1>
+ (NSArray *)insertSort:(NSArray *)list {
    return [InsertSort insertSort:list];
}


#pragma mark - ShellSort

// 4.希尔排序
+ (NSArray *)shellSort:(NSArray *)list {
    return [ShellSort shellSort:list];
}


#pragma mark - MergeSort

// 5.归并排序
+ (NSArray *)mergeSort:(NSArray *)list {
    return [MergeSort mergeSort:list];
}


#pragma mark - QuickSort

// 6.快速排序
+ (NSArray *)quickSort:(NSArray *)list {
    return [QuickSort quickSort:list];
}


#pragma mark - HeapSort

// 7.堆排序
+ (NSArray *)heapSort:(NSArray *)list {
    return [HeapSort heapSort:list];
}


#pragma mark - HeapSort

// 8.计数排序

+ (NSArray *)countSort:(NSArray *)list {
    return [CountSort countSort:list];
}






@end
