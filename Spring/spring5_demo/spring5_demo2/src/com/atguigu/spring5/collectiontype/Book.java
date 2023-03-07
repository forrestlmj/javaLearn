package com.atguigu.spring5.collectiontype;

import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/14/20 3:31 PM
 */


public class Book {
    private List<String> list;

//    @Override
//    public String toString() {
//        return "Book{" +
//                "list=" + list +
//                '}';
//    }

    public void setList(List<String> list) {
        this.list = list;
    }
}
