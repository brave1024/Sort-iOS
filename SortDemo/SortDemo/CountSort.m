//
//  CountSort.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/21.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import "CountSort.h"

@implementation CountSort

//
+ (NSArray *)countSort:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    
    // 排序
//    [CountSort sort:array];
    [CountSort sort2:array];
    
    return array;
}


#pragma mark -

// 最简单的计数排序...<不考虑数组中包含负数，不考虑浪费内存问题>...[升序]
+ (void)sort:(NSMutableArray<NSNumber *> *)list {
    // 数组中的最大值
    int max = [CountSort getMax:list];
    // 临时数组长度
    int lenght = max + 1;
    // 创建临时数组，以0值填充
    NSMutableArray<NSNumber *> *tempArray = [NSMutableArray arrayWithCapacity:lenght];
    for (int i = 0; i < lenght; i++) {
        [tempArray addObject:@0];
    } // for
    
    //
    for (int i = 0; i < list.count; i++) {
        // 获取指定索引处元素的值
        int value = list[i].intValue;
        // 获取临时数组中指定索引处元素的值
        int tempValue = tempArray[value].intValue + 1;
        // 重新赋值
        tempArray[value] = [NSNumber numberWithInt:tempValue];
    } // for
    
    //
    int sortIndex = 0;
    for (int i = 0; i < lenght; i++) {
        while (tempArray[i].intValue > 0) {
            // 赋值
            list[sortIndex] = [NSNumber numberWithInt:i];
            sortIndex++;
            //
            NSNumber *tempNumber = tempArray[i];
            int tempValue = tempNumber.intValue - 1;
            tempArray[i] = [NSNumber numberWithInt:tempValue];
        } // while
    } // for
}

// 最简单的计数排序...<不考虑数组中包含负数，不考虑浪费内存问题>...[降序]
+ (void)sort2:(NSMutableArray<NSNumber *> *)list {
    // 数组中的最大值
    int max = [CountSort getMax:list];
    // 临时数组长度
    int lenght = max + 1;
    // 创建临时数组，以0值填充
    NSMutableArray<NSNumber *> *tempArray = [NSMutableArray arrayWithCapacity:lenght];
    for (int i = 0; i < lenght; i++) {
        [tempArray addObject:@0];
    } // for
    
    for (int i = 0; i < list.count; i++) {
        // 获取指定索引处元素的值
        int value = list[i].intValue;
        // 获取临时数组中指定索引处元素的值
        int tempValue = tempArray[value].intValue + 1;
        // 重新赋值
        tempArray[value] = [NSNumber numberWithInt:tempValue];
    } // for
    
    int sortIndex = 0;
    for (int i = lenght - 1; i >= 0; i--) {
        while (tempArray[i].intValue > 0) {
            // 赋值
            list[sortIndex] = [NSNumber numberWithInt:i];
            sortIndex++;
            //
            NSNumber *tempNumber = tempArray[i];
            int tempValue = tempNumber.intValue - 1;
            tempArray[i] = [NSNumber numberWithInt:tempValue];
        } // while
    } // for
}


#pragma mark -

//+ (NSArray *)countSort:(NSArray *)list {
//    // 可变数组
//    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
//    // 数组长度
//    int count = (int)array.count;
//
//    // 数组中的最大值
//    int max = [CountSort getMax:array];
//    // 数组中的最小值
//    int min = [CountSort getMin:array];
//
//    // 临时数组长度
//    int lenght = max - min + 1;
//    // 创建临时数组，以0值填充
//    NSMutableArray<NSNumber *> *tempArray = [NSMutableArray arrayWithCapacity:lenght];
//    for (int i = 0; i < lenght; i++) {
//        [tempArray addObject:@0];
//    } // for
//
//    for (int i = 0; i < count; i++) {
//        // 获取指定索引处元素的值
//        NSNumber *number = array[i];
//        int value = number.intValue;
//        // 获取临时数组中指定索引处元素的值
//        NSNumber *tempNumber = tempArray[value - min];
//        int tempValue = tempNumber.intValue + 1;
//        // 重新赋值
//        tempArray[value - min] = [NSNumber numberWithInt:tempValue];
//    } // for
//
////    for (int i = 1; i < lenght; i++) {
////
////    } // for
//
//    int sortIndex = 0;
//    for (int i = 0; i < lenght; i++) {
//        while (tempArray[i].intValue > 0) {
//            // 赋值
//            array[sortIndex] = [NSNumber numberWithInt:i];
//            sortIndex++;
//            //
//            NSNumber *tempNumber = tempArray[i];
//            int tempValue = tempNumber.intValue - 1;
//            tempArray[i] = [NSNumber numberWithInt:tempValue];
//        } // while
//    } // for
//
//    return array;
//}


#pragma mark -

// 获取最大值
+ (int)getMax:(NSArray<NSNumber *> *)list {
    int max = list[0].intValue;
    for (int i = 0; i < list.count; i++) {
        if (list[i].intValue > max) {
            max = list[i].intValue;
        }
    } // for
    return max;
}

// 获取最小值
+ (int)getMin:(NSArray<NSNumber *> *)list {
    int min = list[0].intValue;
    for (int i = 0; i < list.count; i++) {
        if (list[i].intValue < min) {
            min = list[i].intValue;
        }
    } // for
    return min;
}


@end
