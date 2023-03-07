package com.yzf.di.mapper;

import com.yzf.di.dto.LogicViewDto;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface LogicViewDtoMapper {
    // TODO dto change name
    @Select("select u.logic_database,u.logic_table,mddd.instance,a.table_rows,u.mysql_source_id,u.mapping_method,u.sharding_strategy\n" +
            "     ,u.table_schema,u.table_name\n" +
            "from fds_logic_view_mapping u\n" +
            "left join fds_mysql_data_dict mddd on u.mysql_source_id = mddd.mysql_source_id\n" +
            "left join (select distinct mysql_source_id,table_schema,table_name,table_comment,table_rows from fds_mysql_data_dict) a\n" +
            "on u.mysql_source_id = a.mysql_source_id and u.table_schema = a.table_schema and u.table_name = a.table_name\n")
    public List<LogicViewDto> findAllLogicViewDto();
}
