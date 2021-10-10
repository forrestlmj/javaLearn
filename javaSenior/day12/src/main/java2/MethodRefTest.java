import org.junit.Test;

import java.util.function.Consumer;
import java.util.function.Supplier;

/**
 * 方法引用的使用
 *
 * 1.使用情境：当要传递给Lambda体的操作，已经有实现的方法了，可以使用方法引用！
 *
 * 2.方法引用，本质上就是Lambda表达式，而Lambda表达式作为函数式接口的实例。所以
 *   方法引用，也是函数式接口的实例。
 *
 * 3. 使用格式：  类(或对象) :: 方法名
 *
 * 4. 具体分为如下的三种情况：
 *    情况1     对象 :: 非静态方法
 *    情况2     类 :: 静态方法
 *
 *    情况3     类 :: 非静态方法
 *
 * 5. 方法引用使用的要求：要求接口中的抽象方法的形参列表和返回值类型与方法引用的方法的
 *    形参列表和返回值类型相同！（针对于情况1和情况2）
 *
 * Created by shkstart.
 */
public class MethodRefTest {
    @Test
    public void test(){
        Consumer<String> c = System.out::println;
        c.accept("sdf");

    }
    @Test
    public void test2(){
        Employee emp = new Employee(1001, "马化腾", 34, 6000.38);

        Supplier<String> s = emp::getName;
        System.out.println(s.get());
    }
}
