package TopInterviewQuestionsEasy.TopInterviewQuestionsEasy.String33;
import java.lang.Math;
import java.lang.String;
public class String33{
    public static void main(String[] args) {
        Solution s = new Solution();
        System.out.println(s.reverse(0));

        System.out.println(s.reverse(123));
        System.out.println(s.reverse(-123));
        System.out.println(s.reverse(120));
        System.out.println(s.reverse(120));

        System.out.println(s.reverse(8));
        System.out.println(s.reverse(-8));
    }

}
class Solution {
    private char[] rvIntegers(int n){
        StringBuilder sb = new StringBuilder();
        while(n>0){
            sb.append(Integer.toString(n%10));
            n = n/10;
        }
        return sb.toString().toCharArray();
    }
    public int reverse(int x) {
        if(x == 0){
            return 0;
        }
        char[] re = rvIntegers(Math.abs(x));
        int index = 0;
        while(re[index] == '0'){
            index ++;
        }
        StringBuilder sb = new StringBuilder();
        for(int i = index;i < re.length; i++){
            sb.append(re[i]);
        }
        if(x < 0){
            if(re.length-index>=31){
                return 0;
            }else{
                return -1*Integer.parseInt(sb.toString());
            }        
        }else{
            if(re.length-index>=32){
                return 0;
            }else{
                return Integer.parseInt(sb.toString());
            }
        }
    }
}