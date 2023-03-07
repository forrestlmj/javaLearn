package com.yzf.raphael.mapper.ImpalaMapping;


import com.yzf.raphael.model.DwdDimCommonXzqhM;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DwdDimCommonXzqhMMapper {
    @Results(id = "DwdDimCommonXzqhMResult", value = {
            @Result(property = "type", column = "type"),
            @Result(property = "k_xzqhid", column = "k_xzqhid"),
            @Result(property = "k_xzqhmc", column = "k_xzqhmc"),
            @Result(property = "k_sjxzqhid", column = "k_sjxzqhid")}
    )
    @Select("select type,m.k_sjxzqhid,m.k_xzqhid,m.k_xzqhmc from dwd.dwd_dim_common_xzqh_m m where type > 0 \n" +
            "and m.dt = (\n" +
            "    select distinct dt as current_dt from dwd.dwd_dim_common_xzqh_m order by dt desc limit 1\n" +
            ")")
    List<DwdDimCommonXzqhM> getDwdDimCommonXzqhM();
}
