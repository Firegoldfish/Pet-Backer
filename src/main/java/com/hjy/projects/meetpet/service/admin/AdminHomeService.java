package com.hjy.projects.meetpet.service.admin;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.hjy.framework.config.AppConfig;
import com.hjy.framework.core.mapper.Where;
import com.hjy.framework.exception.AppException;
import com.hjy.framework.helper.JWTHelper;
import com.hjy.framework.helper.TimeHelper;
import com.hjy.projects.meetpet.mapper.MeetMapper;
import com.hjy.projects.meetpet.mapper.AdminMapper;
import com.hjy.projects.meetpet.mapper.NewsMapper;
import com.hjy.projects.meetpet.mapper.UserMapper;
import com.hjy.projects.meetpet.model.MeetModel;
import com.hjy.projects.meetpet.model.AdminModel;
import com.hjy.projects.meetpet.model.NewsModel;
import com.hjy.projects.meetpet.model.UserModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @Notes: 后台首页模块
 * @Author: Bill_Huo
 * @Date: 2025/2/16 9:35

 */
@Service("MeetPetAdminHomeService")
public class AdminHomeService extends BaseMyAdminService {

    @Resource(name = "MeetPetAdminMapper")
    private AdminMapper adminMapper;

    @Resource(name = "MeetPetNewsMapper")
    private NewsMapper newsMapper;

    @Resource(name = "MeetPetMeetMapper")
    private MeetMapper activityMapper;

    @Resource(name = "MeetPetUserMapper")
    private UserMapper userMapper;

    @Resource(name = "MeetPetAdminMgrService")
    private AdminMgrService adminMgrService;

    /**
     * 首页数据归集
     */
    public ArrayList adminHome() {
        long userCnt = userMapper.count(new Where<UserModel>());
        long newsCnt = newsMapper.count(new Where<NewsModel>());
        long activityCnt = activityMapper.count(new Where<MeetModel>());

        ArrayList list = new ArrayList();

        Map<String, Object> ret = new HashMap<>();

        ret.put("cnt", userCnt);
        ret.put("title", "用户数");
        list.add( ret);

        ret = new HashMap<>();
        ret.put("cnt", newsCnt);
        ret.put("title", "文章数");
        list.add( ret);

        ret = new HashMap<>();
        ret.put("cnt", activityCnt);
        ret.put("title", "预约项目数");
        list.add( ret);

        return list;
    }


    /**
     * 管理员登陆
     */
    public Map<String, Object> adminLogin(String name, String password) {
        // 判断是否存在
        Where<AdminModel> where = new Where<>();

        where.eq("ADMIN_STATUS", AdminModel.STATUS.NORMAL);
        where.eq("ADMIN_NAME", name);
        where.eq("ADMIN_PASSWORD", DigestUtil.md5Hex(password));


        AdminModel admin = adminMapper.getOne(where);

        if (ObjectUtil.isNull(admin)) throw new AppException("管理员不存在或者已停用");

        //  生成TOKEN
        String token = JWTHelper.genToken(admin.getAdminId(), admin.getAdminName(), "admin", AppConfig.JWT_ADMIN_EXPIRE);

        Map<String, Object> ret = new HashMap<>();
        ret.put("name", admin.getAdminName());
        ret.put("type", admin.getAdminType());
        ret.put("cnt", admin.getAdminLoginCnt());
        ret.put("token", token);
        ret.put("expire", AppConfig.JWT_ADMIN_EXPIRE);

        if (admin.getAdminLoginTime() == 0)
            ret.put("last", "尚未登录");
        else
            ret.put("last", TimeHelper.timestamp2Time(admin.getAdminLoginTime()));


        admin.setAdminLoginCnt(admin.getAdminLoginCnt() + 1);
        admin.setAdminLoginTime(TimeHelper.timestamp());
        adminMapper.update(admin, where);


        return ret;

    }
}
