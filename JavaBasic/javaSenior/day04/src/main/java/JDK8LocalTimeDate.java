import org.junit.Test;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;

public class JDK8LocalTimeDate {


    /**
     *     LocalDate、LocalTime、LocalDateTime 的使用
     *     说明：
     *         1.LocalDateTime相较于LocalDate、LocalTime，使用频率要高
     *         2.类似于Calendar
     */
    @Test
    public void test1(){
        LocalDateTime now = LocalDateTime.now();
        System.out.println(now);

        LocalDateTime of = LocalDateTime.of(1993, 2, 7, 7, 10, 10);
        System.out.println(of);

        int year = of.getYear();
        System.out.println(of.plusYears(20));
        System.out.println(now.plusMonths(10).plusYears(10));
        System.out.println(now.minusYears(10));
    }

    /**
     *     Instant的使用
     *     类似于 java.util.Date类
     */
    @Test
    public void test2(){
        Instant now = Instant.now();
        System.out.println(now);

    }

    /**
     *     DateTimeFormatter:格式化或解析日期、时间
     *     类似于SimpleDateFormat
     */
    @Test
    public void test3(){
//        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd h:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        System.out.println(formatter.format(now));

        TemporalAccessor parse = DateTimeFormatter.ofPattern("yyyy-MM-dd").parse("2021-01-02");

    }
}
