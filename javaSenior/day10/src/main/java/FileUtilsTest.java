import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

/**
 * 这里apache common和google guava都有很多io、juc类似的加强版本
 * 都是为了简化代码
 */
public class FileUtilsTest {
    @Test
    public void testApacheCommon() throws IOException {
        File srcFile = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day10\\src\\main\\resources\\my.dat");
        File targetFile = new File("D:\\IdeaProject\\javaLearn\\javaSenior\\day10\\src\\main\\resources\\my.datbackup");
        FileUtils.copyFile(srcFile,targetFile);
    }

//    @Test
//    public void testGuava(){
//        Files
//    }
}
