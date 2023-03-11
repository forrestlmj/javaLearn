package com.yzf.di.dao.repository;

import com.yzf.di.entity.po.FdsLogicViewMapping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

public interface LogicViewMappingRepository extends JpaRepository<FdsLogicViewMapping,Integer> {
    @Transactional
    @Modifying
    @Query("delete from FdsLogicViewMapping a where a.mappingMethod = :mappingMethod")
    void deleteMappingMethod(String mappingMethod);

    @Query("select distinct new com.yzf.di.entity.po.FdsLogicViewMapping(logicDatabase,logicTable) from FdsLogicViewMapping a where a.mappingMethod not in ( :mappingMethod )")
    Set<FdsLogicViewMapping> selectNotInMappingMethod(@Param("mappingMethod") String mappingMethod);
    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "delete from fds_logic_view_mapping where concat_ws(\".\",logic_database,logic_table) in  (:whereLogicDBLogicTable) " +
            "or concat_ws(\".\",mysql_source_id,table_schema,table_name) in (:whereMysqlIdMysqlSchemaAndTable)")
    void deleteByLogicAndMysql(@Param("whereLogicDBLogicTable") List<String> where,@Param("whereMysqlIdMysqlSchemaAndTable") List<String> where2);
//    void deleteByMysqlSchemaAndMysqlTable();
//    void saveByCsvData();
//    @Query("select count(1) from (:dao) as a")
//    Integer select(List<LogicViewMappingCSVDto> dao);

}
