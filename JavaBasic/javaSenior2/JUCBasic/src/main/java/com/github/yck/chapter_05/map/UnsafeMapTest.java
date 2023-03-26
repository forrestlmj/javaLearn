package com.github.yck.chapter_05.map;

import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedDeque;

/**
 * {@link ConcurrentHashMap }中加入了 Segment 的概念，在线程安全的基础
 * 上提高了并发度。Segment中的东西涉及到更多 JUC 相关的知识。之后 再看。
 */
public class UnsafeMapTest {
    public static void main(String[] args) {
        ConcurrentHashMap<Object, Object> map = new ConcurrentHashMap<>();
        HashMap<Object, Object> m = new HashMap<>();
    }
}
