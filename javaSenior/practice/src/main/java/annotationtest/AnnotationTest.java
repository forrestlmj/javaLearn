package annotationtest;

import org.junit.Test;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

public class AnnotationTest {
    @Test
    public void test(){
        JDBC jdbc = new JDBC();
        for (Field declaredField : jdbc.getClass().getDeclaredFields()) {
            for (Annotation annotation : declaredField.getAnnotations()) {
                System.out.println(annotation);

            }
        }
    }
}
