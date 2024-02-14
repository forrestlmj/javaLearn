package com.github.yck.sort.mergesort;

import com.github.yck.util.MyTool;
import org.junit.Assert;
import org.junit.Test;

import java.util.*;

/**
 * @author Chengkai Yang
 * @version 1.0
 * @date 2024/2/13 21:11
 */

class TwoWayMerge{

    /**
     * 使用迭代的方式进行2-way-merge todo 看gpt写的学习下
     * @param a
     * @return
     */
    public static List<Integer> twoWayMergeSortIterative(List<Integer> a){
        List<Integer> tmpA =  new ArrayList<>(a.size());
        boolean tmpASliceFlag = true;
        List<Integer> tmpB =  new ArrayList<>(a.size());
        tmpB.addAll(a);
        tmpA.addAll(a);
        Integer slice = 1;

        while(slice<a.size()){
            slice = 2*slice;
            if(tmpASliceFlag){
                // a 复制到 b
                int idx = 0;
                while (idx<a.size()){
                    int start = idx;
                    int end = idx+slice<a.size() ? idx+slice:slice/2;
                    int mid = start + (end-start)/2;
                    List<Integer> mergedResult = merge(tmpA.subList(start, mid), tmpA.subList(mid, end));
                    for (Integer ele : mergedResult) {
                        tmpB.set(start,ele);
                        start++;
                    }
                    idx = end;
                }
                tmpASliceFlag = false;
            }else {
                // b 复制到 a
                int idx = 0;
                while (idx<a.size()){
                    int start = idx;
                    int end = idx+slice<a.size() ? idx+slice:slice/2;
                    int mid = start + (end-start)/2;
                    List<Integer> mergedResult = merge(tmpB.subList(start, mid), tmpB.subList(mid, end));
                    for (Integer ele : mergedResult) {
                        tmpA.set(start,ele);
                        start++;
                    }

                    idx = end;
                }
                tmpASliceFlag = true;

            }
        }
        if(tmpASliceFlag){
            return tmpA;
        }else {
            return tmpB;
        }
    }
    /**
     * 将 2 个有序的列表合并为一个列表
     * @param a 有序的列表
     * @param b 有序的列表
     * @return 合并后的列表
     */
    public static List<Integer> merge(List<Integer> a, List<Integer> b){
        List<Integer> re = new LinkedList<>();
        Integer i=0;
        Integer j=0;
        Integer reIdx = 0;
        while (i<a.size() && j<b.size()){
            if (a.get(i) < b.get(j)){
                re.add(a.get(i));
                i++;
            }else {
                re.add(b.get(j));
                j++;
            }
            reIdx ++;
        }
        while (i<a.size()){
            re.add(a.get(i));
            i++;
        }
        while (j<b.size()){
            re.add(b.get(j));
            j++;
        }
        return re;
    }
}
public class TwoWayMergeTest {

    @Test
    public void testTwoWayMergeSort(){
        List<Integer> a = MyTool.generateRandomList(10, 100);
//        System.out.println(a);
        List<Integer> re = TwoWayMerge.twoWayMergeSortIterative(a);
        System.out.println(re);
        Collections.sort(a);
    }

    /**
     * 测试
     */
    @Test
    public void test(){
        List<Integer> a = MyTool.generateRandomList(5, 100);
        List<Integer> b = MyTool.generateRandomList(7, 100);
        Collections.sort(a);
        Collections.sort(b);

        List<Integer> result = TwoWayMerge.merge(a, b);

        a.addAll(b);
        Collections.sort(a);

        Assert.assertEquals(a,result);
    }

}
