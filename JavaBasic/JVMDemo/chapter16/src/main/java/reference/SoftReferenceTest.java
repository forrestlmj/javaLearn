package reference;

import java.lang.ref.SoftReference;

/**
 * -Xms90m -Xmx90m
 * 弱引用的测试
 * 当gc时候内存不够的时候，就释放掉该对象。
 */
public class SoftReferenceTest {
    public static class User{
        @Override
        public String toString() {
            return "User{" +
                    "id=" + id +
                    ", name='" + name + '\'' +
                    '}';
        }

        public User(Integer id, String name) {
            this.id = id;
            this.name = name;
//            this.data = new byte[1024 * 1024 * 50];
        }

        private Integer id;
        private String name;
        private byte[] data;

        public void setData(byte[] data) {
            this.data = data;
        }
    }
    private static final Integer DATA_SIZE = 1024 * 1024 * 50;
    public static void main(String[] args) {
        SoftReference<User> u = new SoftReference<User>(
                new User(1,"s"));
        u.get().setData(new byte[DATA_SIZE]);
        System.out.println(u.get());
        User s = new User(2, "s");
        // 如果设置申请了过多内存，则会导致gc发生，引起内存不够
        s.setData(new byte[DATA_SIZE]);

        System.out.println(u.get());
    }
}
