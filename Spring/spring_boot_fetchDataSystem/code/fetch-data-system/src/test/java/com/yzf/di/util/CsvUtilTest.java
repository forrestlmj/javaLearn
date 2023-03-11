package com.yzf.di.util;


import com.yzf.di.entity.dto.LogicViewMappingCSVDto;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;

import java.io.*;
import java.util.List;

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