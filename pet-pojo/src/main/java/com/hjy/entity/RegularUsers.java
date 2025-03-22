package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegularUsers implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer regularUsersId; // 普通用户ID
    private String userName; // 用户名称
    private String userGender; // 用户性别
    private String contactNumber; // 联系电话
    private String examineState; // 审核状态
    private Integer userId; // 用户ID
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
