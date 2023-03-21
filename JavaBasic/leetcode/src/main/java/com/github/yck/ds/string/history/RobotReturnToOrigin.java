package com.github.yck.ds.string.history;

public class RobotReturnToOrigin {
    public boolean judgeCircle(String moves) {
        int[] l = {0,0};
        for (char c:moves.toCharArray()){
            switch (c){
                case 'U':
                    l[0] += 1;
                    break;
                case 'D':
                    l[0] -= 1;
                    break;
                case 'L':
                    l[1] += 1;
                    break;
                case 'R':
                    l[1] -= 1;
                    break;
            }
        }
        return l[0] == 0 && l[1] == 0;
    }
}
