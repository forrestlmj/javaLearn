package com.yzf.di.service;

import com.yzf.di.entity.po.FdsLogicViewMapping;
import com.yzf.di.entity.po.FdsMysqlDataDict;
import com.yzf.di.entity.dto.LogicViewDto;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface LogicViewMappingService {
    List<LogicViewDto> list(Integer page, Integer size);
    Page<LogicViewDto> search(LogicViewDto logicViewDto,Integer page, Integer size);

    /**
     * 自动全局匹配。同时忽略手动校验、将结果写入数据库。
     */
    boolean automaticInit();

    /**
     * @return 从文件中进行初始化
     */
    boolean manualInitFromFile(MultipartFile file);
    /**
     * 获得任意一个mysql数据字典 对应的逻辑库与逻辑表
     * @param fdsMysqlDataDict mysql数据字典
     * @return mysql数据字典 对应的 逻辑库逻辑表
     */
    FdsLogicViewMapping getLogicViewMappingDao(FdsMysqlDataDict fdsMysqlDataDict);

    /**自动全局匹配。获取数据库中 所有的逻辑库逻辑表，并在全局范围内（即从数据库中所有记录）来判断分库分表策略。
     * @return 全量的
     */
    List<FdsLogicViewMapping> getAllLogicViewMappingDao();
}
