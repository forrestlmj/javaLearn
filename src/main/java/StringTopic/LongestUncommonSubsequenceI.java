package StringTopic;
import java.lang.Math;
public class LongestUncommonSubsequenceI {
    private int match(String a,String b){
        int l = -1;
        for(int i = 0;i<a.length();i++){
            for(int j = i;j<a.length();j++){
                if (!b.contains(a.substring(i,j+1)))
                    l = Math.max(l,j-i+1);
            }
        }
        return l;
    }
    public int findLUSlength(String a, String b) {
        if (a.equals(b))
            return -1;
        if (a.contains(b) || b.contains(a))
            return Math.max(a.length(),b.length());
        return Math.max(match(a,b),match(b,a));
    }
}
