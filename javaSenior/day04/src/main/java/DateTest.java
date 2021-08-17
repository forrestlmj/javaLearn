import org.junit.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTest {
    /**
     *     SimpleDateFormat的使用：SimpleDateFormat对日期Date类的格式化和解析
     *
     *     1.两个操作：
     *     1.1 格式化：日期 --->字符串
     *     1.2 解析：格式化的逆过程，字符串 ---> 日期
     *
     *     2.SimpleDateFormat的实例化
     */
    @Test
    public void testSimpleDateFormat() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
        System.out.println(sdf.format(new Date().getTime()));

        //*************按照指定的方式格式化和解析：调用带参的构造器*****************
//        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyy.MMMMM.dd GGG hh:mm aaa");

        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(sdf2.parse("2021-08-01").toString());
    }

    @Test
    public void testCalender(){
        Calendar calendar = Calendar.getInstance();
        System.out.println(calendar.getTime().toString());
        System.out.println(calendar.get(Calendar.DAY_OF_MONTH));
        System.out.println(calendar.get(Calendar.DAY_OF_YEAR));
    }

}
