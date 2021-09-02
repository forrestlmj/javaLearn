import java.lang.annotation.*;
import static java.lang.annotation.ElementType.*;
@Inherited
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({TYPE,FIELD,METHOD,CONSTRUCTOR,PARAMETER,LOCAL_VARIABLE,TYPE_PARAMETER,TYPE_USE})
public @interface MyAnnotatoin {
    String value() default "hello";
}
