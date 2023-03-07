package com.yck.springbootselflearning.util;

/**
 * @author ：forrestlmj@github.com
 * @description：相应码枚举类，参考Http状态码的语义
 * @date ：2021/1/4 下午2:55
 */


public enum  ResultCode {
    SUCCESS(200),//成功
    FAIL(400),//失败
    UNAUTHORIZED(401),//未认证（签名错误）
    FORBIDDEN(403),//禁止
    NOT_FOUND(404),//接口不存在
    INTERNAL_SERVER_ERROR(500);//服务器内部错误

    private final int code;
    ResultCode(int code){
        this.code = code;
    }
    public int code(){
        return code;
    }
}
