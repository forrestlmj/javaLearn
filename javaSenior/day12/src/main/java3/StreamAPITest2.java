import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class StreamAPITest2 {
    @Test
    public void test(){
        List<Employee> employees = EmployeeData.getEmployees();
        //练习：查询员工表中薪资大于7000的员工信息

        employees.stream()
            .filter(e -> e.getSalary() > 7000)
                .forEach(System.out::println);
        System.out.println("=====");
//        limit(n)——截断流，使其元素不超过给定数量。
        employees.stream()
                .limit(3)
                .forEach(System.out::println);
        System.out.println("=====");
        employees.stream().skip(3).limit(2).forEach(System.out::println);
        employees.add(new Employee(1010,"刘强东",40,8000));
        employees.add(new Employee(1010,"刘强东",41,8000));
        employees.add(new Employee(1010,"刘强东",40,8000));
        employees.add(new Employee(1010,"刘强东",40,8000));
        employees.add(new Employee(1010,"刘强东",40,8000));
        employees.stream().distinct().forEach(System.out::println);
    }
    @Test
    public void test2(){
        //word count
        List<String> s = new ArrayList<>();
        s.add("this is a dog");
        s.add("dog like this place");
        s.add("this is good");
    }

}
