package com.yzf.di.service;

import com.yzf.di.entity.po.FdsMysqlSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;

public interface MysqlSourceService {
    Page<FdsMysqlSource> list(Integer page, Integer size);
    FdsMysqlSource getById(Integer id);
    void deleteById(Integer id) throws EmptyResultDataAccessException;
    boolean addOrUpdate(FdsMysqlSource fdsMysqlSource) ;
}
