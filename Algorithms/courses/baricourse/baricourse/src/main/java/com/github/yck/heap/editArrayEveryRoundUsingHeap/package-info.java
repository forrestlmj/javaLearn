/**
 * @author Chengkai Yang
 * @date 2024/2/11 16:44
 * @version 1.0
 * 这类题目的套路比较明显，有如下几个特点：
 * 1. 涉及 round，一次一次的迭代某个集合，通过某种规则找到极值，然后修改这个数据，
 * 再插回到集合中，看上去很像是每一轮都在求最大值问题，或者排序问题。
 * 2. 结束的条件一般是集合为空。
 * 因此解决思路就是把整个集合放到堆中，用堆的入堆和出堆操作，代替每次在集合中找极值的过程。
 */
package com.github.yck.heap.editArrayEveryRoundUsingHeap;