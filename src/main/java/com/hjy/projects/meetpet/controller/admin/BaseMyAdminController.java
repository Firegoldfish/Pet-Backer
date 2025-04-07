package com.hjy.projects.meetpet.controller.admin;

import com.hjy.framework.core.platform.controller.BaseAdminController;
import com.hjy.projects.meetpet.service.admin.AdminMgrService;

import javax.annotation.Resource;

/**
 * @Notes: 本项目管理系统控制器基类
 * @Author: Bill_Huo
 * @Date: 2025/2/16 14:11

 */
public class BaseMyAdminController extends BaseAdminController {
    @Resource(name = "MeetPetAdminMgrService")
    private AdminMgrService adminMgrService;

}
