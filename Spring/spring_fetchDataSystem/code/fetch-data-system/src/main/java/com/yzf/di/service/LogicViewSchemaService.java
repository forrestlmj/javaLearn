package com.yzf.di.service;

import com.yzf.di.entity.FdsLogicViewSchema;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * 检查 逻辑视图中所有的mysql中：
 * 1、字段是否能对齐。
 * 2、将能对齐的mysql字段作为逻辑视图的schema，保存到数据库中。
 */
public interface LogicViewSchemaService {

    /**
     * 生成所有逻辑视图的schema
     * 展示逻辑视图
     */
    boolean checkAndSaveAllAutomaticMappingSchema();
    boolean refresh();
    List<FdsLogicViewSchema> list(Integer page, Integer size);
    Page<FdsLogicViewSchema> search(FdsLogicViewSchema fdsLogicViewSchema, Integer page, Integer size);
}
