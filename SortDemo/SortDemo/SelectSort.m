//
//  SelectSort.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import "SelectSort.h"

@implementation SelectSort


#pragma mark -

//+ (NSArray *)selectSort:(NSArray *)list {
//    // 可变数组
//    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
//
//    NSNumber *temp = nil;
//    int index = 0;
//    for (int i = 0; i < array.count - 1; i++) {
//        temp = array[i];
//        index = i;
//        for (int j = i + 1; j < array.count; j++) {
//            NSNumber *number = array[j];
//            if (number.intValue < temp.intValue) {
//                temp = array[j];
//                index = j;
//            }
//        } // for
//        array[index] = array[i];
//        array[i] = temp;
//    } // for
//
//    return array;
//}

// 选择排序...<所需要比较的轮数为count-1>
+ (NSArray *)selectSort:(NSArray *)list {
    return [self selectSortForAscend:list];
//    return [self selectSortForDescend:list];
//    return [self selectSortForAscend2:list];
//    return [self selectSortForDescend2:list];
}


#pragma mark - 从前往后

// 升序
+ (NSMutableArray *)selectSortForAscend:(NSArray *)list {
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    
    NSNumber *temp = nil;
    int index = 0;
    for (int i = 0; i < array.count - 1; i++) {
        temp = array[i];
        index = i;
        for (int j = i + 1; j < array.count; j++) {
            NSNumber *number = array[j];
            if (number.intValue < temp.intValue) {
                temp = array[j];
                index = j;
            }
        } // for
        if (index != i) {
            array[index] = array[i];
            array[i] = temp;
        }
    } // for
    
    return array;
}

// 降序
+ (NSMutableArray *)selectSortForDescend:(NSArray *)list {
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    
    NSNumber *temp = nil;
    int index = 0;
    for (int i = 0; i < array.count - 1; i++) {
        temp = array[i];
        index = i;
        for (int j = i + 1; j < array.count; j++) {
            NSNumber *number = array[j];
            if (number.intValue > temp.intValue) {
                temp = array[j];
                index = j;
            }
        } // for
        array[index] = array[i];
        array[i] = temp;
    } // for
    
    return array;
}


#pragma mark - 从后往前

// 升序
+ (NSMutableArray *)selectSortForAscend2:(NSArray *)list {
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    
    NSNumber *temp = nil;
    int index = 0;
    for (int i = (int)array.count - 1; i > 0; i--) {
        temp = array[i];
        index = i;
        for (int j = i - 1; j >= 0; j--) {
            NSNumber *number = array[j];
            if (number.intValue > temp.intValue) {
                temp = array[j];
                index = j;
            }
        } // for
        array[index] = array[i];
        array[i] = temp;
    } // for
    
    return array;
}

// 降序
+ (NSMutableArray *)selectSortForDescend2:(NSArray *)list {
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:list];
    
    NSNumber *temp = nil;
    int index = 0;
    for (int i = (int)array.count - 1; i > 0; i--) {
        temp = array[i];
        index = i;
        for (int j = i - 1; j >= 0; j--) {
            NSNumber *number = array[j];
            if (number.intValue < temp.intValue) {
                temp = array[j];
                index = j;
            }
        } // for
        array[index] = array[i];
        array[i] = temp;
    } // for
    
    return array;
}


@end
