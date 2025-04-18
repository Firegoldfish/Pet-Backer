package com.hjy.projects.meetpet.controller.cust;

import cn.hutool.core.map.MapUtil;
import com.hjy.framework.annotation.LoginIgnore;
import com.hjy.framework.core.domain.ApiResult;
import com.hjy.framework.validate.DataCheck;
import com.hjy.projects.meetpet.service.cust.HomeService;
import com.hjy.projects.meetpet.service.cust.PublicService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

@RestController("MeetPetHomeController")
public class HomeController extends BaseMyCustController {

    @Resource(name = "MeetPetPublicService")
    PublicService publicService;

    @Resource(name = "MeetPetHomeService")
    HomeService homeService;

    @LoginIgnore
    @RequestMapping(value = "/setup/get")
    public ApiResult getSetup(@RequestBody Map<String, Object> input) {
        // 数据校验
        String[] RULES = {
                "key:must|string"
        };
        DataCheck.check(input, RULES);

        // 业务
        String key = MapUtil.getStr(input, "key");
        String ret = publicService.getSetup(key);


        return ApiResult.success(ret);
    }


    @LoginIgnore
    @RequestMapping(value = "/home/list")
    public ApiResult getHomeList(@RequestBody Map<String, Object> input) {
        // 数据校验
        String[] RULES = {
        };
        DataCheck.check(input, RULES);

        // 业务
        Map<String, Object> ret = homeService.getHomeList();


        return ApiResult.success(ret);
    }

}
