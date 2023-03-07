import org.junit.Test;

import java.util.Date;

public class DatetimeTest {

    /**
     *     java.util.Date类
     *            |---java.sql.Date类
     *
     *     1.两个构造器的使用
     *         >构造器一：Date()：创建一个对应当前时间的Date对象
     *         >构造器二：创建指定毫秒数的Date对象
     *     2.两个方法的使用
     *         >toString():显示当前的年、月、日、时、分、秒
     *         >getTime():获取当前Date对象对应的毫秒数。（时间戳）
     *
     *     3. java.sql.Date对应着数据库中的日期类型的变量
     *         >如何实例化
     *         >如何将java.util.Date对象转换为java.sql.Date对象
     */
    @Test
    public void test2(){
        Date date = new Date();
        System.out.println(date.getTime());
        System.out.println(date.toString());

        Date date1 = new Date(1629208951890L);
        System.out.println(date1.toString());
        java.sql.Date date2 = new java.sql.Date(1629208951890L);
        System.out.println(date2);

        Date date4 = new java.sql.Date(1629208951890L);
        System.out.println(date4);

        java.sql.Date date6 = new java.sql.Date(date4.getTime());
        System.out.println(date6);
    }
    @Test
    public void test1(){

        long currentTimeMillis = System.currentTimeMillis();
        System.out.println(currentTimeMillis);
        Date date = new Date();
        System.out.println(date.getTime());

    }
}
