package com.hjy.projects.meetpet.controller.cust;

import cn.hutool.core.map.MapUtil;
import com.hjy.framework.core.domain.ApiResult;
import com.hjy.framework.core.domain.PageParams;
import com.hjy.framework.core.domain.PageResult;
import com.hjy.framework.validate.DataCheck;
import com.hjy.projects.meetpet.service.cust.FavService;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Notes: 收藏业务控制器
 * @Author: Bill_Huo
 * @Date: 2025/2/28 16:17
 */

@RestController("MeetPetFavController")
public class FavController extends BaseMyCustController {

    @Resource(name = "MeetPetFavService")
    FavService favService;

    @RequestMapping(value = "/fav/is")
    public ApiResult isFav(@RequestBody Map<String, Object> input, @RequestAttribute long userId) {
        // 数据校验
        String[] RULES = {
                "oid:must|long|name=对象ID"
        };
        DataCheck.check(input, RULES);

        long oid = MapUtil.getLong(input, "oid");
        Boolean isFav = favService.isFav(userId, oid);

        return ApiResult.success(MapUtil.of("isFav", isFav));
    }

    @RequestMapping(value = "/fav/update")
    public ApiResult updateFav(@RequestBody Map<String, Object> input, @RequestAttribute long userId) {

        // 数据校验
        String[] RULES = {
                "oid:must|long|name=对象ID",
                "title:must|string|name=标题",
                "type:must|string|name=分类",
                "path:string|name=路径",
        };
        DataCheck.check(input, RULES);
        long oid = MapUtil.getLong(input, "oid");
        String title = MapUtil.getStr(input, "title");
        String type = MapUtil.getStr(input, "type");
        String path = MapUtil.getStr(input, "path");

        Boolean isFav = favService.updateFav(userId, oid, title, type, path);

        return ApiResult.success(MapUtil.of("isFav", isFav));
    }

    @RequestMapping(value = "/fav/del")
    public ApiResult delFav(@RequestBody Map<String, Object> input, @RequestAttribute long userId) {

        // 数据校验
        String[] RULES = {
                "oid:must|long|name=对象ID"
        };
        DataCheck.check(input, RULES);

        Long oid = MapUtil.getLong(input, "oid");

        favService.delFav(userId, oid);

        return ApiResult.success();
    }

    @RequestMapping(value = "/fav/my/list")
    public ApiResult getMyFavList(@RequestBody Map<String, Object> input, @RequestAttribute long userId) {

        // 数据校验
        String[] RULES = PageParams.PAGE_CHECK_RULE;
        DataCheck.check(input, PageParams.PAGE_CHECK_RULE);


        PageParams pageParams = new PageParams(input);

        PageResult ret = favService.getMyFavList(userId, pageParams);

        List<Map<String, Object>> list = ret.getList();

        for (Map<String, Object> record : list) {
        }

        return ApiResult.success(ret);
    }


}
