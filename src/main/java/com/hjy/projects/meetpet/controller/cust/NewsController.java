package com.hjy.projects.meetpet.controller.cust;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import com.hjy.framework.annotation.LoginIgnore;
import com.hjy.framework.core.domain.ApiResult;
import com.hjy.framework.core.domain.PageParams;
import com.hjy.framework.core.domain.PageResult;
import com.hjy.framework.helper.FormHelper;
import com.hjy.framework.helper.TimeHelper;
import com.hjy.framework.validate.DataCheck;
import com.hjy.projects.meetpet.service.cust.NewsService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Notes: 资讯模块
 * @Author: Bill_Huo
 * @Date: 2025/3/7 5:57

 */


@RestController("MeetPetNewsController")
public class NewsController extends BaseMyCustController {

    @Resource(name = "MeetPetNewsService")
    NewsService newsService;

    @LoginIgnore
    @RequestMapping(value = "/news/view")
    public ApiResult view(@RequestBody Map<String, Object> input) {

        // 数据校验
        String[] RULES = {
                "id:must|id|name=id"
        };
        DataCheck.check(input, RULES);

        // 业务
        long id = MapUtil.getLong(input, "id");
        Map<String, Object> ret = newsService.view(id);
        if (ObjectUtil.isNotEmpty(ret)) {
        }


        return ApiResult.success(ret);
    }

    @LoginIgnore
    @RequestMapping(value = "/news/list")
    public ApiResult getNewsList(@RequestBody Map<String, Object> input) {
        // 数据校验
        String[] RULES = {
                "cateId:int",
                "search:string|name=搜索条件",
                "page:must|int|default=1",
                "size:must|int|size|default=10",
                "isTotal:bool",
                "sortType:string|name=搜索类型",
                "sortVal:string|name=搜索类型值",
                "orderBy:string|name=排序",
                "whereEx:string|name=附加查询条件",
                "oldTotal:int"
        };
        DataCheck.check(input, RULES);

        // 业务
        PageParams pageParams = new PageParams(input);
        PageResult ret = newsService.getNewsList(pageParams);

        List<Map<String, Object>> list = ret.getList();

        for (Map<String, Object> record : list) {
            FormHelper.fmtDBObj(record, "newsObj", "desc,cover");
            TimeHelper.fmtDBTime(record, "addTime", "yyyy-MM-dd");
        }

        return ApiResult.success(ret);
    }
}
