package StringTopic;


public class DetectCapital {
    public boolean detectCapitalUse(String word) {
        if(word.length() == 0){
            return true;
        }
        Character c = word.charAt(0);
        if(Character.isUpperCase(c)){
            if(word.length()>1){
                boolean isUpperCaseNext = Character.isUpperCase(word.charAt(1));
                for(int i = 1;i<word.length();i++){
                    if(isUpperCaseNext != Character.isUpperCase(word.charAt(i))){
                        return false;
                    }
                }
                return true;

            }
            return true;
        }else {
            for(int i = 1;i<word.length();i++){
                if(Character.isUpperCase(word.charAt(i))){
                    return false;
                }
            }
            return true;
        }
    }
}
