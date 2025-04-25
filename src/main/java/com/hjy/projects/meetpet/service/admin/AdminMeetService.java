package com.hjy.projects.meetpet.service.admin;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hjy.framework.core.domain.PageParams;
import com.hjy.framework.core.domain.PageResult;
import com.hjy.framework.core.mapper.UpdateWhere;
import com.hjy.framework.core.mapper.Where;
import com.hjy.framework.exception.AppException;
import com.hjy.framework.helper.FileHelper;
import com.hjy.framework.helper.FormHelper;
import com.hjy.framework.helper.TimeHelper;
import com.hjy.projects.meetpet.comm.ProjectConfig;
import com.hjy.projects.meetpet.mapper.MeetJoinMapper;
import com.hjy.projects.meetpet.mapper.MeetMapper;
import com.hjy.projects.meetpet.model.MeetJoinModel;
import com.hjy.projects.meetpet.model.MeetModel;
import com.hjy.projects.meetpet.service.cust.MeetService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @Notes: 活动业务逻辑
 * @Author: Bill_Huo
 * @Date: 2025/3/15 12:10

 */


@Service("MeetPetAdminMeetService")
public class AdminMeetService extends BaseMyAdminService {


    @Resource(name = "MeetPetMeetMapper")
    private MeetMapper meetMapper;

    @Resource(name = "MeetPetMeetJoinMapper")
    private MeetJoinMapper meetJoinMapper;

    @Resource(name = "MeetPetMeetService")
    private MeetService meetService;


    /**
     * 添加活动
     */
    public long insertMeet(MeetModel meet) {
        // 是否重复
        Where<MeetModel> where = new Where<>();
        where.eq("MEET_TITLE", meet.getMeetTitle());
        if (meetMapper.exists(where)) appError("该标题已经存在");

        // 入库
        meet.setMeetStatus(MeetModel.STATUS.NORMAL);
        meet.setMeetDays("[]");
        meetMapper.add(meet);
        long id = meet.getMeetId();

        return id;
    }

    /**
     * 修改活动
     */
    public void editMeet(MeetModel meet) {

        // 是否重复
        Where<MeetModel> where = new Where<>();
        where.eq("MEET_TITLE", meet.getMeetTitle());
        where.ne("MEET_ID", meet.getMeetId());
        if (meetMapper.exists(where)) this.appError("该标题已经存在");

        MeetModel oldMeet = meetMapper.getOne(meet.getMeetId());
        if (ObjectUtil.isNull(oldMeet)) this.appError("记录不存在");

        // 入库
        UpdateWhere<MeetModel> uw = new UpdateWhere<>();
        uw.eq("MEET_ID", meet.getMeetId());

        uw.set("MEET_TITLE", meet.getMeetTitle());
        uw.set("MEET_CATE_ID", meet.getMeetCateId());
        uw.set("MEET_CATE_NAME", meet.getMeetCateName());

        uw.set("MEET_ORDER", meet.getMeetOrder());

        uw.set("MEET_MAX_CNT", meet.getMeetMaxCnt());

        uw.set("MEET_FORMS", meet.getMeetForms());
        uw.set("MEET_OBJ", meet.getMeetObj());


        meetMapper.edit(uw);

    }

    /**
     * 设置预约天数
     */
    public void setMeetDays(long meetId, String days) {

        // 入库
        UpdateWhere<MeetModel> uw = new UpdateWhere<>();
        uw.eq("MEET_ID", meetId);

        uw.set("MEET_DAYS", days);
        meetMapper.edit(uw);

    }


    /**
     * 活动列表
     */
    public PageResult getAdminMeetList(PageParams pageRequest) {

        Where<MeetModel> where = new Where<>();

        // 关键字查询
        String search = pageRequest.getSearch();
        if (StrUtil.isNotEmpty(search)) {
            where.and(wrapper -> {
                wrapper.or().like("MEET_TITLE", search);
            });
        }

        // 条件查询
        String sortType = pageRequest.getSortType();
        String sortVal = pageRequest.getSortVal();
        if (StrUtil.isNotEmpty(sortType) && StrUtil.isNotEmpty(sortVal)) {
            switch (sortType) {
                case "cateId": {
                    where.eq("MEET_CATE_ID", Convert.toLong(sortVal));
                    break;
                }
                case "status": {
                    where.eq("MEET_STATUS", Convert.toInt(sortVal));
                    break;
                }
                case "vouch": {
                    where.eq("MEET_VOUCH", 1);
                    break;
                }
                case "top": {
                    where.eq("MEET_ORDER", 0);
                    break;
                }
                case "sort": {
                    logger.info("SortVal" + sortVal);
                    where.fmtOrderBySort(sortVal, "");
                    break;
                }
            }

        }

        // 排序
        where.orderByAsc("MEET_ORDER");
        where.orderByDesc("MEET_ID");


        Page page = new Page(pageRequest.getPage(), pageRequest.getSize());
        return meetMapper.getPageList(page, where, "*");
    }

