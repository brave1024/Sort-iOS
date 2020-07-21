//
//  main.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SortHelper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // 原始数组
        NSArray *list = @[@12, @9, @3, @20, @31, @5, @18, @58, @6, @19];
        NSLog(@"@list:%@", list);
        
        // 1.冒泡排序
//        NSArray *sort = [SortHelper bubbleSort:(NSMutableArray *)list];
//        NSLog(@"@sort:%@", sort);
        
        // 2.选择排序
//        NSArray *sort = [SortHelper selectSort:(NSMutableArray *)list];
//        NSLog(@"@sort:%@", sort);
        
        // 3.插入排序
//        NSArray *sort = [SortHelper insertSort:(NSMutableArray *)list];
//        NSLog(@"@sort:%@", sort);
        
        // 4.希尔排序
//        NSArray *sort = [SortHelper shellSort:(NSMutableArray *)list];
//        NSLog(@"@sort:%@", sort);
        
        // 5.归并排序
//        NSArray *sort = [SortHelper mergeSort:(NSMutableArray *)list];
//        NSLog(@"@sort:%@", sort);
        
        // 6.快速排序
//        NSArray *sort = [SortHelper quickSort:(NSMutableArray *)list];
//        NSLog(@"@sort:%@", sort);
        
        // 7.堆排序
//        NSArray *sort = [SortHelper heapSort:(NSMutableArray *)list];
//        NSLog(@"@sort:%@", sort);
        
        // 8.计数排序
        NSArray *sort = [SortHelper countSort:(NSMutableArray *)list];
        NSLog(@"@sort:%@", sort);
        
        
    }
    return 0;
}
