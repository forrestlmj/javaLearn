package com.yck.springbootselflearning.util;

/**
 * @author ：xxx
 * @description：相应结果生成工具
 * @date ：2021/1/4 下午3:10
 */


public class ResultGenerator {
    public static final String DEFAULT_SUCCESS_MESSAGE = "SUCCESS";
    public static Result getSuccessResult(){
        return new Result()
                .setCode(ResultCode.SUCCESS)
                .setMessage(DEFAULT_SUCCESS_MESSAGE);
    }

    public static <T> Result<T> getSuccessResult(T data){
        return new Result()
                .setCode(ResultCode.SUCCESS)
                .setMessage(DEFAULT_SUCCESS_MESSAGE)
                .setData(data);
    }
    public static Result getFailResult(String message){
        return new Result()
                .setCode(ResultCode.FAIL)
                .setMessage(message);
    }

    public static Result getUnauthorizedResult(String message){
        return new Result()
                .setCode(ResultCode.UNAUTHORIZED)
                .setMessage(message);
    }
    public static Result getForbiddenResult(String message){
        return new Result()
                .setCode(ResultCode.FORBIDDEN)
                .setMessage(message);
    }

}
