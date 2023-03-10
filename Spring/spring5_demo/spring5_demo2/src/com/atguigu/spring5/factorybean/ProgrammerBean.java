package com.atguigu.spring5.factorybean;

import com.atguigu.spring5.bean.Programmer;
import org.springframework.beans.factory.FactoryBean;

public class ProgrammerBean implements FactoryBean<Programmer> {
    @Override
    public Programmer getObject() throws Exception {
        Programmer ck = new Programmer("CK");
        return ck;
    }

    @Override
    public Class<?> getObjectType() {
        return null;
    }
}
