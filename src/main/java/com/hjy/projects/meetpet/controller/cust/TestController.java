package com.hjy.projects.meetpet.controller.cust;

import cn.hutool.core.map.MapUtil;
import com.hjy.framework.annotation.LoginIgnore;
import com.hjy.framework.core.domain.ApiResult;
import com.hjy.projects.meetpet.service.cust.TestService;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Notes: 资讯模块
 * @Author: Bill_Huo
 * @Date: 2025/3/7 5:57

 */


@RestController("MeetPetTestController")
public class TestController extends BaseMyCustController {

    @Resource(name = "MeetPetTestService")
    TestService testService;

    @LoginIgnore
    @RequestMapping(value = "/test")
    public ApiResult test(@RequestBody Map<String, Object> input, @RequestAttribute long userId) {


        testService.test();
        return ApiResult.success(MapUtil.of("msg","xxx>>>>>"));
    }


}
