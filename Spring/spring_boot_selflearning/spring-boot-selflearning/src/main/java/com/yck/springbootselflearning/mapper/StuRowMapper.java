package com.yck.springbootselflearning.mapper;

import com.yck.springbootselflearning.common.HBaseColumnInfo;
import com.yck.springbootselflearning.dao.Stu;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.data.hadoop.hbase.RowMapper;

/**
 * @author ：yangchengkai@yunzhangfang.com
 * @description：TODO
 * @date ：2021/1/14 下午2:12
 */


public class StuRowMapper implements RowMapper<Stu> {


    @Override
    public Stu mapRow(Result result, int rowNum) throws Exception {


        Stu stu = new Stu();
        stu.setName(Bytes.toString(result.getValue(HBaseColumnInfo.STU_INFO1.getBytes(),HBaseColumnInfo.STU_INFO1_NAME.getBytes())));
        stu.setGender(Bytes.toString(result.getValue(HBaseColumnInfo.STU_INFO1.getBytes(), HBaseColumnInfo.STU_INFO1_GENDER.getBytes())));
        stu.setTel(Bytes.toString(result.getValue(HBaseColumnInfo.STU_INFO2.getBytes(), HBaseColumnInfo.STU_INFO2_TEL.getBytes())));
        return stu;
    }
}
