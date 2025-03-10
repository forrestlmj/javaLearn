/**
 * @author Chengkai Yang
 * @date 2024/2/11 16:32
 * @version 1.0
 *
 * 这一类题目的特定就是使用堆的特性，在遍历的同时
 * 找到topN。
 * track 点在于，除了要计算优先级外，还需要在结果中带着此类优先级的相关信息。
 * 有两种方法获取相关信息
 * 1. 将所有信息封装为 Bean，并实现 Comparable 接口，比较时候用涉及到优先级的字段。
 * 2. 使用 Map 等信息进行存储，不推荐，代码看上去比较乱。
 *
 * 一般推荐使用方法1。
 * 另外容易考察的点就是输入时候，要把信息拷贝到bean中。
 * 输出时候：将堆中数据 poll 出来，同时把附加信息正确输出。
 */
package com.github.yck.heap.iterativeUsingHeap;