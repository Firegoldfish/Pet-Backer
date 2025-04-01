package com.hjy.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Note: 用户预约实体
 * @Author：Bill_Huo
 * @Date：2025/2/19 18:07
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("reserve_join")
public class ReserveJoinModel extends BaseModel {
    /**
     * 状态
     */
    public static final class STATUS {
        public static final int STOP = 0; //撤销
        public static final int NORMAL = 1; // 正常
    }

    @TableId(value = "reserve_join_id", type = IdType.AUTO)
    private Long reserveJoinId;

    @TableField("reserve_join_user_id")
    private Long reserveJoinUserId;

    @TableField("reserve_join_reserve_id")
    private Long reserveJoinReserveId;

    @TableField("reserve_join_code")
    private String reserveJoinCode;

    @TableField("reserve_join_is_check")
    private int reserveJoinIsCheck;

    @TableField("reserve_join_check_time")
    private long reserveJoinCheckTime;

    @TableField("reserve_join_forms")
    private String reserveJoinForms;

    @TableField("reserve_join_obj")
    private String reserveJoinObj;

    @TableField("reserve_join_status")
    private int reserveJoinStatus;

    @TableField("reserve_join_time")
    private String reserveJoinTime;

    @TableField("reserve_join_day")
    private String reserveJoinDay;

    @TableField("reserve_join_reserve_title")
    private String reserveJoinReserveTitle;

}
