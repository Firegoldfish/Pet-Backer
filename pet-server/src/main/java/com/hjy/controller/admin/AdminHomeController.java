package com.hjy.controller.admin;

import cn.hutool.core.map.MapUtil;
import com.hjy.annotation.DemoShow;
import com.hjy.annotation.LoginIgnore;
import com.hjy.core.domain.ApiResult;
import com.hjy.service.admin.AdminHomeService;
import com.hjy.service.user.PublicService;
import com.hjy.validate.DataCheck;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Map;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/4 17:26
 */
@RestController("AdminHomeController")
public class AdminHomeController extends BaseMyAdminController {

    @Resource(name = "AdminHomeService")
    private AdminHomeService adminHomeService;

    @Resource(name = "PublicService")
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