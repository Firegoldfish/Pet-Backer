package com.hjy.exception;

/**
 * @Note: 业务异常
 * @Author：Bill_Huo
 * @Date：2025/4/3 14:41
 */
public class BaseException extends RuntimeException{
    public BaseException() {
    }

    public BaseException(String msg) {
        super(msg);
    }
}
