package com.yzf.di.service.impl;

import com.yzf.di.entity.po.FdsLogicViewSchema;
import com.yzf.di.dao.repository.LogicViewMappingRepository;
import com.yzf.di.dao.repository.LogicViewSchemaRepository;
import com.yzf.di.dao.repository.MysqlDataDictRepository;
import com.yzf.di.service.LogicViewSchemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 *
 */
@Service
public class LogicViewSchemaServiceImpl implements LogicViewSchemaService {
    @Autowired
    private MysqlDataDictRepository mysqlDataDictRepository;
    @Autowired
    private LogicViewMappingRepository logicViewMappingRepository;
    @Autowired
    private LogicViewSchemaRepository logicViewSchemaRepository;
    @Override
    public boolean checkAndSaveAllAutomaticMappingSchema() {
        // 1、删除逻辑表的schema
        logicViewSchemaRepository.deleteAll();

        // 2、处理多库多表
        logicViewSchemaRepository.saveSHARDING_DB_TBL();

        // 3、处理单库单表
        logicViewSchemaRepository.saveNONSHARDING();

        return true;
    }

    @Override
    public boolean refresh() {
        return checkAndSaveAllAutomaticMappingSchema();
    }

    @Override
    public List<FdsLogicViewSchema> list(Integer page, Integer size) {
        return null;
    }

    @Override
    public Page<FdsLogicViewSchema> search(FdsLogicViewSchema fdsLogicViewSchema, Integer page, Integer size) {
        return null;
    }


}
