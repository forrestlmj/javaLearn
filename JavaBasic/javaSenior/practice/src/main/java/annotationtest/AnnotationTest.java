package annotationtest;

import org.junit.Test;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

public class AnnotationTest {
    @Test
    public void test() throws IllegalAccessException {
        JDBC jdbc = new JDBC();
        Class<JDBC> jdbcClass = JDBC.class;

        for (Field declaredField : jdbcClass.getDeclaredFields()) {
            for (Annotation annotation : declaredField.getAnnotations()) {
                declaredField.setAccessible(true);
                if(annotation.annotationType().equals(InjectValue.class)){
                    String value = ((InjectValue) annotation).value();
                    if (declaredField.getType().equals(String.class)) {
                        declaredField.set(jdbc,value);
                    }
                    if(declaredField.getType().equals(int.class)){
                        declaredField.set(jdbc,Integer.valueOf(value));
                    }
                }
            }
        }
        System.out.println(jdbc);
    }
}
