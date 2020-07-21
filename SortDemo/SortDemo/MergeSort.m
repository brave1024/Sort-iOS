//
//  MergeSort.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/18.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort


#pragma mark -

//// 归并排序
//+ (NSArray *)mergeSort:(NSArray *)list {
//    // 数组长度
//    int count = (int)list.count;
//    if (count < 2) {
//        return list;
//    }
//
//    int middle = count / 2;
//    NSArray *leftList = [list subarrayWithRange:NSMakeRange(0, middle)];
//    NSArray *rightList = [list subarrayWithRange:NSMakeRange(middle, count - middle)];
//
//    return [MergeSort mergeForLeft:[MergeSort mergeSort:leftList] AndRight:[MergeSort mergeSort:rightList]];
//}
//
//// 合并两个有序的数组，组成一个新的有序数组
//+ (NSArray *)mergeForLeft:(NSArray<NSNumber *> *)leftList AndRight:(NSArray<NSNumber *> *)rightList {
//    // 合并后的有序数组
//    NSMutableArray *array = [NSMutableArray array];
//    // 动态索引
//    int i = 0, j = 0;
//
//    while (i < leftList.count && j < rightList.count) {
//        NSNumber *left = leftList[i];
//        NSNumber *right = rightList[j];
//        if (left.intValue <= right.intValue) {
//            [array addObject:leftList[i++]];
//        } else {
//            [array addObject:rightList[j++]];
//        }
//    } // while
//
//    while (i < leftList.count) {
//        [array addObject:leftList[i++]];
//    } // while
//
//    while (j < rightList.count) {
//        [array addObject:rightList[j++]];
//    } // while
//
//    return array;
//}

// 归并排序
+ (NSArray *)mergeSort:(NSArray *)list {
//    return [MergeSort sort:list];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:list];
    [MergeSort sort2:array tempList:tempArray low:0 high:(int)array.count - 1];
    return array;
}


#pragma mark - 排序[递归]

/*
 说明：
 当前方法待优化，因为在递归过程中频繁的开辟内存空间，cpu消耗过大，耗时严重。
 */

// [sort]排序：（自上而下）递归
+ (NSArray *)sort:(NSArray *)list {
    // 数组长度
    int count = (int)list.count;
    if (count < 2) {
        return list;
    }
    
    int middle = count / 2;
    NSArray *leftList = [list subarrayWithRange:NSMakeRange(0, middle)];
    NSArray *rightList = [list subarrayWithRange:NSMakeRange(middle, count - middle)];
    
    return [MergeSort mergeAscendForLeft:[MergeSort sort:leftList] AndRight:[MergeSort sort:rightList]];
//    return [MergeSort mergeDescendForLeft:[MergeSort sort:leftList] AndRight:[MergeSort sort:rightList]];
}


#pragma mark 升序[合并]

// [merge]合并：合并两个有序的数组，组成一个新的有序数组
+ (NSMutableArray *)mergeAscendForLeft:(NSArray<NSNumber *> *)leftList AndRight:(NSArray<NSNumber *> *)rightList {
    // 合并后的有序数组
    NSMutableArray *array = [NSMutableArray array];
    // 转为可变数组
    NSMutableArray *leftArray = [NSMutableArray arrayWithArray:leftList];
    NSMutableArray *rightArray = [NSMutableArray arrayWithArray:rightList];
    
    while (leftArray.count > 0 && rightArray.count > 0) {
        NSNumber *left = leftArray[0];
        NSNumber *right = rightArray[0];
        if (left.intValue <= right.intValue) {
            [array addObject:leftArray[0]];
            [leftArray removeObjectAtIndex:0];
        } else {
            [array addObject:rightArray[0]];
            [rightArray removeObjectAtIndex:0];
        }
    } // while
    
    if (leftArray.count > 0) {
        [array addObjectsFromArray:leftArray];
        [leftArray removeAllObjects];
    } // if
    
    if (rightArray.count > 0) {
        [array addObjectsFromArray:rightArray];
        [rightArray removeAllObjects];
    } // if
    
    return array;
}


#pragma mark 降序[合并]

