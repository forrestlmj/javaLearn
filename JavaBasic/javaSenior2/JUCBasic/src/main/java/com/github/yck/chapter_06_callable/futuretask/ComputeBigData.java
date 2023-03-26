package com.github.yck.chapter_06_callable.futuretask;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

public class ComputeBigData implements Callable {
    public ComputeBigData(Integer mapNumber, String taskName) {
        this.mapNumber = mapNumber;
        this.taskName = taskName;
    }

    private Integer mapNumber;
    private String  taskName;
    @Override
    public Integer call() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        Random r = new Random();
        Random sleepTime = new Random();
        
        int i = r.nextInt(1000000);
        System.out.println(Thread.currentThread().getName()
                +"---"+taskName+"开始运行..");
        long start = System.currentTimeMillis();
        for (Integer integer = 0; integer < mapNumber; integer++) {
            TimeUnit.MILLISECONDS.sleep(sleepTime.nextInt(2000));
            System.out.println(sdf.format(new Date())+" "+Thread.currentThread().getName()
                    +"-"+taskName+":当前 Map 已完成"+((integer+1)*100.0/mapNumber)+"%");
        }
        long end = System.currentTimeMillis();
        System.out.println(Thread.currentThread().getName()+
                "---"+taskName+"运行成功...运行map数："+mapNumber+"个,"+
                "运行时间:"+(end-start)/1000.0+
                "秒，计算结果:"+i);
        return i;
    }

}
