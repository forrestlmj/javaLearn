import org.junit.Test;

import java.io.*;

/**
 * 对象流的使用
 * 1.ObjectInputStream 和 ObjectOutputStream
 * 2.作用：用于存储和读取基本数据类型数据或对象的处理流。它的强大之处就是可以把Java中的对象写入到数据源中，也能把对象从数据源中还原回来。
 *
 * 3.要想一个java对象是可序列化的，需要满足相应的要求。见Person.java
 *
 * 4.序列化机制：
 * 对象序列化机制允许把内存中的Java对象转换成平台无关的二进制流，从而允许把这种
 * 二进制流持久地保存在磁盘上，或通过网络将这种二进制流传输到另一个网络节点。
 * 当其它程序获取了这种二进制流，就可以恢复成原来的Java对象。

 *
 * @author shkstart
 * @create 2019 上午 10:27
 */
public class ObjectInputObjectOuputStream {
    /**
     *     序列化过程：将内存中的java对象保存到磁盘中或通过网络传输出去
     *     使用ObjectOutputStream实现
     */
    @Test
    public void testObjectOutputStream() throws IOException {
        ObjectOutputStream oos = null;
        oos = new ObjectOutputStream(new FileOutputStream("src/main/resources/my.dat"));
        oos.writeObject(new String("我爱南京"));
        oos.writeObject(new Person(new Account("中信银行",100000),"一场空",28));
        oos.close();
    }
    @Test
    public void testObjectInputStream() throws IOException, ClassNotFoundException {
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream("src/main/resources/my.datbackup"));
        Object o = ois.readObject();
        System.out.println(o);
        Object o1 = ois.readObject();
        System.out.println(o1);
    }
}
