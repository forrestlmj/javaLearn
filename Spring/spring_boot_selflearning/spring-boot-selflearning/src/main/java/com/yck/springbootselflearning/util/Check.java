package com.yck.springbootselflearning.util;

import java.lang.reflect.Field;
import java.util.Objects;

/**
 * @author ：yangchengkai@yunzhangfang.com
 * @description：TODO
 * @date ：2021/1/14 下午4:48
 */


public class Check {
    public static boolean AllFieldIsNotNull(Object o) {
        try {
            for (Field field : o.getClass().getDeclaredFields()) {
                //把私有属性公有化
                field.setAccessible(true);
                Object object = field.get(o);
                if (Objects.isNull(object)) {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    public static boolean AllFieldIsNull(Object o) {
        try {
            for (Field field : o.getClass().getDeclaredFields()) {
                //把私有属性公有化
                field.setAccessible(true);
                Object object = field.get(o);
                if (!Objects.isNull(object)) {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
