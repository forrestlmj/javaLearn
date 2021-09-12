import java.util.*;

public class MyUtil {

    public static <T> List<T> fromArrayToList(T[] arr){
        List<T> l = new ArrayList<>();
        for (T t : arr) {
            l.add(t);
        }
        return l;
    }
    /**将KV转为Map
     * @param k
     * @param v
     * @param <K>
     * @param <V>
     * @return
     */
    public static <K,V> Map<K,V> fromTupleToMap(K k, V v){
        Map<K,V> m = new HashMap<>();
        m.put(k,v);
        return m;
    }
    public static <K,V> Map<K,V> fromListToMap(List<K> kList, List<V> vList){
        if(kList.size() != vList.size()){
            throw new RuntimeException("长度不一致");
        }
        Map<K,V> m = new HashMap<>();
        for(int i = 0;i < kList.size(); i ++) {
            m.put(kList.get(i),vList.get(i));
        }
        return m;
    }

    public static <T> Set<T> fromListToSet(List<T> list){
        Set<T> s = new HashSet<>();
        for (T t : list) {
            s.add(t);
        }
        return s;
    }
}
