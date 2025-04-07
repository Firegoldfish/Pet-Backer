package com.hjy.projects.meetpet.controller.admin;

import cn.hutool.core.map.MapUtil;
import com.hjy.framework.annotation.DemoShow;
import com.hjy.framework.annotation.LoginIgnore;
import com.hjy.framework.core.domain.ApiResult;
import com.hjy.framework.validate.DataCheck;
import com.hjy.projects.meetpet.service.admin.AdminHomeService;
import com.hjy.projects.meetpet.service.cust.PublicService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Map;

/**
 * @Notes: 后台首页控制器
 * @Author: Bill_Huo
 * @Date: 2025/2/16 9:42

 */

@RestController("MeetPetAdminHomeController")
public class AdminHomeController extends BaseMyAdminController {

    @Resource(name = "MeetPetAdminHomeService")
    private AdminHomeService adminHomeService;

    @Resource(name = "MeetPetPublicService")
    private PublicService publicService;

    @RequestMapping(value = "/admin/home")
    public ApiResult adminHome() {

        ArrayList list = adminHomeService.adminHome();
        return ApiResult.success(list);
    }

    @LoginIgnore
    @RequestMapping(value = "/admin/login")
    public ApiResult adminLogin(@RequestBody Map<String, Object> input) {

        // 数据校验
        String[] RULES = {
                "name:must|string|min=5|max=30|name=账号",
                "password:must|string|min=5|max=30|name=密码"
        };
        DataCheck.check(input, RULES);


        // 业务
        String name = MapUtil.getStr(input, "name");
        String password = MapUtil.getStr(input, "password");


        Map<String, Object> ret = adminHomeService.adminLogin(name, password);

        return ApiResult.success(ret);
    }

    @DemoShow
    @RequestMapping(value = "/admin/setup/set")
    public ApiResult setSetup(@RequestBody Map<String, Object> input) {

        // 数据校验
        String[] RULES = {
                "key:must|string",
                "content:must|string|name=内容",
        };
        DataCheck.check(input, RULES);


        // 业务
        String key = MapUtil.getStr(input, "key");
        String content = MapUtil.getStr(input, "content");


        publicService.setSetup(key, content, "");

        return ApiResult.success();
    }

}
