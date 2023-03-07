import org.junit.Test;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

public class EmployeeTest {
    @Test
    public void test(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        System.out.println(sdf.format(date));
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        instance.add(0,1);
        LocalDateTime now = LocalDateTime.now();
        System.out.println(now);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        System.out.println(now.format(formatter));

    }
    @Test
    public void test2(){
        Map<Employee,String> m = new TreeMap<>();
        m.put(new Employee("Eminem",34,new MyDate(2021,1,1)),"nick name");
        m.put(new Employee("Tupac",44,new MyDate(1999,1,2)),"dead");
        m.put(new Employee("BIG",43,new MyDate(1999,1,2)),"BIG");
        for (Map.Entry<Employee, String> employeeStringEntry : m.entrySet()) {
            System.out.println(employeeStringEntry);
        }
    }
}
