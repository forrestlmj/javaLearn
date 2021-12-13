package annotationtest;

import java.lang.annotation.*;

@Target(value = {ElementType.FIELD,ElementType.PARAMETER,ElementType.TYPE_USE})
@Retention(value = RetentionPolicy.RUNTIME)
@Documented
public @interface ApiInfo {
    String name();
    String note();
}
