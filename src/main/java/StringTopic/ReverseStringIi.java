package StringTopic;

//import com.sun.org.apache.xpath.internal.operations.String;

public class ReverseStringIi {
    public String help(String s,int k,boolean isReverse){
        StringBuilder sb = new StringBuilder();
        if(s.length()<k){
            String re = new StringBuilder(s).reverse().toString();

            return re;
        }else{
            if(isReverse){
                for(int j=k-1;j>=0;j--){
                    sb.append(s.charAt(j));
                }
            }else {
                for(int j=0;j<k;j++){
                    sb.append(s.charAt(j));
                }
            }
            isReverse = !isReverse;

        }
        String pre = sb.toString();
        String rest = help(s.substring(k),k,isReverse);
        return pre+rest;
    }
    public String reverseStr(String s, int k) {
       return help(s,k,true);
    }
}
