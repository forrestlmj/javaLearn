package com.yzf.di.service.impl;

import com.yzf.di.constants.MappingMethodEnum;
import com.yzf.di.constants.ShardingStrategyEnum;
import com.yzf.di.entity.dto.LogicViewMappingCSVDto;
import com.yzf.di.entity.po.FdsLogicViewMapping;
import com.yzf.di.entity.po.FdsMysqlDataDict;
import com.yzf.di.entity.dto.LogicViewDto;
import com.yzf.di.entity.po.FdsMysqlSource;
import com.yzf.di.dao.mapper.LogicViewDtoMapper;
import com.yzf.di.dao.repository.LogicViewMappingRepository;
import com.yzf.di.dao.repository.MysqlDataDictRepository;
import com.yzf.di.dao.repository.MysqlSourceRepository;
import com.yzf.di.service.LogicViewMappingService;
import com.yzf.di.service.LogicViewSchemaService;
import com.yzf.di.util.CsvUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class LogicViewMappingServiceImpl implements LogicViewMappingService {
    @Autowired
    private LogicViewDtoMapper logicViewDtoMapper;
    @Autowired
    private MysqlDataDictRepository mysqlDataDictRepository;
    @Autowired
    private LogicViewMappingRepository logicViewMappingRepository;
    @Autowired
    private LogicViewSchemaService logicViewSchemaService;
    @Autowired
    private MysqlSourceRepository mysqlSourceRepository;
    @Override
    public List<LogicViewDto> list(Integer page, Integer size) {

        return logicViewDtoMapper.findAllLogicViewDto();
    }

    @Override
    public Page<LogicViewDto> search(LogicViewDto logicViewDto,Integer page, Integer size) {
        return null;
    }

    /**
     * 获得任意一个mysql数据字典 对应的逻辑库与逻辑表
     * @param fdsMysqlDataDict mysql数据字典
     * @return mysql数据字典 对应的 逻辑库逻辑表
     */
    @Override
    public FdsLogicViewMapping getLogicViewMappingDao(FdsMysqlDataDict fdsMysqlDataDict){

        return new FdsLogicViewMapping(fdsMysqlDataDict.getLogicDatabase(), fdsMysqlDataDict.getLogicTable(),
                fdsMysqlDataDict.getMysqlSourceId(), MappingMethodEnum.AUTOMATIC.value(),
                fdsMysqlDataDict.getTableSchema(),
                fdsMysqlDataDict.getTableName());
    }

    /**获取数据库中 所有的逻辑库逻辑表。并在全局范围内（即从数据库中所有记录）来判断分库分表策略。
     * 这个步骤涉及到正则匹配结尾为 _数字 的表名。在mysql 5.x中无法通过 regex_replace 实现。因此使用Map去重。
     * @return 全量的逻辑库逻辑表
     */
    @Override
    public List<FdsLogicViewMapping> getAllLogicViewMappingDao() {
        List<FdsLogicViewMapping> result = new ArrayList<>();
        Map<String,List<FdsMysqlDataDict>> m = new HashMap<>();
        // 1、先查询MysqlDataDictDao中所有的数据，
        List<FdsMysqlDataDict> all = mysqlDataDictRepository.findDistinctTable();
        // 2、使用HashMap，将mysql的逻辑库.逻辑表名作为key，具有同样逻辑库表的mysql数据放在value中。
        for (FdsMysqlDataDict fdsMysqlDataDict : all) {
            String key = fdsMysqlDataDict.getLogicDatabase()+"."+ fdsMysqlDataDict.getLogicTable();
            if(m.containsKey(key)){
                m.get(key).add(fdsMysqlDataDict);
            }else {
                List<FdsMysqlDataDict> l = new ArrayList<>();
                l.add(fdsMysqlDataDict);
                m.put(key,l);
            }
        }

        // 3、遍历hashmap，value中数组长度大于1,则说明采用了分库分表策略
        for (Map.Entry<String, List<FdsMysqlDataDict>> entry : m.entrySet()) {
            String shardingStrategy = ShardingStrategyEnum.NONSHARDING.value();
            if(entry.getValue().size() > 1){
                // 采用了分库分表策略
                shardingStrategy = ShardingStrategyEnum.SHARDING_DB_TBL.value();
            }
            for (FdsMysqlDataDict fdsMysqlDataDict : entry.getValue()) {
                FdsLogicViewMapping fdsLogicViewMapping = getLogicViewMappingDao(fdsMysqlDataDict);
                fdsLogicViewMapping.setShardingStrategy(shardingStrategy);
                result.add(fdsLogicViewMapping);
            }
        }
        return result;
    }

    /**
     *
     */
    @Override
    public boolean automaticInit() {
        // 1、全局范围内来获得逻辑视图、分库分表策略。
        List<FdsLogicViewMapping> allList = getAllLogicViewMappingDao();
        // 2、从数据库中 非自动匹配 的LogicViewDao取出，，并从allList剔除，防止文件定义或用户定义的映射数据被覆盖。
        Set<FdsLogicViewMapping> notAutomatic = logicViewMappingRepository.selectNotInMappingMethod(MappingMethodEnum.AUTOMATIC.value());
        allList.removeIf(notAutomatic::contains);
        // 3、将 allList 保存到数据库中。
            // 3.1、先将 mappingMethod 为自动化映射的删除
        logicViewMappingRepository.deleteMappingMethod(MappingMethodEnum.AUTOMATIC.value());
            // 3.2、再将 allList 保存
        logicViewMappingRepository.saveAll(allList);
        return true;
    }

    /** TODO
     * @return
     */
    @Override
    public boolean manualInitFromFile(MultipartFile file) {

        // 1、调用 获取csv中的数据 LogicViewMappingCSVDto。
        CsvUtil csvUtil = new CsvUtil();
        List<LogicViewMappingCSVDto> csvData = csvUtil.getCsvData(file, LogicViewMappingCSVDto.class);

        // 2、获得mysql_id -> mysql instance的映射
        Map<String,Integer> instanceIp = mysqlSourceRepository.selectDistinctIDInstance()
                .stream().collect(Collectors.toMap(FdsMysqlSource::getInstance, FdsMysqlSource::getId));

        // 3、LogicViewMappingCSVDto 转为 FdsLogicViewMapping，便于后续保存
        List<FdsLogicViewMapping> fdsLogicViewMappings = csvData.stream().map((t) -> {
            FdsLogicViewMapping map = new FdsLogicViewMapping();
            BeanUtils.copyProperties(t,map);
            map.setMysqlSourceId(instanceIp.get(t.getInstance()));
            map.setMappingMethod(MappingMethodEnum.MANUAL_DEFINED_IN_FILE.value());
            return map;
        }).collect(Collectors.toList());
        // 4、在数据库中删除fdsLogicViewMappings相关数据
            // 4.1、删除涉及的逻辑库与逻辑表
        List<String> whereLogicDBLogicTable = fdsLogicViewMappings.stream()
                .map(t -> String.join(".", t.getLogicDatabase(), t.getLogicTable()))
                .distinct().collect(Collectors.toList());
            // 4.2、删除涉及的mysql
        List<String> whereMysqlIdMysqlSchemaAndTable = fdsLogicViewMappings.stream()
                .filter(t -> t.getMysqlSourceId() != null)
                .map(t -> String.join(".", t.getMysqlSourceId().toString(), t.getTableSchema(), t.getTableName()))
                .distinct().collect(Collectors.toList());
        logicViewMappingRepository.deleteByLogicAndMysql(whereLogicDBLogicTable,whereMysqlIdMysqlSchemaAndTable);

        // 5、保存csv中结果
        logicViewMappingRepository.saveAll(fdsLogicViewMappings);
        return true;
    }


}
