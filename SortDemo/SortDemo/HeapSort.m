//
//  HeapSort.m
//  SortDemo
//
//  Created by 夏志勇 on 2019/11/20.
//  Copyright © 2019 夏志勇. All rights reserved.
//

#import "HeapSort.h"

@implementation HeapSort


#pragma mark -

//+ (NSArray *)heapSort:(NSArray *)list {
//    // 可变数组
//    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
//    // 数组长度
//    int count = (int)array.count;
//
//    // 创建初始堆...<即：将数据中元素按堆结构重新排序>
//    for (int i = count / 2 - 1; i >= 0; i--) {
////        [HeapSort heapAdjust:array length:count parent:i];
//        [HeapSort heapAdjust2:array length:count parent:i];
//    } // for
//
//    // 进行n-1次循环，完成排序
//    for (int i = count - 1; i > 0; i--) {
//        // 最后一个元素和第一个元素进行交换
//        NSNumber *temp = array[i];
//        array[i] = array[0];
//        array[0] = temp;
//
//        // 筛选R[0]结点，得到i-1个结点的堆
////        [HeapSort heapAdjust:array length:i parent:0];
//        [HeapSort heapAdjust2:array length:i parent:0];
//    } // for
//
//    return array;
//}


#pragma mark - 升序...<大顶堆/大根堆>

// 创建初始堆 or 对堆进行筛选调整
+ (void)heapAdjust:(NSMutableArray<NSNumber *> *)list length:(int)length parent:(int)parent {
    // 保存当前父结点
    NSNumber *temp = list[parent];
    // 先获得左子结点（左孩子）索引
    int child = 2 * parent + 1;
 
    while (child < length) {
        // 如果有右子结点（右孩子），并且右子结点（右孩子）的值大于左子结点（左孩子）的值，则选取右子结点（右孩子）
        if (child + 1 < length && list[child].intValue < list[child + 1].intValue) {
            child++;
        }
        
        // 如果父结点的值>=左右两结点的值，则不进行交换
        if (temp.intValue >= list[child].intValue) {
            break;
        }
        
        // 把子结点的值赋给父结点...<向上赋值>
        list[parent] = list[child];
        
        // 选取子结点的左子结点，继续向下筛选
        parent = child;
        child = 2 * parent + 1;
    } // while
    
    list[parent] = temp;
}


#pragma mark - 降序...<小顶堆/小根堆>

// 创建初始堆 or 对堆进行筛选调整
+ (void)heapAdjust2:(NSMutableArray<NSNumber *> *)list length:(int)length parent:(int)parent {
    // 保存当前父结点
    NSNumber *temp = list[parent];
    // 先获得左子结点（左孩子）索引
    int child = 2 * parent + 1;
 
    while (child < length) {
        // 如果有右子结点（右孩子），并且右子结点（右孩子）的值大于左子结点（左孩子）的值，则选取右子结点（右孩子）
        if (child + 1 < length && list[child].intValue > list[child + 1].intValue) {
            child++;
        }
        
        // 如果父结点的值<=左右两结点的值，则不进行交换
        if (temp.intValue <= list[child].intValue) {
            break;
        }
        
        // 把子结点的值赋给父结点
        list[parent] = list[child];
        
        // 选取子结点的左子结点，继续向下筛选
        parent = child;
        child = 2 * parent + 1;
    } // while
    
    list[parent] = temp;
}


#pragma mark -

+ (NSMutableArray *)heapSort:(NSArray *)list {
    // 可变数组
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithArray:list];
    // 数组长度
    int count = (int)array.count;
    
    // 初始化堆...<初始化完成后，堆的根结点元素即为最大值元素，且所有父结点元素值都比子孙结点元素值大>
    for (int i = count / 2 - 1; i >= 0; i--) {
//        [HeapSort heapUpdate:array length:count parent:i];
        [HeapSort heapUpdate2:array length:count parent:i];
    } // for
    
    // 遍历count-1次，依次获取count-1个大值元素
    // 各大值元素按值的大小依次填充到count-1、count-2、count-3等位置...[从后往前排]
    for (int i = count - 1; i > 0; i--) {
        // 交换首尾两个元素，即输出(筛选出)当前数组长度i+1内的最大值，将最大值保存在最后i位置。
        id number = array[i];
        array[i] = array[0];
        array[0] = number;
        
        // 对当前长度i数组进行筛选调整，组成新的堆；便于后续筛选出最大值R[0]结点，得到i-1个结点的堆
//        [HeapSort heapUpdate:array length:i parent:0];
        [HeapSort heapUpdate2:array length:i parent:0];
    } // for
    
    return array;
}

/*
 说明：
 当前的调整堆方法主要针对两个阶段：
 1. 将原始数组转换成堆（此处为大顶堆）...[需要迭代多次]
 2. 在输出了一个最大值后，调用此方法，再次将数组转换成堆，本质是将根结点下沉到合适位置，让最大值上浮到根结点处，且parent参数恒为0，永远从根结点开始...[仅需要迭代一次]
 */

// 对数组进行调整...<大顶堆>
+ (void)heapUpdate:(NSMutableArray<NSNumber *> *)list length:(int)length parent:(int)parent {
    // 临时保存父结点元素
    NSNumber *temp = list[parent];
    // 获取当前父结点的左子结点索引
    int child = 2 * parent + 1;
    
    //
    while (child < length) {
        // 若存在右子结点，且右子结点元素值大于左子结点元素值，则以右子结点索引为准
        if (child + 1 < length && list[child].intValue < list[child + 1].intValue) {
            child++;
        }
        
        // 若子结点元素值比父结点元素值小，则不进行交换
        if (list[child].intValue < temp.intValue) {
            break;
        }
        
        // 子结点元素值比父结点元素值大，将子结点元素填充到父结点
        list[parent] = list[child];
        
        // 继续向下调整
        parent = child;
        child = 2 * parent + 1;
    } // while
    
    //
    list[parent] = temp;
}

// 对数组进行调整...<小顶堆>
+ (void)heapUpdate2:(NSMutableArray<NSNumber *> *)list length:(int)length parent:(int)parent {
    // 临时保存父结点元素
    NSNumber *temp = list[parent];
    // 获取当前父结点的左子结点索引
    int child = 2 * parent + 1;
    
    //
    while (child < length) {
        // 若存在右子结点，且右子结点元素值小于左子结点元素值，则以右子结点索引为准
        if (child + 1 < length && list[child].intValue > list[child + 1].intValue) {
            child++;
        }
        
        // 若子结点元素值比父结点元素值大，则不进行交换
        if (list[child].intValue > temp.intValue) {
            break;
        }
        
        // 子结点元素值比父结点元素值小，将子结点元素填充到父结点
        list[parent] = list[child];
        
        // 继续向下调整
        parent = child;
        child = 2 * parent + 1;
    } // while
    
    //
    list[parent] = temp;
}

@end
