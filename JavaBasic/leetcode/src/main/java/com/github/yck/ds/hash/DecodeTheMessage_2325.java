package com.github.yck.ds.hash;

import java.util.HashMap;
import java.util.Map;

/**
 * https://leetcode.cn/problems/decode-the-message/
 */
public class DecodeTheMessage_2325 {
    public String decodeMessage(String key, String message) {
        char empty = ' ';

        int cnt = 0;
        Map<Character,Character> m = new HashMap<>();
        char[] chars = key.toCharArray();
        char alph = 'a';
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] != empty){
                if (!m.containsKey(chars[i])) {
                    m.put(chars[i], (char) (alph+cnt));
                    cnt++;
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        for (char c : message.toCharArray()) {
            if (c == empty){
                sb.append(empty);
            }else sb.append(m.get(c));

        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String key = "the quick brown fox jumps over the lazy dog";
        String message = "vkbs bs t suepuv";
        DecodeTheMessage_2325 m = new DecodeTheMessage_2325();
        System.out.println(m.decodeMessage(key, message));
    }
}
