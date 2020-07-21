//
//  ShellSort.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/14.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import "ShellSort.h"

@implementation ShellSort


#pragma mark -

//+ (NSArray *)shellSort:(NSArray *)list {
//    // 可变数组
//    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
//    int count = (int)array.count;
//    //int gap = count / 2;
//
////    while (gap > 0) {
////        // 从增量那组开始进行插入排序，直至完毕
////        for (int i = gap; i < count; i++) {
////            int j = i;
////            NSNumber *temp = array[j];
////            // j - step 就是代表与它同组隔壁的元素
////            while (j - gap >= 0 && array[j - gap].intValue > array[j].intValue) {
////                array[j] = array[j - gap];
////                j = j - gap;
////            }
////            array[j] = temp;
////        } // for
////        // 增量每次都/2
////        gap = gap / 2;
////    } // while
//
//    // 第一层for循环用于计算gap增量值...<逐步缩小增量>
//    for (int gap = count / 2; gap > 0; gap /= 2) {
//        // 第二层for循环根据gap增量将array分组...<分成gap组>...<若gap=1，则整体分成一组，并作直接插入排序>
//        for (int i = gap; i < count; i++) {
//            // 第三层for循环
//            for (int j = i; j >= 0; j -= gap) {
//                if (j - gap >= 0) {
//                    NSNumber *before = array[j - gap];
//                    NSNumber *after = array[j];
//                    if (before.intValue > after.intValue) {
//                        array[j - gap] = after;
//                        array[j] = before;
//                    } else {
//                        break;
//                    }
//                }
//            } // for
//        } // for
//    } // for
//
//    return array;
//}

+ (NSArray *)shellSort:(NSArray *)list {
//    return [self shellSortForAscend:list];
//    return [self shellSortForDescend:list];
//    return [self shellSortForAscend2:list];
//    return [self shellSortForDescend2:list];
//    return [self shellSortForAscend3:list];
//    return [self shellSortForDescend3:list];
//    return [self shellSortForAscend4:list];
    return [self shellSortForDescend4:list];
}


#pragma mark - 从前往后

// 升序
+ (NSMutableArray *)shellSortForAscend:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    // 当前增量大小...<最大增量>
    int gap = count / 2;
    
    while (gap > 0) {
        // 从增量那组开始进行插入排序，直至完毕
        for (int i = gap; i < count; i++) {
            int j = i;
            NSNumber *temp = nil;
            // j - step 就是代表与它同组隔壁的元素
            while (j - gap >= 0 && array[j - gap].intValue > array[j].intValue) {
                temp = array[j - gap];
                array[j - gap] = array[j];
                array[j] = temp;
                j = j - gap;
            } // while
        } // for
        
        // 增量每次都/2
        gap = gap / 2;
    } // while
    
    return array;
}

// 降序
+ (NSMutableArray *)shellSortForDescend:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    // 当前增量大小...<最大增量>
    int gap = count / 2;
    
    while (gap > 0) {
        // 从增量那组开始进行插入排序，直至完毕
        for (int i = gap; i < count; i++) {
            int j = i;
            NSNumber *temp = nil;
            // j - step 就是代表与它同组隔壁的元素
            while (j - gap >= 0 && array[j - gap].intValue < array[j].intValue) {
                temp = array[j - gap];
                array[j - gap] = array[j];
                array[j] = temp;
                j = j - gap;
            } // while
        } // for
        
        // 增量每次都/2
        gap = gap / 2;
    } // while
    
    return array;
}

// 升序
+ (NSMutableArray *)shellSortForAscend2:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    
    // 第一层for循环用于计算gap增量值...<逐步缩小增量>
    for (int gap = count / 2; gap > 0; gap /= 2) {
        // 第二层for循环根据gap增量将array分组...<分成gap组>
        for (int i = gap; i < count; i++) {
            // 下面为常规的直接插入排序
            for (int j = i; j >= 0; j -= gap) {
                if (j - gap >= 0) {
                    NSNumber *before = array[j-gap];
                    NSNumber *after = array[j];
                    if (before.intValue > after.intValue) {
                        array[j-gap] = after;
                        array[j] = before;
                    } else {
                        break;
                    }
                }
            } // for
        } // for
    } // for
    
    return array;
}

