package com.yzf.di.repository;

import com.yzf.di.entity.FdsLogicViewSchema;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface LogicViewSchemaRepository extends JpaRepository<FdsLogicViewSchema,Integer> {
    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "insert into fds_logic_view_schema (logic_column_comment, logic_column_name, logic_column_type, logic_data_type, logic_database, logic_table, logic_table_comment)\n" +
            "select mddd.column_comment,mddd.column_name,mddd.column_type,mddd.data_type,t.logic_database,t.logic_table,mddd.table_comment from fds_logic_view_mapping t\n" +
            "left join fds_mysql_data_dict mddd on t.mysql_source_id = mddd.mysql_source_id\n" +
            "and t.table_schema = mddd.table_schema and t.table_name = mddd.table_name\n" +
            "where sharding_strategy = 'NONSHARDING';")
    void saveNONSHARDING();

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value ="insert into fds_logic_view_schema (logic_column_comment, logic_column_name, logic_column_type, logic_data_type, logic_database, logic_table, logic_table_comment)\n" +
            "select  max(mddd.column_comment),mddd.column_name,mddd.column_type,mddd.data_type,t.logic_database,t.logic_table\n" +
            "              ,max(mddd.table_comment)\n" +
            "from fds_logic_view_mapping t\n" +
            "left join fds_mysql_data_dict mddd on t.mysql_source_id = mddd.mysql_source_id\n" +
            "and t.table_schema = mddd.table_schema and t.table_name = mddd.table_name\n" +
            "where sharding_strategy = 'SHARDING_DB_TBL' group by  mddd.column_name,mddd.column_type,mddd.data_type,t.logic_database,t.logic_table;")
    void saveSHARDING_DB_TBL();
}
