package com.yzf.di.controller;

import io.swagger.annotations.*;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

@RestController
@Api(tags = {"测试"},hidden = true)
public class TestController {
    @GetMapping(value = "/")
    public String test(){
        return "http://localhost:8081/swagger-ui/index.html#/";
    }
    @ApiOperation(value = "测试csv",notes = "上传csv文件并打印为对应的bean",hidden = true)
    @RequestMapping(value = "/test/uploadCsvAndPrint",method = {RequestMethod.POST},headers = "content-type=multipart/form-data")
    public String uploadCsvAndPrint(@ApiParam(value="文件",required=true) @RequestPart("file") MultipartFile file) throws IOException {
        String s = file.getInputStream().toString();
        return s;
    }

}
