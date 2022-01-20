import java.util.ArrayList;
import java.util.Random;

public class WhatToEat {
    public static void main(String[] args) throws InterruptedException {
        ArrayList<String> foodList = new ArrayList<>();
        String[] a = {
               "钵钵鸡     ",
               "淮南牛肉米线  ",
                "老乡鸡",
               "夜市土豆粉   ",
               "夜市炒方便面  ",
               "夜市酒酿小丸子 ",
               "炸蘑菇     ",
               "炸丸子     ",
               "汉堡王     ",
               "肯德基     ",
               "麦当劳     ",
               "赛百味     ",
               "陕西面     ",
               "西安面     ",
               "肥叔肉夹馍   ",
               "鸡蛋饼     ",
               "四川担担面   ",
               "汉拿山     ",
        };
        for (String s : a) {
            foodList.add(s.trim());
        }
        Random random = new Random();
        int i = random.nextInt(1000000);
        int j = 0;
        while(true){
            for (String s : foodList) {

                Thread.sleep(random.nextInt(20));
                if(i % a.length == j){
                    System.out.println("今天吃："+s);
                    return;
                }
                j++;
                System.out.println(s);

            }
        }
    }
}
