package com.atguigu;

import org.junit.Test;

public class DAOTest {
    @Test
    public void test1(){
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.add(new Customer());
        customerDAO.remove(new Customer());

        StudentDAO studentDAO = new StudentDAO();
        studentDAO.remove(new Student2());
    }
}
