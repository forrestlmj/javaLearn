package com.github.yck.heap;

import cn.hutool.captcha.generator.RandomGenerator;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.*;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/6 15:42
 */
class BinaryTreeUtil{
    public static int parentIndex(int i) {
        return (i - 1) >>> 1;
    }

    // 计算左子节点索引
    public static int leftChildIndex(int i) {
        return (i << 1) + 1;
    }

    // 计算右子节点索引
    public static int rightChildIndex(int i) {
        return (i << 1) + 2;
    }

}

//class MaxHeap extends AbstractQueue<Integer> {
//    private Integer[] data;
//    private Integer endOfArrayIndex = 0;
//    private Integer capacity;
//
//    public MaxHeap(Integer capacity) {
//        this.capacity = capacity;
//        data = new Integer[capacity];
//    }
//
//    @Override
//    public Iterator<Integer> iterator() {
//        return null;
//    }
//
//    @Override
//    public int size() {
//        return endOfArrayIndex;
//    }
//
//    @Override
//    public boolean offer(Integer e) {
//
//        if(endOfArrayIndex == 0){
//            data[endOfArrayIndex] = e;
//            endOfArrayIndex ++;
//            return true;
//        }
//        Assert.assertTrue( "堆满了，无法添加新元素",endOfArrayIndex<capacity);
//        // 1. 从尾巴插入
//        Integer tmp;
//        data[endOfArrayIndex] = e;
//        Integer index = endOfArrayIndex;
//        while(index > 0){
//            Integer parentIndex = BinaryTreeUtil.parentIndex(index);
//            if(data[parentIndex] >= e){
//                // 如果父节点比当前节点大，则退出
//                break;
//            }else {
//                // 否则当前节点晋升到父节点。
//                tmp = data[parentIndex];
//                data[parentIndex] = e;
//                data[index] = tmp;
//                index = BinaryTreeUtil.parentIndex(parentIndex);
//            }
//        }
//        endOfArrayIndex += 1;
//        return false;
//    }
//
//    @Override
//    public Integer poll() {
//        Assert.assertTrue( "heap为空",endOfArrayIndex > 0);
//
//        return null;
//    }
//
//    @Override
//    public Integer peek() {
//        Assert.assertTrue( "heap为空",endOfArrayIndex > 0);
//        return data[0];
//    }
//}

/**
 * 使用最大堆找到 TOP-N 个元素。小堆，求TopN大，大堆，求topN小
 */
public class MyHeap {
    List<Integer> data;
    @Before
    public void setup(){
        data = new ArrayList<>();
        Random random = new Random();
        for (int i = 0; i < 100; i++) {
            data.add(random.nextInt(100));
        }
        System.out.println(data);
    }
    @Test
    public void testTopN(){
        Integer heapSize = 5;
        Queue<Integer> pq = new PriorityQueue<>(heapSize);

        data.forEach(e ->
        {
            pq.offer(e);
            if (pq.size() > heapSize) {
                pq.poll();
            }
        });

        while (pq.size()>0){
            System.out.println(pq.poll());
        }
    }
    @Test
    public void testHashSort(){
        Queue<Integer> pq = new PriorityQueue<>();
        data.forEach(e -> pq.offer(e));
        while (pq.size()>0){
            System.out.println(pq.poll());
        }
    }
}
