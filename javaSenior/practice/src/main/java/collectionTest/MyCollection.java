package collectionTest;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;

public class MyCollection<T> implements Collection<T> {
    private T[] a = (T[]) new Object[]{};

    private int size;

    public MyCollection() {
    }

    @Override
    public int size() {

        return a.length;
    }

    @Override
    public boolean isEmpty() {
        if(a.length == 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean contains(Object o) {
        for (T t : a) {
            if (o.equals(t)){
                return true;
            }
        }
        return false;
    }

    @Override
    public Iterator<T> iterator() {

        return new Iter(a.length);
    }
    private class Iter implements Iterator<T>{
        int curse = 0;
        int length;
        public Iter(int length){
            this.length = length;
        }
        @Override
        public boolean hasNext() {
            return curse < a.length;
        }

        @Override
        public T next() {

            T nextElement = a[curse];
            curse ++;
            return nextElement;
        }

        @Override
        public void remove() {
            MyCollection.this.remove(a[curse-1]);
        }
    }
    @Override
    public Object[] toArray() {
        return new Object[0];
    }

    @Override
    public <T1> T1[] toArray(T1[] a) {
        return a;
//        return null;
    }

    @Override
    public String toString() {
        int size = this.size();
        return "MyCollection{" +
                "a=" + Arrays.toString(a) +
                ", size=" + this.size +
                '}';
    }

    @Override
    public boolean add(T t) {
        T[] tmp = (T[]) new Object[(a.length+1)];
        System.arraycopy(a,0,tmp,0,a.length);
        a = tmp;
        a[a.length - 1 ] = t;
        return true;
    }

    @Override
    public boolean remove(Object o) {
        T[] tmp = (T[]) new Object[a.length - 1];
        for (int i = 0; i < a.length; i++) {
            if(a[i].equals(o)){
                System.arraycopy(a,0,tmp,0,i);
                System.arraycopy(a,i+1,tmp,i,a.length-1-i);
                a = tmp;
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean containsAll(Collection<?> c) {
        return false;
    }

    @Override
    public boolean addAll(Collection<? extends T> c) {
        return false;
    }

    @Override
    public boolean removeAll(Collection<?> c) {
        return false;
    }

    @Override
    public boolean retainAll(Collection<?> c) {
        return false;
    }

    @Override
    public void clear() {
        a = (T[]) new Object[0];
    }
}
