package com.yzf.di.repository;

import com.yzf.di.entity.FdsMysqlDataDict;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MysqlDataDictRepository extends JpaRepository<FdsMysqlDataDict,Integer> {
    @Transactional
    @Modifying
    @Query("delete from FdsMysqlDataDict a where a.mysqlSourceId = :mysqlSourceId")
    void deleteByMysqlSourceId(@Param("mysqlSourceId") Integer mysqlSourceId);
    @Query("select distinct new com.yzf.di.entity.FdsMysqlDataDict(mysqlSourceId,instance,tableSchema,tableName,tableRows,tableComment) from FdsMysqlDataDict a")
    List<FdsMysqlDataDict> findDistinctTable();

}
