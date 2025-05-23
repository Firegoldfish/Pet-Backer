package com.hjy.projects.meetpet.controller.cust;

import cn.hutool.core.map.MapUtil;
import com.hjy.framework.annotation.LoginIgnore;
import com.hjy.framework.core.domain.ApiResult;
import com.hjy.framework.validate.DataCheck;
import com.hjy.projects.meetpet.service.cust.PassportService;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Notes: 用户模块
 * @Author: Bill_Huo
 * @Date: 2025/3/7 5:57

 */


@RestController("MeetPetPassportController")
public class PassportController extends BaseMyCustController {

    @Resource(name = "MeetPetPassportService")
    PassportService passportService;

    @LoginIgnore
    @RequestMapping(value = "/passport/register")
    public ApiResult register(@RequestBody Map<String, Object> input) {

        // 数据校验
        String[] RULES = {
                "account:must|string|name=用户名",
                "name:must|string|name=昵称",
                "password:must|string|name=密码",
                "address:must|string|name=地址",
                "forms:must|string|name=表单",
                "obj:must|string|name=表单",
        };
        DataCheck.check(input, RULES);

        // 业务
        String account = MapUtil.getStr(input, "account");
        String name = MapUtil.getStr(input, "name");
        String password = MapUtil.getStr(input, "password");
        String address = MapUtil.getStr(input, "address");
        String forms = MapUtil.getStr(input, "forms");
        String obj = MapUtil.getStr(input, "obj");

        passportService.register(account, name, password,address, forms, obj);

        Map<String, Object> token = passportService.login(account, password);

        return ApiResult.success(MapUtil.of("token", token));
    }

    @LoginIgnore
    @RequestMapping(value = "/passport/login")
    public ApiResult login(@RequestBody Map<String, Object> input) {

        // 数据校验
        String[] RULES = {
                "account:must|string|name=用户名",
                "password:must|string|name=密码",
        };
        DataCheck.check(input, RULES);

        // 业务
        String account = MapUtil.getStr(input, "account");
        String password = MapUtil.getStr(input, "password");

        Map<String, Object> token = passportService.login(account, password);

        return ApiResult.success(MapUtil.of("token", token));
    }

    @RequestMapping(value = "/passport/my/edit")
    public ApiResult edit(@RequestBody Map<String, Object> input, @RequestAttribute long userId) {

        // 数据校验
        String[] RULES = {
                "account:must|string|name=用户名",
                "name:must|string|name=昵称",
                "address:must|string|name=地址",
                "forms:must|string|name=表单",
                "obj:must|string|name=表单",
        };
        DataCheck.check(input, RULES);

        // 业务
        String account = MapUtil.getStr(input, "account");
        String name = MapUtil.getStr(input, "name");
        String address = MapUtil.getStr(input, "address");
        String forms = MapUtil.getStr(input, "forms");
        String obj = MapUtil.getStr(input, "obj");

        passportService.edit(userId, account, name, address, forms, obj);


        return ApiResult.success();
    }

    @RequestMapping(value = "/passport/pwd")
    public ApiResult pwd(@RequestBody Map<String, Object> input, @RequestAttribute long userId) {

        // 数据校验
        String[] RULES = {
                "oldPassword:must|string|name=旧密码",
                "newPassword:must|string|name=新密码",
        };
        DataCheck.check(input, RULES);

        // 业务
        String oldPassword = MapUtil.getStr(input, "oldPassword");
        String newPassword = MapUtil.getStr(input, "newPassword");

        passportService.pwd(userId, oldPassword, newPassword);


        return ApiResult.success();
    }


    @RequestMapping(value = "/passport/my/detail")
    public ApiResult getMyDetail(@RequestBody Map<String, Object> input, @RequestAttribute long userId) {

        // 数据校验
        String[] RULES = {
        };
        DataCheck.check(input, RULES);

        // 业务

        Map<String, Object> ret = passportService.getMyDetail(userId);


        return ApiResult.success(ret);
    }


}
