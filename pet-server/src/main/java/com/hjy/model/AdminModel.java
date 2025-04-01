package com.hjy.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
*@Note: 管理员实体
*@Author：Bill_Huo
*@Date：2025/2/19  16:28
*/

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("admin")
public class AdminModel extends BaseModel {
    /**
     * 状态
     */
    public static final class STATUS {
        public static final int STOP = 0; //停用
        public static final int NORMAL = 1; // 正常
    }

    /**
     * 类型
     */
    public static final class TYPE {
        public static final int COMM = 0; //普通管理员
        public static final int SUPER = 1; // 超管
        public static final int OTHTER = 9; // 服务人员
    }

    @TableId(value = "admin_id", type= IdType.AUTO)
    private Long adminId;

    @TableField("admin_name")
    private String adminName;

    @TableField("admin_password")
    private String adminPassword;

    @TableField("admin_desc")
    private String adminDesc;

    @TableField("admin_phone")
    private String adminPhone;

    @TableField("admin_login_cnt")
    private int adminLoginCnt;

    @TableField("admin_type")
    private int adminType;

    @TableField("admin_status")
    private int adminStatus;

    @TableField("admin_login_time")
    private Long adminLoginTime;
}
