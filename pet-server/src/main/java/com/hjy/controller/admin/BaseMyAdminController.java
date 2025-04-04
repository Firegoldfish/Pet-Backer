package com.hjy.controller.admin;

import com.hjy.core.controller.BaseController;
import com.hjy.service.AdminMgrService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/4 17:28
 */
@RestController("MeetPetAdminHomeController")
public class BaseMyAdminController extends BaseController {
    @Resource(name = "AdminMgrService")
    private AdminMgrService adminMgrService;

}
