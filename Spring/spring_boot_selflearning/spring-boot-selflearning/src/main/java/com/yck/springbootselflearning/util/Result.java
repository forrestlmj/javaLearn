package com.yck.springbootselflearning.util;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author ：xxx
 * @description：统一API相应结果封装
 * @date ：2021/1/4 下午3:05
 */

@ApiModel(value = "返回报文")
public class Result<T> {
    @ApiModelProperty(value = "返回码", example = "200", required = true)
    private int code;
    @ApiModelProperty(value = "返回信息")
    private String message;
    @ApiModelProperty(value = "返回的数据")
    private T data;

    public int getCode() {
        return code;
    }

    public Result setCode(ResultCode resultCode) {
        this.code = resultCode.code();
        return this;
    }

    public String getMessage() {
        return message;
    }

    public Result setMessage(String message) {
        this.message = message;
        return this;
    }

    public T getData() {
        return data;
    }

    public Result setData(T data) {
        this.data = data;
        return this;
    }
}
