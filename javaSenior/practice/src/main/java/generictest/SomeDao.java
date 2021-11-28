package generictest;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SomeDao<T extends Father<String>>{
    public <T> List<T> toArray(T[] list){
        List<T> a = new ArrayList<>();
        for (T t : list) {
            a.add(t);
        }
        return a;
    };
    public void print(List<T> a){
        for (T t : a) {
            System.out.println(t);
        }
    }
}
