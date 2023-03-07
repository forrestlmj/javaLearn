package com.yzf.di.repository;

import com.yzf.di.entity.FdsMysqlSource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface MysqlSourceRepository extends JpaRepository<FdsMysqlSource,Integer> {
    @Query("select distinct new com.yzf.di.entity.FdsMysqlSource(id,instance,ip) from FdsMysqlSource")
    List<FdsMysqlSource> selectDistinctIDInstance();
}
