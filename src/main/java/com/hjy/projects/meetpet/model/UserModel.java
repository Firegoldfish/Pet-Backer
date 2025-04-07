package com.hjy.projects.meetpet.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.framework.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Notes: 用户实体
 * @Author: Bill_Huo
 * @Date: 2025/2/16 9:35

 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("meetpet_user")
public class UserModel extends BaseModel {
    /**
     * 状态
     */
    public static final class STATUS {

        public static final int NORMAL = 1; // 正常
        public static final int FORBID = 9; //禁用
    }

    @TableId(value = "USER_ID", type = IdType.AUTO)
    private Long userId;

    @TableField("USER_STATUS")
    private int userStatus;

    @TableField("USER_ACCOUNT")
    private String userAccount;

    @TableField("USER_PASSWORD")
    private String userPassword;

    @TableField("USER_ADDRESS")
    private String userAddress;

    @TableField("USER_NAME")
    private String userName;


    @TableField("USER_LOGIN_CNT")
    private long userLoginCnt;

    @TableField("USER_LOGIN_TIME")
    private long userLoginTime;


    @TableField("USER_FORMS")
    private String userForms;

    @TableField("USER_OBJ")
    private String userObj;

}
