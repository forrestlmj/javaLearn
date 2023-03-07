package com.github.yck.principle.demeter.improve;

import java.util.ArrayList;
import java.util.List;

public class Demeter2 {
    public static void main(String[] args) {
        EmployeeManager e = new EmployeeManager();
        CollegeEmployeeManager c = new CollegeEmployeeManager();
        c.printAllEmployee(e);
    }
}
class Employee{
    private Integer id;

    public Employee(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                '}';
    }
}
class CollegeEmployee{
    private Integer id;

    public CollegeEmployee(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "CollegeEmployee{" +
                "id=" + id +
                '}';
    }
}

class EmployeeManager{
    public List<Employee> getAllEmployee(){
        List<Employee> e = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            e.add(new Employee(i));
        }
        return e;
    }
    public void printAllEmployees(){
        for (Employee employee : this.getAllEmployee()) {
            System.out.println(employee);
        }
    }
}

class CollegeEmployeeManager{
    public List<CollegeEmployee> getAllCollegeEmployee(){
        List<CollegeEmployee> e = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            e.add(new CollegeEmployee(i));
        }
        return e;
    }
    public void printAllEmployee(EmployeeManager sub){
        // Print every member of the Employee.
        // 这里出现了 Employee 是局部变量，所以不满足 demeter 原则
        // 改进方法是把这个方法放到 EmployeeManager 中，然后调用
//        for (Employee : sub.getAllEmployee()) {
//            System.out.println(employee);
//        }
        sub.printAllEmployees();
        // Print every member of the College Employee.
        for (CollegeEmployee collegeEmployee : getAllCollegeEmployee()) {
            System.out.println(collegeEmployee);
        }

    }
}