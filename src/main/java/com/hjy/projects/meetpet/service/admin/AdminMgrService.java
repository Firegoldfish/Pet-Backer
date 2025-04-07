package com.hjy.projects.meetpet.service.admin;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hjy.framework.core.domain.PageParams;
import com.hjy.framework.core.domain.PageResult;
import com.hjy.framework.core.mapper.UpdateWhere;
import com.hjy.framework.core.mapper.Where;
import com.hjy.projects.meetpet.mapper.AdminMapper;
import com.hjy.projects.meetpet.model.AdminModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Notes: 后台管理员模块
 * @Author: Bill_Huo
 * @Date: 2025/2/16 9:35

 */

@Service("MeetPetAdminMgrService")
public class AdminMgrService extends BaseMyAdminService {
    @Resource(name = "MeetPetAdminMapper")
    private AdminMapper adminMapper;


    /**
     * 管理员列表
     */
    public PageResult getMgrList(Long adminId, PageParams pageRequest) {
        Where<AdminModel> whereAdmin = new Where<>();
        whereAdmin.eq("ADMIN_ID", adminId);
        whereAdmin.eq("ADMIN_STATUS", AdminModel.STATUS.NORMAL);
        whereAdmin.in("ADMIN_TYPE", AdminModel.TYPE.COMM, AdminModel.TYPE.SUPER);
        AdminModel admin = adminMapper.getOne(whereAdmin);
        if (ObjectUtil.isEmpty(admin)) this.appError("管理员不存在");

        Where<AdminModel> where = new Where<>();

        if (admin.getAdminType() == AdminModel.TYPE.COMM) { //普通管理员只能管理其他管理员
            where.eq("ADMIN_TYPE", AdminModel.TYPE.OTHTER);
        }

        // 关键字查询
        String search = pageRequest.getSearch();
        if (StrUtil.isNotEmpty(search)) {
            where.and(
                    wrapper -> {
                        wrapper.or().like("ADMIN_NAME", search);
                        wrapper.or().like("ADMIN_PHONE", search);
                        wrapper.or().like("ADMIN_DESC", search);
                    }
            );
        }

        // 条件查询
        String sortType = pageRequest.getSortType();
        String sortVal = pageRequest.getSortVal();
        if (StrUtil.isNotEmpty(sortType) && StrUtil.isNotEmpty(sortVal)) {
            switch (sortType) {
                case "status": {
                    where.eq("ADMIN_STATUS", Convert.toInt(sortVal));
                    break;
                }
                case "type": {
                    where.eq("ADMIN_TYPE", Convert.toInt(sortVal));
                    break;
                }
            }

        }

        // 排序
        where.orderByDesc("ADMIN_ID");


        Page page = new Page(pageRequest.getPage(), pageRequest.getSize());
        return adminMapper.getPageList(page, where, "ADMIN_ID,ADMIN_NAME,ADMIN_STATUS,ADMIN_PHONE,ADMIN_TYPE," +
                "ADMIN_LOGIN_CNT,ADMIN_LOGIN_TIME,ADMIN_DESC,ADD_TIME");
    }

    /**
     * 删除管理员
     */
    public void delMgr(Long id, Long myAdminId) {
        if (id.equals(myAdminId)) appError("不能删除自己的账号");

        Where<AdminModel> where = new Where<>();

        where.eq("ADMIN_ID", id);
        where.ne("ADMIN_TYPE", 1); //不能删除超管
        adminMapper.delete(where);
    }

    /**
     * 添加管理员
     */
    public void insertMgr(AdminModel admin) {
        // 是否重复
        Where<AdminModel> where = new Where<>();
        where.eq("ADMIN_NAME", admin.getAdminName());
        if (adminMapper.exists(where)) appError("该账号已经存在");

        admin.setAdminPassword(DigestUtil.md5Hex(admin.getAdminPassword()));

        admin.setAdminStatus(AdminModel.STATUS.NORMAL);
        adminMapper.add(admin);
    }

    /**
     * 修改管理员
     */
    public void editMgr(AdminModel admin) {
        // 是否重复
        Where<AdminModel> where = new Where<>();
        where.eq("ADMIN_NAME", admin.getAdminName());
        where.ne("ADMIN_ID", admin.getAdminId());
        if (adminMapper.exists(where)) appError("该账号已经存在");

        // 入库
        UpdateWhere<AdminModel> uw = new UpdateWhere<>();
        uw.eq("ADMIN_ID", admin.getAdminId());

        uw.set("ADMIN_TYPE", admin.getAdminType());
        uw.set("ADMIN_NAME", admin.getAdminName());
        uw.set("ADMIN_DESC", admin.getAdminDesc());
        uw.set("ADMIN_PHONE", admin.getAdminPhone());

        // 修改了密码
        if (StrUtil.isNotEmpty(admin.getAdminPassword()))
            uw.set("ADMIN_PASSWORD", DigestUtil.md5Hex(admin.getAdminPassword()));


        adminMapper.edit(uw);

    }

    /**
     * 获取管理员信息
     */
    public Map<String, Object> getMgrDetail(long id) {
        return adminMapper.getOneMap(id, "ADMIN_ID,ADMIN_TYPE,ADMIN_STATUS,ADMIN_NAME,ADMIN_DESC,ADMIN_PHONE");
    }

    /**
     * 修改管理员自身密码
     */
    public void pwdMgr(long adminId, String oldPassword, String password) {
        Where<AdminModel> where = new Where<>();
        where.eq("ADMIN_ID", adminId);
        where.eq("ADMIN_PASSWORD", DigestUtil.md5Hex(oldPassword));
        if (!adminMapper.exists(where)) appError("旧密码错误");

        // 修改
        UpdateWhere<AdminModel> uw = new UpdateWhere<>();
        uw.eq("ADMIN_ID", adminId);
        uw.set("ADMIN_PASSWORD", DigestUtil.md5Hex(password));
        adminMapper.edit(uw);
    }

    /**
     * 修改状态
     */
    public void statusMgr(long id, int status, long myAdminId) {
        if (NumberUtil.equals(id, myAdminId)) appError("不能修改自己的账号状态");


        UpdateWhere<AdminModel> uw = new UpdateWhere<>();
        uw.eq("ADMIN_ID", id);
        uw.ne("ADMIN_TYPE", 1); //不能修改超管

        uw.set("ADMIN_STATUS", status);

        adminMapper.edit(uw);

    }
}
