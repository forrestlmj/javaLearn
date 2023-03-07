import org.junit.Test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class PropertiesTest {
    @Test
    public void test1() throws IOException {
        Properties properties = new Properties();
        FileInputStream fileInputStream = new FileInputStream("src/main/resources/jdbc.properties");
        properties.load(fileInputStream);
        System.out.println(properties.getProperty("abc"));
    }
}
