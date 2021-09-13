package com.atguigu;

import java.util.ArrayList;
import java.util.List;

public class SubOrder<T> extends Order<T> {
    private List<T> sublist = new ArrayList<>();
    public List<T> makeSubList(T order){
        sublist.add(order);
        return sublist;
    }
}
