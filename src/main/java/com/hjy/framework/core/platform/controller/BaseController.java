package com.hjy.framework.core.platform.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class BaseController {
    @Autowired
    protected HttpServletRequest request;

    protected final Logger logger = LoggerFactory.getLogger(getClass());


}
