package com.yzf.raphael.util;

/**
 * 响应结果生成工具
 */
public class ResultGenerator {
    private static final String DEFAULT_SUCCESS_MESSAGE = "SUCCESS";

    public static com.yzf.raphael.util.Result genSuccessResult() {
        return new com.yzf.raphael.util.Result()
                .setCode(com.yzf.raphael.util.ResultCode.SUCCESS)
                .setMessage(DEFAULT_SUCCESS_MESSAGE);
    }

    public static <T> com.yzf.raphael.util.Result<T> genSuccessResult(T data) {
        return new com.yzf.raphael.util.Result()
                .setCode(com.yzf.raphael.util.ResultCode.SUCCESS)
                .setMessage(DEFAULT_SUCCESS_MESSAGE)
                .setData(data);
    }

    public static com.yzf.raphael.util.Result genFailResult(String message) {
        return new com.yzf.raphael.util.Result()
                .setCode(com.yzf.raphael.util.ResultCode.FAIL)
                .setMessage(message);
    }
    public static com.yzf.raphael.util.Result genUnauthorizedResult(String message) {
        return new com.yzf.raphael.util.Result()
                .setCode(com.yzf.raphael.util.ResultCode.UNAUTHORIZED)
                .setMessage(message);
    }

}
