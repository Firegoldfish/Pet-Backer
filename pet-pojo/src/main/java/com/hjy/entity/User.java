package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer userId; // 用户ID
    private Integer state; // 账户状态
    private String userGroup; // 所在用户组
    private Timestamp loginTime; // 上次登录时间
    private String phone; // 手机号码
    private Integer phoneState; // 手机认证
    private String username; // 用户名
    private String nickname; // 昵称
    private String password; // 密码
    private String email; // 邮箱
    private Integer emailState; // 邮箱认证
    private String avatar; // 头像地址
    private Timestamp createTime; // 创建时间
}
