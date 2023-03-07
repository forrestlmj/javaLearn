package com.github.yck.uml.dependency;

/**
 * Dependence，依赖关系，其实就是编译器能不能通过
 * 1. 类变量
 * 2. 方法参数
 * 3. 方法返回的数据类型
 * 4. 方法中使用到（就是局部变量）
 */
public class PersonServiceDao {
    private PersonDao ps;
    public void save(Person p){

    }
    public IDCard getIdCard(Integer id){return new IDCard();
    }
    public void modify(){}
}

class Person{

}

class IDCard{

}

class Departure{

}
class PersonDao{

}
