package com.hjy.projects.meetpet.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.framework.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Notes: 活动实体
 * @Author: Bill_Huo
 * @Date: 2025/2/22 7:18

 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("meetpet_meet")
public class MeetModel extends BaseModel {
    /**
     * 状态
     */
    public static final class STATUS {
        public static final int STOP = 0; //非正常
        public static final int NORMAL = 1; // 使用中
    }

    @TableId(value = "MEET_ID",type = IdType.AUTO)
    private Long meetId;

    @TableField("MEET_TITLE")
    private String meetTitle;

    @TableField("MEET_STATUS")
    private int meetStatus;

    @TableField("MEET_CATE_ID")
    private long meetCateId;

    @TableField("MEET_CATE_NAME")
    private String meetCateName;

    // 可预约日期
    @TableField("MEET_DAYS")
    private String meetDays;

    // 最大人数
    @TableField("MEET_MAX_CNT")
    private long meetMaxCnt;

    @TableField("MEET_ORDER")
    private int meetOrder;

    @TableField("MEET_VOUCH")
    private int meetVouch;

    @TableField("MEET_VIEW_CNT")
    private long meetViewCnt;

    @TableField("MEET_FORMS")
    private String meetForms;

    @TableField("MEET_OBJ")
    private String meetObj;


}
