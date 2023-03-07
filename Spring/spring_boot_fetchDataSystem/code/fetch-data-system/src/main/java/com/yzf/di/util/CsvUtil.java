package com.yzf.di.util;

import com.opencsv.bean.CsvToBean;
import com.opencsv.bean.CsvToBeanBuilder;
import com.opencsv.bean.HeaderColumnNameMappingStrategy;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class CsvUtil {
    /**
     * 日志对象
     */
//    private static final Logger LOGGER = LoggerFactory.getLogger(CsvUtil.class);

    /**
     * 解析csv文件并转成bean
     * @param file csv文件
     * @param clazz 类
     * @param <T> 泛型
     * @return 泛型bean集合
     */
    public <T> List<T> getCsvData(MultipartFile file, Class<T> clazz) {
        InputStreamReader in = null;
        try {
            in = new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8);
        } catch (Exception e) {
            /**
             LOGGER.error(Constant.LOG_FOMAT_TYPE_TWO,
             ErrorCode.FILE_LOAD_ERROR.getErrorCode(),
             ErrorCode.FILE_LOAD_ERROR.getMessage(),
             e.getMessage());
             */

//            throw BaseException.of(ErrorCode.FILE_LOAD_ERROR.of());
            System.out.println(e);
        }

        HeaderColumnNameMappingStrategy<T> strategy = new HeaderColumnNameMappingStrategy<>();
        strategy.setType(clazz);

        CsvToBean<T> csvToBean = new CsvToBeanBuilder<T>(in)
                .withSeparator(',')
                .withQuoteChar('\'')
                .withMappingStrategy(strategy).build();
        return csvToBean.parse();
    }
}
