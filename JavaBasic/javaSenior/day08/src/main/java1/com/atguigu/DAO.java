package com.atguigu;

import java.util.List;

public class DAO<T>{
    public void add(T t){

    }
    public boolean remove(T t){
        return true;
    }

    public boolean update(int index, T t){
        return true;
    }

    public T get(int index){
        return null;
    }

    public List<T> getList(int index){
        return null;
    }

    public <E> E getValue(){
        return null;
    }
}