// 降序
+ (NSMutableArray *)shellSortForDescend2:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    
    // 第一层for循环用于计算gap增量值...<逐步缩小增量>
    for (int gap = count / 2; gap > 0; gap /= 2) {
        // 第二层for循环根据gap增量将array分组...<分成gap组>
        for (int i = gap; i < count; i++) {
            // 下面为通常的直接插入排序
            for (int j = i; j >= 0; j -= gap) {
                if (j - gap >= 0) {
                    NSNumber *before = array[j-gap];
                    NSNumber *after = array[j];
                    if (before.intValue < after.intValue) {
                        array[j-gap] = after;
                        array[j] = before;
                    } else {
                        break;
                    }
                }
            } // for
        } // for
    } // for
    
    return array;
}


#pragma mark - 从后往前

// 升序
+ (NSMutableArray *)shellSortForAscend3:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    
    for (int gap = count / 2; gap > 0; gap /= 2) {
        for (int i = count - gap - 1; i >= 0; i--) {
            for (int j = i; j < count; j += gap) {
                if (j + gap < count) {
                    NSNumber *before = array[j];
                    NSNumber *after = array[j+gap];
                    if (before.intValue > after.intValue) {
                        array[j] = after;
                        array[j+gap] = before;
                    } else {
                        break;
                    }
                }
            } // for
        } // for
    } // for
    
    return array;
}

// 降序
+ (NSMutableArray *)shellSortForDescend3:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    
    for (int gap = count / 2; gap > 0; gap /= 2) {
        for (int i = count - gap - 1; i >= 0; i--) {
            for (int j = i; j < count; j += gap) {
                if (j + gap < count) {
                    NSNumber *before = array[j];
                    NSNumber *after = array[j+gap];
                    if (before.intValue < after.intValue) {
                        array[j] = after;
                        array[j+gap] = before;
                    } else {
                        break;
                    }
                }
            } // for
        } // for
    } // for
    
    return array;
}


#pragma mark - 优化

// 升序
+ (NSMutableArray *)shellSortForAscend4:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    
    // 优化1: 先判断当前数组是否已经是有序的。若是，则直接返回，无需进行排序
    // 交换次数
    int exchange = 0;
    // 先进行一轮冒泡...<是否考虑：一旦exchange>0就立即中止冒泡？>
    for (int k = count - 1; k > 0; k--) {
        NSNumber *before = array[k-1];
        NSNumber *after = array[k];
        if (before.intValue > after.intValue) {
            array[k-1] = after;
            array[k] = before;
            exchange++;
        }
    } // for
    
    // 已经是排好序的数组，无需进行排序操作了
    if (exchange == 0) {
        return array;
    }
    
    // 优化2: 对增量gap取值进行优化
    int gap = 1;
    // 先取gap最大值
    while (gap < count / 3) {
        gap = gap * 3 + 1;
    } // while
    
    while (gap > 0) {
        // 排序
        for (int i = gap; i < count; i++) {
            for (int j = i; j >= 0; j -= gap) {
                if (j - gap >= 0) {
                    NSNumber *before = array[j-gap];
                    NSNumber *after = array[j];
                    if (before.intValue > after.intValue) {
                        array[j-gap] = after;
                        array[j] = before;
                    } else {
                        break;
                    }
                }
            } // for
        } // for
        
        // 缩小增量
        gap /= 3;
    } // while
    
    return array;
}

// 降序
+ (NSMutableArray *)shellSortForDescend4:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    
    // 优化1: 先判断当前数组是否已经是有序的。若是，则直接返回，无需进行排序
    // 交换次数
    int exchange = 0;
    // 先进行一轮冒泡...<是否考虑：一旦exchange>0就立即中止冒泡？>
    for (int k = count - 1; k > 0; k--) {
        NSNumber *before = array[k-1];
        NSNumber *after = array[k];
        if (before.intValue < after.intValue) {
            array[k-1] = after;
            array[k] = before;
            exchange++;
        }
    } // for
    
    // 已经是排好序的数组，无需进行排序操作了
    if (exchange == 0) {
        return array;
    }
    
    // 优化2: 对增量gap取值进行优化
    int gap = 1;
    // 先取gap最大值
    while (gap < count / 3) {
        gap = gap * 3 + 1;
    } // while
    
    while (gap > 0) {
        // 排序
        for (int i = gap; i < count; i++) {
            for (int j = i; j >= 0; j -= gap) {
                if (j - gap >= 0) {
                    NSNumber *before = array[j-gap];
                    NSNumber *after = array[j];
                    if (before.intValue < after.intValue) {
                        array[j-gap] = after;
                        array[j] = before;
                    } else {
                        break;
                    }
                }
            } // for
        } // for
        
        // 缩小增量
        gap /= 3;
    } // while
    
    return array;
}

@end
