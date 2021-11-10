package utiltest;

import org.junit.Test;

import java.text.SimpleDateFormat;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

/**
 * Date()
 * SimpleDateFormatter
 *
 * Calender
 *
 * LocalDate
 * LocalTime
 * LocalDateTime
 * DateTimeFormatter
 */
public class DateTimeTest {
    @Test
    public void testDate(){
        Date date = new Date();
        System.out.println(date);
        Date date1 = new Date(2021, 10, 31, 18, 18, 30);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S");
        System.out.println(sdf.format(date));
        System.out.println(sdf.format(date1));
        System.out.println(sdf.format(new Date()));
    }

    @Test
    public void testCalender(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        System.out.println(cal);
        
        System.out.println(cal.getTimeZone());
//        cal.add(Calendar.HOUR,3);
//        cal.add(Calendar.DAY_OF_MONTH,1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.s");

        System.out.println(sdf.format(cal.getTime()));
    }
}
