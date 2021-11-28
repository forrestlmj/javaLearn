package generictest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyMapImpl<K, V> implements MyMap<K, V> {
    Map<K,V> m;

    public MyMapImpl() {
        this.m = new HashMap<>();
    }

    @Override
    public V get(K k) {
        return m.get(k);
    }

    @Override
    public String toString() {
        return "MyMapImpl{" +
                "m=" + m +
                '}';
    }

    @Override
    public V put(K k, V v) {
        return m.put(k, v);
    }

    @Override
    public V delete(K k) {
        return m.remove(k);
    }

    @Override
    public void putAll(List<K> k, List<V> v) {
        if(k.size() != v.size()) return;
        for (int i = 0; i < k.size(); i++) {
            m.put(k.get(i),v.get(i));
        }
    }
}
