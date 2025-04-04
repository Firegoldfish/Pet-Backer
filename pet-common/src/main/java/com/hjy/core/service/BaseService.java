package com.hjy.core.service;

import com.hjy.exception.AppException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * @Note: 逻辑基类
 * @Author：Bill_Huo
 * @Date：2025/4/4 17:51
 */
public class BaseService {
    protected final Logger logger = LoggerFactory.getLogger(getClass());

    protected void appError(String msg) {
        throw new AppException(msg);
    }
}
