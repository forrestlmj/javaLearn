package com.yzf.di.controller;

import com.yzf.di.constants.InitTypeEnum;
import com.yzf.di.dto.LogicViewDto;
import com.yzf.di.entity.FdsLogicViewInitJob;
import com.yzf.di.entity.FdsLogicViewMapping;
import com.yzf.di.repository.LogicViewInitRepository;
import com.yzf.di.service.LogicViewInitJobService;
import com.yzf.di.util.Result;
import com.yzf.di.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api(tags = {"初始化-初始化详情"})
public class LogicViewInitJobController {
    @Autowired
    private LogicViewInitJobService logicViewInitJobService;
    @ApiOperation(value = "获取  初始化详情",notes = "分页")
    @GetMapping("/logic/view/init/job/detail")
    public Result<Page<FdsLogicViewInitJob>> detail(@ApiParam(value = "初始化类型",defaultValue = "TRION",allowableValues = "TRION,EMR_HIVE,EMR_KUDU") String initType,
                                                    @ApiParam(value = "初始化名称",defaultValue = "") String initName,
                                                    @ApiParam(value = "页",defaultValue = "1") Integer page,
                                                    @ApiParam(value = "页大小",defaultValue = "10") Integer size){
        int a  = 1;
        Pageable pg = PageRequest.of(page, size);
        Page<FdsLogicViewInitJob> re = logicViewInitJobService.getLogicViewInitJob(initType,initName,pg);
        return ResultGenerator.getSuccessResult(re);
    }

}
