package com.hjy.core.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/4 17:30
 */
public class BaseController {

    protected HttpServletRequest request;

    protected final Logger logger = LoggerFactory.getLogger(getClass());

}
