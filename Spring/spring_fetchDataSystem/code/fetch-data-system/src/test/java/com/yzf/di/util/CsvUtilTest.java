package com.yzf.di.util;


import com.yzf.di.dto.LogicViewMappingCSVDto;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItem;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.nio.file.Files;
import java.util.List;

import static org.junit.Assert.*;

public class CsvUtilTest {
    private MockMultipartFile multipartFile = null;
    @Before
    public void prepare() throws IOException {

        File file = new File("src/main/resources/manual_match.csv");
        FileInputStream inputStream = new FileInputStream(file);
        multipartFile = new MockMultipartFile(
                "file",
                "manual_match.csv",
                MediaType.IMAGE_PNG_VALUE,
                inputStream
        );

    }
    @Test
    public void getCsvData() {
        CsvUtil csvUtil = new CsvUtil();
        List<LogicViewMappingCSVDto> csvData = csvUtil.getCsvData(multipartFile, LogicViewMappingCSVDto.class);
        Assert.assertEquals(8,csvData.stream().filter((t) -> t.getLogicDatabase().equals("fintax_account")).count());
        Assert.assertEquals(4,csvData.stream().filter((t) -> t.getLogicDatabase().equals("fintax_task")).count());

        System.out.println(csvData);
    }
}