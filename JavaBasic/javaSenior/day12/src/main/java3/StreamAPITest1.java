import org.junit.Test;

import java.util.List;
import java.util.Random;
import java.util.stream.Stream;

/**
 * 1. Stream关注的是对数据的运算，与CPU打交道
 *    集合关注的是数据的存储，与内存打交道
 *
 * 2.
 * ①Stream 自己不会存储元素。
 * ②Stream 不会改变源对象。相反，他们会返回一个持有结果的新Stream。
 * ③Stream 操作是延迟执行的。这意味着他们会等到需要结果的时候才执行
 *
 * 3.Stream 执行流程
 * ① Stream的实例化
 * ② 一系列的中间操作（过滤、映射、...)
 * ③ 终止操作
 *
 * 4.说明：
 * 4.1 一个中间操作链，对数据源的数据进行处理
 * 4.2 一旦执行终止操作，就执行中间操作链，并产生结果。之后，不会再被使用
 *
 *
 *  测试Stream的实例化
 *
 * @author shkstart
 * @create 2019 下午 4:25
 */
public class StreamAPITest1 {
    //创建 Stream方式一：通过集合

    @Test
    public void test1(){
        List<Employee> employees = EmployeeData.getEmployees();
        Stream<Employee> stream = employees.stream();
        stream.filter( s -> s.getAge()>20).forEach(System.out::println);
    }
    //创建 Stream方式三：通过Stream的of()
    @Test
    public void test3(){

        Stream<Integer> stream = Stream.of(1, 2, 3, 4, 5, 6);

    }
    //创建 Stream方式四：创建无限流

    @Test
    public void test4(){
        Stream.iterate(0, t -> t+2).limit(10).forEach(System.out::println);
        Random random = new Random();
        Stream.generate(random::nextInt).limit(10).forEach(System.out::println);
    }
}
