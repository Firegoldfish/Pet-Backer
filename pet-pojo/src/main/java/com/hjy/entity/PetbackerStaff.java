package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PetbackerStaff implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer petbackerStaffId; // 家政员工ID
    private String staffName; // 员工姓名
    private String staffGender; // 员工性别
    private String contactPhoneNumber; // 联系电话
    private String examineState; // 审核状态
    private Integer userId; // 用户ID
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}