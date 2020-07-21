//
//  InsertSort.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import "InsertSort.h"

@implementation InsertSort


#pragma mark -

// 插入排序...<所需要比较的轮数为count-1>
//+ (NSArray *)insertSort:(NSArray *)list {
//    // 可变数组
//    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
//    // 临时变量
//    NSNumber *temp = nil;
//
//    // 升序...<小数前移>
//    for (int i = 0; i < array.count - 1; i++) {
//        // 内部子循环有点像冒泡
//        for (int j = i + 1; j > 0; j--) {
//            NSNumber *before = array[j-1];
//            NSNumber *after = array[j];
//            if (before.intValue > after.intValue) {
//                // 有就交换
//                temp = before;
//                array[j-1] = after;
//                array[j] = temp;
//            }
//            else {
//                // 无则退出当前内部子循环...<因为默认前面N-1个元素是已经排好序的>
//                break;
//            }
//        } // for
//    } // for
//
//    return array;
//}

// 插入排序...<所需要比较的轮数为count-1>
+ (NSArray *)insertSort:(NSArray *)list {
    return [self insertSortForAscend:list];
//    return [self insertSortForDescend:list];
//    return [self insertSortForAscend2:list];
//    return [self insertSortForDescend2:list];
}


#pragma mark - 从前往后

// 升序
+ (NSMutableArray *)insertSortForAscend:(NSArray *)list {
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    // 临时变量
    NSNumber *temp = nil;
    
    // 升序...<小数前移>
    for (int i = 0; i < array.count - 1; i++) {
        // 内部子循环有点像冒泡
        for (int j = i + 1; j > 0; j--) {
            NSNumber *before = array[j-1];
            NSNumber *after = array[j];
            if (before.intValue > after.intValue) {
                // 有就交换
                temp = before;
                array[j-1] = after;
                array[j] = temp;
            }
            else {
                // 无则退出当前内部子循环...<因为默认前面N-1个元素是已经排好序的>
                break;
            }
        } // for
    } // for
    
    return array;
}

// 降序
+ (NSMutableArray *)insertSortForDescend:(NSArray *)list {
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    // 临时变量
    NSNumber *temp = nil;
    
    // 降序...<大数前移>
    for (int i = 0; i < array.count - 1; i++) {
        // 内部子循环有点像冒泡
        for (int j = i + 1; j > 0; j--) {
            NSNumber *before = array[j-1];
            NSNumber *after = array[j];
            if (before.intValue < after.intValue) {
                // 有就交换
                temp = before;
                array[j-1] = after;
                array[j] = temp;
            }
            else {
                // 无则退出当前内部子循环...<因为默认前面N-1个元素是已经排好序的>
                break;
            }
        } // for
    } // for
    
    return array;
}


#pragma mark - 从后往前

// 升序
+ (NSMutableArray *)insertSortForAscend2:(NSArray *)list {
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    // 临时变量
    NSNumber *temp = nil;
    
    // 升序...<大数后移>
    for (int i = (int)array.count - 1; i > 0; i--) {
        // 内部子循环有点像冒泡
        for (int j = i - 1; j < array.count - 1; j++) {
            NSNumber *before = array[j];
            NSNumber *after = array[j+1];
            if (before.intValue > after.intValue) {
                // 有就交换
                temp = before;
                array[j] = after;
                array[j+1] = temp;
            }
            else {
                // 无则退出当前内部子循环...<因为默认前面N-1个元素是已经排好序的>
                break;
            }
        } // for
    } // for
    
    return array;
}

// 降序
+ (NSMutableArray *)insertSortForDescend2:(NSArray *)list {
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    // 临时变量
    NSNumber *temp = nil;
    
    // 降序...<小数后移>
    for (int i = (int)array.count - 1; i > 0; i--) {
        // 内部子循环有点像冒泡
        for (int j = i - 1; j < array.count - 1; j++) {
            NSNumber *before = array[j];
            NSNumber *after = array[j+1];
            if (before.intValue < after.intValue) {
                // 有就交换
                temp = before;
                array[j] = after;
                array[j+1] = temp;
            }
            else {
                // 无则退出当前内部子循环...<因为默认前面N-1个元素是已经排好序的>
                break;
            }
        } // for
    } // for
    
    return array;
}


@end
