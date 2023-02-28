package com.github.yck.pattern.prototype.shallowcopping;

import com.github.yck.pattern.creational.prototype.shallowcopping.Address;
import com.github.yck.pattern.creational.prototype.shallowcopping.Person;
import com.github.yck.pattern.creational.prototype.shallowcopping.ShallowCopy;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.HashMap;

import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * <p>
 *     当值不更新时候，无论是 Immutable 还是 Mutable 对象，浅拷贝只会克隆成员变量的引用。
 * <li> 对于 8 种基本数据类型及其包装类、String类、遗留类（HashTable）这些 Immutable 对象，
 * 当改变其值，新的引用给新值，旧的引用给旧值，所以既不 equals 也不 same
 * <li> 对于 其他类，由于是 Mutable 的，值更新，新旧引用依然指向同一值，所以 equal 又 same
 * @see ShallowCopy ShallowCopy的测试类
 * @see <a href="https://www.javatpoint.com/mutable-and-immutable-in-java"> For example, primitive objects such as int, long, float, double, all legacy classes,
 * Wrapper class, String class, etc. </a>
 */
public class ShallowCopyTest {
    Person p1;
    Person dolly;
    @BeforeEach
    public void prepare() {
        HashMap<String, String> hashMap = new HashMap<String, String>() {{
            put("located", "China");
            put("food", "salty");
        }};
        Address address = new Address("TJ",hashMap
                );
        p1 = new Person("yck",
                18,'M',address,new int[]{1,2,3}
        );

        try {
            dolly = (Person) p1.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
    }

    @Test
    @DisplayName("得出各个成员变量的 Hashcode，证明指向统一地址")
    public void test1() throws CloneNotSupportedException {

        assertAll("测试不同数据类型",
                // 字符串
                () -> assertSame(dolly.getName(), p1.getName(), "String 类型指向的统一数据类型"),

//                () -> assertSame("yck", "yck", "这里源代码直接近常量池"),
//                () -> assertNotSame("yck", new String("yck"), "只要是 new 的就不一样"),
//                () -> assertNotSame(new String("yck"), new String("yck"), "只要是 new 的就不一样"),
//                () -> assertNotSame(new String("yck"), new String("yck"), "只要是 new 的就不一样"),

                () -> assertNotSame(dolly.getName(), new String("yck"), "证明两个值一样的 String 是两个对象"),
                () -> assertSame(dolly.getName().intern(), "yck", "intern() 后肯定一样"),
                // Address
                () -> assertSame(dolly.getAddress(), p1.getAddress(), "Address 一样"),
                () -> assertSame(dolly.getAge(), p1.getAge(), "Integer 一样")
        );
    }
    @Test
    @DisplayName("改变p1的Address，dolly 也会改变，这就是浅拷贝的问题")
    public void test2(){
        assertAll("P1修改之前",
                () -> assertEquals(dolly.getName(),"yck","姓名"),
                () ->assertEquals(dolly.getAge(),18,"年龄"),
                () ->assertEquals(dolly.getSex(),'M',"性别"),

                () ->assertEquals(dolly.getAddress().getAddressName(),"TJ","注意，" +
                        "等于TJ"),
                () -> assertSame(dolly.getAge(), p1.getAge(), "变换之前，Integer地址 一样")

        );
        p1.setName("wsn");
        p1.setAge(15);
        p1.setSex('F');
        p1.getAddress().setAddressName("Canada");

        assertAll("P1修改之后，基本数据类型与包装类都不影响，但是类影响了",
                () -> assertEquals(dolly.getName(),"yck","姓名"),
                () ->assertEquals(dolly.getAge(),18,"年龄"),
                () ->assertEquals(dolly.getSex(),'M',"性别"),

                () ->assertNotEquals(dolly.getAddress().getAddressName(),"TJ","注意，" +
                        "不等于TJ了"),
                () ->assertEquals(dolly.getAddress().getAddressName(),"Canada","注意，" +
                        "等于 Canada 了"),

                () -> assertNotSame(dolly.getAge(), p1.getAge(), "由于p1地址变了，Integer应该是不可变的，所以这里也不相等了"),
        () -> assertNotSame(dolly.getName(), p1.getName(), "由于p1地址变了，String应该是不可变的，所以这里也不相等了")

        );


    }
}