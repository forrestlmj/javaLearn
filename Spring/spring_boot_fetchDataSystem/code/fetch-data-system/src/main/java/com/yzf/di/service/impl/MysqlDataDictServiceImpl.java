package com.yzf.di.service.impl;

import com.yzf.di.entity.po.FdsMysqlDataDict;
import com.yzf.di.entity.po.FdsMysqlSource;
import com.yzf.di.dao.repository.MysqlDataDictRepository;
import com.yzf.di.service.MysqlDataDictService;
import com.yzf.di.util.JDBCUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MysqlDataDictServiceImpl implements MysqlDataDictService {
    @Autowired
    private MysqlDataDictRepository mysqlDataDictRepository;
    @Override
    public Page<FdsMysqlDataDict> list(Integer page, Integer size) {
        PageRequest of = PageRequest.of(page, size);
        return mysqlDataDictRepository.findAll(of);
    }

    @Override
    public Page<FdsMysqlDataDict> search(FdsMysqlDataDict searchDao, Integer page, Integer size) {


        return null;
    }

    /**
     * @param fdsMysqlSource
     * @return
     */
    @Override
    public boolean fetch(FdsMysqlSource fdsMysqlSource) {
        JDBCUtil jdbcUtil = new JDBCUtil();
        List<FdsMysqlDataDict> fetch = jdbcUtil.fetch(fdsMysqlSource);
        if(fetch.size() > 0){
            mysqlDataDictRepository.deleteByMysqlSourceId(fdsMysqlSource.getId());
            mysqlDataDictRepository.saveAll(fetch);
            return true;
        }else return false;
    }
}
