package com.yzf.raphael.mapper.ImpalaMapping;

import com.yzf.raphael.model.Industry;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IndustryMapper {
    @Results(id = "IndustryResuly", value = {
            @Result(property = "industry", column = "industry")
    })
    @Select("select distinct industry from test.industry where industry is not null")
    List<Industry> getIndustry();
}
