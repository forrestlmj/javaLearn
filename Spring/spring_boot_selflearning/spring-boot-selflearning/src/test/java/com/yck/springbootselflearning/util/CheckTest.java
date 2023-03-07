package com.yck.springbootselflearning.util;

import com.yck.springbootselflearning.dao.Stu;
import org.junit.Test;

import static org.junit.Assert.*;

public class CheckTest {

    @Test
    public void allFieldIsNotNull() {
    }

    @Test
    public void allFieldIsNull() {
        Stu stu = new Stu();
        assertTrue(Check.AllFieldIsNull(stu));
        assertFalse(Check.AllFieldIsNotNull(stu));

        stu.setId("sdf");
        assertFalse(Check.AllFieldIsNull(stu));
        stu.setName("name");
        stu.setGender("gender");
        stu.setTel("tel");
        assertTrue(Check.AllFieldIsNotNull(stu));
    }
}