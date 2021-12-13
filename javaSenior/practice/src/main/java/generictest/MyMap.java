package generictest;

import java.util.List;

public interface MyMap<K,V> {
    V get(K k);
    V put(K k, V v);
    V delete(K k);
    void putAll(List<K> k,List<V> v);

}