    /**
     * 活动报名名单
     */
    public PageResult getAdminMeetJoinList(PageParams pageRequest) {

        Where<MeetJoinModel> where = new Where<>();


        long meetId = pageRequest.getParamLong("meetId");
        where.eq("MEET_JOIN_MEET_ID", meetId);

        // 关键字查询
        String search = pageRequest.getSearch();
        if (StrUtil.isNotEmpty(search)) {
            if (search.length() == 21 && search.contains("#")) {
                // 日期查询
                String[] arr = search.split("#");
                where.between("MEET_JOIN_DAY", arr[0], arr[1]);
            } else {
                where.and(wrapper -> {
                    wrapper.or().like("MEET_JOIN_OBJ", search);
                });
            }

        }

        // 条件查询
        String sortType = pageRequest.getSortType();
        String sortVal = pageRequest.getSortVal();
        if (StrUtil.isNotEmpty(sortType) && StrUtil.isNotEmpty(sortVal)) {
            switch (sortType) {
                case "check": {
                    where.eq("MEET_JOIN_IS_CHECK", Convert.toInt(sortVal));
                    break;
                }
                case "status": {
                    where.eq("MEET_JOIN_STATUS", Convert.toInt(sortVal));
                    break;
                }
                case "sort": {
                    logger.info("SortVal" + sortVal);
                    where.fmtOrderBySort(sortVal, "");
                    break;
                }
            }

        }

        // 排序
        where.orderByDesc("MEET_JOIN_ID");


        Page page = new Page(pageRequest.getPage(), pageRequest.getSize());
        return meetJoinMapper.getPageList(page, where, "*");
    }

    /**
     * 删除活动
     */
    public void delMeet(long id) {
        MeetModel meet = meetMapper.getOne(id);
        if (ObjectUtil.isNull(meet)) this.appError("记录不存在");

        // 删除活动下的所有报名
        Where<MeetJoinModel> where = new Where<>();
        where.eq("MEET_JOIN_MEET_ID", id);
        meetJoinMapper.delete(where);

        meetMapper.delete(id);

    }

    /**
     * 删除活动报名
     */
    public void delMeetJoin(long meetJoinId) {

        MeetJoinModel meetJoinModel = meetJoinMapper.getOne(meetJoinId);
        if (ObjectUtil.isEmpty(meetJoinModel)) return;

        // 删除报名
        Where<MeetJoinModel> where = new Where<>();
        where.eq("MEET_JOIN_ID", meetJoinId);
        meetJoinMapper.delete(where);

    }


    /**
     * 获取单个预约
     */
    public Map<String, Object> getMeetDetail(long id) {
        return meetMapper.getOneMap(id);
    }

    /**
     * 修改预约状态
     */
    public void statusMeet(long id, int status) {
        UpdateWhere<MeetModel> uw = new UpdateWhere<>();
        uw.eq("MEET_ID", id);

        uw.set("MEET_STATUS", status);
        meetMapper.edit(uw);
    }


    /**
     * 管理员按钮核销
     */
    public void checkinMeetJoin(long meetJoinId, int flag) {
        UpdateWhere<MeetJoinModel> uw = new UpdateWhere<>();
        uw.eq("MEET_JOIN_ID", meetJoinId);

        uw.set("MEET_JOIN_IS_CHECK", flag);
        uw.set("MEET_JOIN_CHECK_TIME", flag == 1 ? TimeHelper.timestamp() : 0);

        meetJoinMapper.edit(uw);
    }

    /**
     * 修改排序
     */
    public void orderMeet(long id, int order) {
        UpdateWhere<MeetModel> uw = new UpdateWhere<>();
        uw.eq("MEET_ID", id);

        uw.set("MEET_ORDER", order);
        meetMapper.edit(uw);
    }

