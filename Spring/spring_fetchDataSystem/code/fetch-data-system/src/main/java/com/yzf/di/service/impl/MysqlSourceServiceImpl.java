package com.yzf.di.service.impl;

import com.yzf.di.entity.FdsMysqlSource;
import com.yzf.di.repository.MysqlSourceRepository;
import com.yzf.di.service.MysqlSourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MysqlSourceServiceImpl implements MysqlSourceService {
    @Autowired
    private MysqlSourceRepository mysqlSourceRepository;
    @Override
    public Page<FdsMysqlSource> list(Integer page, Integer size) {
        Pageable of = PageRequest.of(page, size);
        return mysqlSourceRepository.findAll(of);
    }

    @Override
    public FdsMysqlSource getById(Integer id) {
        return mysqlSourceRepository.findById(id).orElse(new FdsMysqlSource());
    }

    @Override
    public void deleteById(Integer id) throws EmptyResultDataAccessException
    {
        mysqlSourceRepository.deleteById(id);
//        Optional<FdsMysqlSource> byId = mysqlSourceRepository.findById(id);
//        if (byId.isPresent()) {
//            byId.get().setDeleted(true);
//            mysqlSourceRepository.save(byId.get());
//        }
    }

    @Override
    public boolean addOrUpdate(FdsMysqlSource fdsMysqlSource)  {
        try {
            FdsMysqlSource save = mysqlSourceRepository.save(fdsMysqlSource);
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
        return true;
    }

}
