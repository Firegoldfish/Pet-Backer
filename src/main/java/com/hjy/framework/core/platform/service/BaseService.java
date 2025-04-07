package com.hjy.framework.core.platform.service;

import com.hjy.framework.exception.AppException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Notes: 逻辑基类
 * @Author: Bill_Huo
 * @Date: 2025/3/11 5:06

 */

public class BaseService {
    protected final Logger logger = LoggerFactory.getLogger(getClass());


    protected void appError(String msg) {
        throw new AppException(msg);
    }
}
