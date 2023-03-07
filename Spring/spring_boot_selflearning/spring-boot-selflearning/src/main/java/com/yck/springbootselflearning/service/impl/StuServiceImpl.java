package com.yck.springbootselflearning.service.impl;

import com.yck.springbootselflearning.common.HBaseColumnInfo;
import com.yck.springbootselflearning.dao.Stu;
import com.yck.springbootselflearning.mapper.StuRowMapper;
import com.yck.springbootselflearning.service.StuService;
import com.yck.springbootselflearning.util.Check;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.stereotype.Service;

/**
 * @author ：yangchengkai@yunzhangfang.com
 * @description：TODO
 * @date ：2021/1/14 下午2:32
 */

@Service
public class StuServiceImpl implements StuService {


    @Autowired
    private HbaseTemplate hbaseTemplate;
    private String STU_TABLE_NAME = "stu";
    @Override
    public Stu getStuById(String id) {

        Stu dto = this.hbaseTemplate.get(STU_TABLE_NAME, id, new StuRowMapper());
        if(!Check.AllFieldIsNull(dto)){
            dto.setId(id);
        }
        return dto;
    }

    @Override
    public Stu saveStu(Stu stu) {
        hbaseTemplate.put(STU_TABLE_NAME,stu.getId(),HBaseColumnInfo.STU_INFO1,HBaseColumnInfo.STU_INFO1_NAME, Bytes.toBytes(stu.getName()));
        hbaseTemplate.put(STU_TABLE_NAME,stu.getId(),HBaseColumnInfo.STU_INFO1,HBaseColumnInfo.STU_INFO1_GENDER, Bytes.toBytes(stu.getGender()));
        hbaseTemplate.put(STU_TABLE_NAME,stu.getId(), HBaseColumnInfo.STU_INFO2,HBaseColumnInfo.STU_INFO2_TEL, Bytes.toBytes(stu.getTel()));

        return stu;
    }

    @Override
    public void deleteStuById(String id) {
        hbaseTemplate.delete(STU_TABLE_NAME,id,HBaseColumnInfo.STU_INFO1);
        hbaseTemplate.delete(STU_TABLE_NAME,id,HBaseColumnInfo.STU_INFO2.toString());
    }
}
