package com.yzf.di.dao.repository;

import com.yzf.di.entity.po.FdsMysqlSource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MysqlSourceRepository extends JpaRepository<FdsMysqlSource,Integer> {
    @Query("select distinct new com.yzf.di.entity.po.FdsMysqlSource(id,instance,ip) from FdsMysqlSource")
    List<FdsMysqlSource> selectDistinctIDInstance();
}
