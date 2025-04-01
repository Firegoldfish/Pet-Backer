package com.hjy.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Note: 用户实体
 * @Author：Bill_Huo
 * @Date：2025/2/19 17:27
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("user")
public class UserModel extends BaseModel {
    /**
     * 状态
     */
    public static final class STATUS {

        public static final int NORMAL = 1; // 正常
        public static final int FORBID = 9; //禁用
    }

    @TableId(value= "user_id", type = IdType.AUTO)
    private Long userId;

    @TableField("open_id")
    private String openId;

    @TableField("user_name")
    private String userName;

    @TableField("user_status")
    private int userStatus;

    @TableField("user_account")
    private String userAccount;

    @TableField("user_password")
    private String userPassword;

    @TableField("user_login_cnt")
    private long userLoginCnt;

    @TableField("user_login_time")
    private long userLoginTime;

    @TableField("user_forms")
    private String userForms;

    @TableField("user_obj")
    private String userObj;
}
