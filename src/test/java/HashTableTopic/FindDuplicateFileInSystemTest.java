package HashTableTopic;

import org.junit.Test;

import static org.junit.Assert.*;

public class FindDuplicateFileInSystemTest {

    @Test
    public void findDuplicate() {
        String[] a = {"root/a 1.txt(abcd) 2.txt(efgh)", "root/c 3.txt(abcd)", "root/c/d 4.txt(efgh)", "root 4.txt(efgh)"};
        FindDuplicateFileInSystem f = new FindDuplicateFileInSystem();
        f.findDuplicate(a);
        String[] b = {"root/a 1.txt(abcd) 2.txt(efsfgh)","root/c 3.txt(abdfcd)","root/c/d 4.txt(efggdfh)"};
        f.findDuplicate(b);

        // [["root/a/2.txt","root/c/d/4.txt","root/4.txt"],["root/a/1.txt","root/c/3.txt"]]
        //
        //
        //来源：力扣（LeetCode）
        //链接：https://leetcode-cn.com/problems/find-duplicate-file-in-system
        //著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
    }
}