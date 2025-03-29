package com.hjy.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.constant.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Note: 服务项目实体
 * @Author：Bill_Huo
 * @Date：2025/2/19 17:49
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("reserve")
public class ReserveModel extends BaseModel {
    public static final class STATUS {
        public static final int STOP = 0; //非正常
        public static final int NORMAL = 1; // 使用中
    }

    @TableId(value = "reserve_id", type = IdType.AUTO)
    private Long reserveId;

    @TableField("reserve_title")
    private String reserveTitle;

    @TableField("reserve_cate_id")
    private Long reserveCateId;

    @TableField("reserve_cate_name")
    private String reserveCateName;

    @TableField("reserve_status")
    private int reserveStatus;

    @TableField("reserve_order")
    private int reserveOrder;

    @TableField("reserve_vouch")
    private int reserveVouch;

    @TableField("reserve_days") //可预约日期
    private String reserveDays;

    @TableField("reserve_view_cnt")
    private Long reserveViewCnt;

    @TableField("reserve_max_cnt")
    private Long reserveMaxCnt;

    @TableField("reserve_forms")
    private String reserveForms;

    @TableField("reserve_obj")
    private String reserveObj;

}
