//
//  BubbleSort.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort


#pragma mark - 

// 冒泡排序...<所需要比较的轮数为count-1>
//+ (NSArray *)bubbleSort:(NSArray *)list {
//    // 可变数组
//    NSMutableArray *temp = [NSMutableArray arrayWithArray:list];
//    // 当前轮的排序中是否发生了交换
//    BOOL flagOver = NO;
//
//    // 1.升序...<大数后移>...<从前往后冒泡>
//    for (int i = 0; i < temp.count - 1; i++) {
//        // 当前轮的排序开始前，是否发生了交换的标识符置为NO
//        flagOver = NO;
//        // 开始当前轮排序
//        for (int j = 0; j < temp.count - i - 1; j++) {
//            NSNumber *before = temp[j];
//            NSNumber *after = temp[j+1];
//            if (before.intValue > after.intValue) {
//                temp[j] = after;
//                temp[j+1] = before;
//                flagOver = YES;
//            }
//        } // for
//        // 未发生交换，则说明全部排序结束，直接返回
//        if (!flagOver) {
//            break;
//        }
//    } // for
//
//    // 2.降序...<小数后移>...<从前往后冒泡>
////    for (int i = 0; i < temp.count - 1; i++) {
////        // 当前轮的排序开始前，是否发生了交换的标识符置为NO
////        flagOver = NO;
////        // 开始当前轮排序
////        for (int j = 0; j < temp.count - i - 1; j++) {
////            NSNumber *before = temp[j];
////            NSNumber *after = temp[j+1];
////            if (before.intValue < after.intValue) {
////                temp[j] = after;
////                temp[j+1] = before;
////                flagOver = YES;
////            }
////        } // for
////        // 未发生交换，则说明全部排序结束，直接返回
////        if (!flagOver) {
////            break;
////        }
////    } // for
//
//    // 3.升序...<小数前移>...<从后往前冒泡>
////    for (int i = 0; i < temp.count - 1; i++) {
////        // 当前轮的排序开始前，是否发生了交换的标识符置为NO
////        flagOver = NO;
////        // 开始当前轮排序
////        for (int j = (int)temp.count - 1; j > i; j--) {
////            NSNumber *before = temp[j-1];
////            NSNumber *after = temp[j];
////            if (before.intValue > after.intValue) {
////                temp[j-1] = after;
////                temp[j] = before;
////                flagOver = YES;
////            }
////        } // for
////        // 未发生交换，则说明全部排序结束，直接返回
////        if (!flagOver) {
////            break;
////        }
////    } // for
//
//    // 4.降序...<大数前移>...<从后往前冒泡>
////    for (int i = 0; i < temp.count - 1; i++) {
////        // 当前轮的排序开始前，是否发生了交换的标识符置为NO
////        flagOver = NO;
////        // 开始当前轮排序
////        for (int j = (int)temp.count - 1; j > i; j--) {
////            NSNumber *before = temp[j-1];
////            NSNumber *after = temp[j];
////            if (before.intValue < after.intValue) {
////                temp[j-1] = after;
////                temp[j] = before;
////                flagOver = YES;
////            }
////        } // for
////        // 未发生交换，则说明全部排序结束，直接返回
////        if (!flagOver) {
////            break;
////        }
////    } // for
//
//    return temp;
//}

// 冒泡排序...<所需要比较的轮数为count-1>
+ (NSArray *)bubbleSort:(NSArray *)list {
//    return [self bubbleSortForAscend:list];
//    return [self bubbleSortForAscend2:list];
//    return [self bubbleSortForDescend:list];
    return [self bubbleSortForDescend2:list];
}


#pragma mark - 从前往后冒泡

// 升序
+ (NSMutableArray *)bubbleSortForAscend:(NSArray *)list {
    // 可变数组
    NSMutableArray *temp = [NSMutableArray arrayWithArray:list];
    // 当前轮的排序中是否发生了交换
    BOOL flagOver = NO;
    
    // 升序...<大数后移>...<从前往后冒泡>
    for (int i = 0; i < temp.count - 1; i++) {
        // 当前轮的排序开始前，是否发生了交换的标识符置为NO
        flagOver = NO;
        // 开始当前轮排序
        for (int j = 0; j < temp.count - i - 1; j++) {
            NSNumber *before = temp[j];
            NSNumber *after = temp[j+1];
            if (before.intValue > after.intValue) {
                temp[j] = after;
                temp[j+1] = before;
                flagOver = YES;
            }
        } // for
        // 未发生交换，则说明全部排序结束，直接返回
        if (!flagOver) {
            break;
        }
    } // for
    
    return temp;
}

// 降序
+ (NSMutableArray *)bubbleSortForDescend:(NSArray *)list {
    // 可变数组
    NSMutableArray *temp = [NSMutableArray arrayWithArray:list];
    // 当前轮的排序中是否发生了交换
    BOOL flagOver = NO;
    
    // 降序...<小数后移>...<从前往后冒泡>
    for (int i = 0; i < temp.count - 1; i++) {
        // 当前轮的排序开始前，是否发生了交换的标识符置为NO
        flagOver = NO;
        // 开始当前轮排序
        for (int j = 0; j < temp.count - i - 1; j++) {
            NSNumber *before = temp[j];
            NSNumber *after = temp[j+1];
            if (before.intValue < after.intValue) {
                temp[j] = after;
                temp[j+1] = before;
                flagOver = YES;
            }
        } // for
        // 未发生交换，则说明全部排序结束，直接返回
        if (!flagOver) {
            break;
        }
    } // for
    
    return temp;
}


#pragma mark - 从后往前冒泡

// 升序
+ (NSMutableArray *)bubbleSortForAscend2:(NSArray *)list {
    // 可变数组
    NSMutableArray *temp = [NSMutableArray arrayWithArray:list];
    // 当前轮的排序中是否发生了交换
    BOOL flagOver = NO;
    
    // 升序...<小数前移>...<从后往前冒泡>
    for (int i = 0; i < temp.count - 1; i++) {
        // 当前轮的排序开始前，是否发生了交换的标识符置为NO
        flagOver = NO;
        // 开始当前轮排序
        for (int j = (int)temp.count - 1; j > i; j--) {
            NSNumber *before = temp[j-1];
            NSNumber *after = temp[j];
            if (before.intValue > after.intValue) {
                temp[j-1] = after;
                temp[j] = before;
                flagOver = YES;
            }
        } // for
        // 未发生交换，则说明全部排序结束，直接返回
        if (!flagOver) {
            break;
        }
    } // for
    
    return temp;
}

// 降序
+ (NSMutableArray *)bubbleSortForDescend2:(NSArray *)list {
    // 可变数组
    NSMutableArray *temp = [NSMutableArray arrayWithArray:list];
    // 当前轮的排序中是否发生了交换
    BOOL flagOver = NO;
    
    // 降序...<大数前移>...<从后往前冒泡>
    for (int i = 0; i < temp.count - 1; i++) {
        // 当前轮的排序开始前，是否发生了交换的标识符置为NO
        flagOver = NO;
        // 开始当前轮排序
        for (int j = (int)temp.count - 1; j > i; j--) {
            NSNumber *before = temp[j-1];
            NSNumber *after = temp[j];
            if (before.intValue < after.intValue) {
                temp[j-1] = after;
                temp[j] = before;
                flagOver = YES;
            }
        } // for
        // 未发生交换，则说明全部排序结束，直接返回
        if (!flagOver) {
            break;
        }
    } // for
    
    return temp;
}


@end