// 合并两个有序的数组，组成一个新的有序数组
+ (NSMutableArray *)mergeDescendForLeft:(NSArray<NSNumber *> *)leftList AndRight:(NSArray<NSNumber *> *)rightList {
    // 合并后的有序数组
    NSMutableArray *array = [NSMutableArray array];
    // 转为可变数组
    NSMutableArray *leftArray = [NSMutableArray arrayWithArray:leftList];
    NSMutableArray *rightArray = [NSMutableArray arrayWithArray:rightList];
    
    while (leftArray.count > 0 && rightArray.count > 0) {
        NSNumber *left = leftArray[0];
        NSNumber *right = rightArray[0];
        if (left.intValue >= right.intValue) {
            [array addObject:leftArray[0]];
            [leftArray removeObjectAtIndex:0];
        } else {
            [array addObject:rightArray[0]];
            [rightArray removeObjectAtIndex:0];
        }
    } // while
    
    if (leftArray.count > 0) {
        [array addObjectsFromArray:leftArray];
        [leftArray removeAllObjects];
    } // if
    
    if (rightArray.count > 0) {
        [array addObjectsFromArray:rightArray];
        [rightArray removeAllObjects];
    } // if
    
    return array;
}


#pragma mark - 排序[递归]优化版

/*
说明：
当前方法在递归时，仅初始化了几个int类型的基本数据，并未频繁生成array数组。
*/

// [sort]排序：（自上而下）递归
+ (void)sort2:(NSMutableArray *)list tempList:(NSMutableArray *)tempList low:(int)low high:(int)high {
    if (low >= high) {
        return;
    }
    
    int middle = (low + high) / 2;
    
    // 对左半边进行排序
    [MergeSort sort2:list tempList:tempList low:low high:middle];
    // 对右半边进行排序
    [MergeSort sort2:list tempList:tempList low:middle + 1 high:high];
    // 进行归并
//    [MergeSort mergeAscend:list tempList:tempList low:low middle:middle high:high];
    [MergeSort mergeDescend:list tempList:tempList low:low middle:middle high:high];
}


#pragma mark 升序[合并]

+ (void)mergeAscend:(NSMutableArray<NSNumber *> *)list tempList:(NSMutableArray<NSNumber *> *)tempList low:(int)low middle:(int)middle high:(int)high {
    // 第一部分数组归并merge的开始位置
    int i = low;
    // 第二部分数组归并merge的开始位置
    int j = middle + 1;
    
    // 将list[low..high]的内容复制到tempList[low..high]
    for (int k = low; k <= high; k++) {
        tempList[k] = list[k];
    } // for
    
    // 归并merge操作
    for (int k = low; k <= high; k++) {
        if (i > middle) {
            list[k] = tempList[j++];
        }
        else if (j > high) {
            list[k] = tempList[i++];
        }
        else if (tempList[i].intValue > tempList[j].intValue) {
            list[k] = tempList[j++];
        }
        else {
            list[k] = tempList[i++];
        }
    } // for
}


#pragma mark 降序[合并]

+ (void)mergeDescend:(NSMutableArray<NSNumber *> *)list tempList:(NSMutableArray<NSNumber *> *)tempList low:(int)low middle:(int)middle high:(int)high {
    // 第一部分数组归并merge的开始位置
    int i = low;
    // 第二部分数组归并merge的开始位置
    int j = middle + 1;
    
    // 将list[low..high]的内容复制到tempList[low..high]
    for (int k = low; k <= high; k++) {
        tempList[k] = list[k];
    } // for
    
    // 归并merge操作
    for (int k = low; k <= high; k++) {
        if (i > middle) {
            list[k] = tempList[j++];
        }
        else if (j > high) {
            list[k] = tempList[i++];
        }
        else if (tempList[i].intValue > tempList[j].intValue) {
            list[k] = tempList[i++];
        }
        else {
            list[k] = tempList[j++];
        }
    } // for
}


#pragma mark - 排序[迭代]

+ (NSArray *)sort3:(NSArray *)list {
    // 合并后的有序数组
    NSMutableArray *array = [NSMutableArray array];
    
    
    
    
    return array;
}


@end