    /**
     * 首页设定
     */
    public void vouchMeet(long id, int vouch) {
        UpdateWhere<MeetModel> uw = new UpdateWhere<>();
        uw.eq("MEET_ID", id);

        uw.set("MEET_VOUCH", vouch);
        meetMapper.edit(uw);
    }

    /**
     * 导出名单
     */
    public Map<String, Object> exportMeetJoinExcel(long meetId, String start, String end) {
        String pid = ProjectConfig.PID;

        String savePath = FileHelper.getFileSavePath(pid, "xlsx", "data");

        ExcelWriter writer = ExcelUtil.getWriter(savePath);
        writer.renameSheet("预约名单");
        writer.writeHeadRow(Arrays.asList("序号", "姓名", "手机", "日期", "时段", "填写时间", "是否签到"));
        writer.setColumnWidth(0, 10);
        writer.setColumnWidth(1, 15);
        writer.setColumnWidth(2, 15);
        writer.setColumnWidth(3, 30);
        writer.setColumnWidth(4, 30);
        writer.setColumnWidth(5, 30);
        writer.setColumnWidth(6, 15);

        Where<MeetJoinModel> where = new Where<>();
        where.eq("MEET_JOIN_MEET_ID", meetId);
        where.between("MEET_JOIN_DAY", start, end);
        where.orderByDesc("MEET_JOIN_DAY");
        where.orderByDesc("MEET_JOIN_ID");

        long total = meetJoinMapper.count(where);

        int size = 100;
        int pageCount = FormHelper.calcPageCount(total, size);

        long no = 0;// 序号
        for (int i = 1; i <= pageCount; i++) {
            Page page = new Page(i, size, false);
            PageResult ret = meetJoinMapper.getPageList(page, where);

            List<Map<String, Object>> retList = ret.getList();
            for (Map<String, Object> node : ret.getList()) {
                no++;

                ArrayList<String> arr = new ArrayList<>();

                arr.add(Convert.toStr(no));

                // 表单信息
                String obj = MapUtil.getStr(node, "meetJoinObj");
                if (StrUtil.isNotEmpty(obj)) {
                    JSONObject json = JSONUtil.parseObj(obj);
                    arr.add(json.getStr("name"));
                    arr.add(json.getStr("phone"));
                } else {
                    arr.add("-");
                    arr.add("-");
                }

                arr.add(MapUtil.getStr(node, "meetJoinDay"));
                arr.add(MapUtil.getStr(node, "meetJoinTime"));

                arr.add(MapUtil.getStr(node, "addTime"));

                int isCheck = MapUtil.getInt(node, "meetJoinIsCheck");
                arr.add(isCheck == 1 ? "已签到" : "未签到");


                writer.writeRow(arr);

            }

        }

        writer.close();


        String url = FileHelper.getFileSaveURL(savePath);
        Map<String, Object> ret = new HashMap<>();
        ret.put("url", url);
        ret.put("total", total);

        return ret;
    }

    /**
     * 清空名单
     */
    public void clearMeetAll(long meetId) {
        Where<MeetJoinModel> where = new Where<>();
        where.eq("MEET_JOIN_MEET_ID", meetId);
        meetJoinMapper.delete(where);

        UpdateWhere<MeetModel> uw = new UpdateWhere<>();
        uw.eq("MEET_ID", meetId);
        meetMapper.edit(uw);
    }

    /**
     * 管理员扫码核销
     */
    public void scanMeetJoin(long meetId, String code) {
        Where<MeetJoinModel> where = new Where<>();
        where.eq("MEET_JOIN_MEET_ID", meetId);
        where.eq("MEET_JOIN_CODE", code);
        MeetJoinModel meetJoin = meetJoinMapper.getOne(where);
        if (ObjectUtil.isEmpty(meetJoin)) throw new AppException("没有该用户的预约记录，核销失败");

        if (meetJoin.getMeetJoinStatus() != MeetJoinModel.STATUS.NORMAL)
            throw new AppException("该用户未预约成功，核销失败");

        if (meetJoin.getMeetJoinIsCheck() == 1) throw new AppException("该用户已签到/核销，无须重复核销");

        UpdateWhere<MeetJoinModel> uw = new UpdateWhere<>();
        uw.eq("MEET_JOIN_MEET_ID", meetId);
        uw.eq("MEET_JOIN_CODE", code);
        uw.set("MEET_JOIN_IS_CHECK", 1);
        uw.set("MEET_JOIN_CHECK_TIME", TimeHelper.timestamp());
        meetJoinMapper.edit(uw);
    }
}
