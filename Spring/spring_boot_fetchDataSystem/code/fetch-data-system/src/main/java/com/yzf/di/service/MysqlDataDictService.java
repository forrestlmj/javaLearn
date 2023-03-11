package com.yzf.di.service;

import com.yzf.di.entity.po.FdsMysqlDataDict;
import com.yzf.di.entity.po.FdsMysqlSource;
import org.springframework.data.domain.Page;

public interface MysqlDataDictService {
    Page<FdsMysqlDataDict> list(Integer page, Integer size);
//    boolean addOrUpdate(MysqlSourceDao mysqlSourceDao) ;
    Page<FdsMysqlDataDict> search(FdsMysqlDataDict searchDao, Integer page, Integer size);
    boolean fetch(FdsMysqlSource fdsMysqlSource) ;

}
