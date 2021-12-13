package annotationtest;

import java.lang.annotation.*;
import java.util.List;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(value = {ElementType.FIELD})
public @interface InjectValue {
    String value();
}
