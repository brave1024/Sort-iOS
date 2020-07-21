//
//  QuickSort.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/18.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

+ (NSArray *)quickSort:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    // 排序
//    [QuickSort sort:array low:0 high:count - 1];
//    [QuickSort sort2:array low:0 high:count - 1];
//    [QuickSort sort3:array low:0 high:count - 1];
    [QuickSort sort4:array low:0 high:count - 1];
    return array;
}


#pragma mark - 基准元素从前面(左边)取

// 升序...[递归]
+ (void)sort:(NSMutableArray<NSNumber *> *)list low:(int)low high:(int)high {
    if (low >= high) {
        return;
    }
    
    // 起始位置索引
    int i = low;
    // 结尾位置索引
    int j = high;
    // 基准元素数据...<默认为第0个元素>
    NSNumber *key = list[i];
    
    while (i < j) {
        // 从右边开始比较，比key大的元素位置不变
        while (i < j && list[j].intValue > key.intValue) {
            j--;
        } // while
        // 只要出现一个比key小的元素，将这个元素放入左边i的位置
        list[i] = list[j];
        
        // 从左边开始比较，比key小的元素位置不变
        while (i < j && list[i].intValue < key.intValue) {
            i++;
        } // while
        // 只要出现一个比key大的元素，将这个元素放入右边j的位置
        list[j] = list[i];
    } // while
    
    // 将key放入i的位置，则左侧元素都比key小，右侧元素都比key大...[跳出循环时i和j相等，此时的i或j就是key的正确索引位置]
    list[i] = key;
    // 左递归
    [QuickSort sort:list low:low high:i-1];
    // 右递归
    [QuickSort sort:list low:i+1 high:high];
    
    return;
}

// 降序...[递归]
+ (void)sort2:(NSMutableArray<NSNumber *> *)list low:(int)low high:(int)high {
    if (low >= high) {
        return;
    }
    
    // 起始位置索引
    int i = low;
    // 结尾位置索引
    int j = high;
    // 基准元素数据...<默认为第0个元素>
    NSNumber *key = list[i];
    
    while (i < j) {
        // 从右边开始比较，比key小的元素位置不变
        while (i < j && list[j].intValue < key.intValue) {
            j--;
        } // while
        // 只要出现一个比key大的元素，将这个元素放入左边i的位置
        list[i] = list[j];
        
        // 从左边开始比较，比key大的元素位置不变
        while (i < j && list[i].intValue > key.intValue) {
            i++;
        } // while
        // 只要出现一个比key小的元素，将这个元素放入右边j的位置
        list[j] = list[i];
    } // while
    
    // 将key放入i的位置，则左侧元素都比key小，右侧元素都比key大...[跳出循环时i和j相等，此时的i或j就是key的正确索引位置]
    list[i] = key;
    // 左递归
    [QuickSort sort2:list low:low high:i-1];
    // 右递归
    [QuickSort sort2:list low:i+1 high:high];
    
    return;
}


#pragma mark - 基准元素从后面(右边)取

// 升序...[递归]
+ (void)sort3:(NSMutableArray<NSNumber *> *)list low:(int)low high:(int)high {
    if (low >= high) {
        return;
    }
    
    // 起始位置索引
    int i = low;
    // 结尾位置索引
    int j = high;
    // 基准元素数据...<默认为最后一个元素>
    NSNumber *key = list[j];
    
    while (i < j) {
        while (i < j && list[i].intValue < key.intValue) {
            i++;
        }
        list[j] = list[i];
        
        while (i < j && list[j].intValue > key.intValue) {
            j--;
        }
        list[i] = list[j];
    } // while
    
    // 将key放入i的位置，则左侧元素都比key小，右侧元素都比key大
    list[j] = key;
    // 左递归
    [QuickSort sort3:list low:low high:i-1];
    // 右递归
    [QuickSort sort3:list low:i+1 high:high];
    
    return;
}

//  降序...[递归]
+ (void)sort4:(NSMutableArray<NSNumber *> *)list low:(int)low high:(int)high {
    if (low >= high) {
        return;
    }
    
    // 起始位置索引
    int i = low;
    // 结尾位置索引
    int j = high;
    // 基准元素数据...<默认为最后一个元素>
    NSNumber *key = list[j];
    
    while (i < j) {
        while (i < j && list[i].intValue > key.intValue) {
            i++;
        }
        list[j] = list[i];
        
        while (i < j && list[j].intValue < key.intValue) {
            j--;
        }
        list[i] = list[j];
    } // while
    
    // 将key放入i的位置，则左侧元素都比key小，右侧元素都比key大
    list[j] = key;
    // 左递归
    [QuickSort sort4:list low:low high:i-1];
    // 右递归
    [QuickSort sort4:list low:i+1 high:high];
    
    return;
}



@end
