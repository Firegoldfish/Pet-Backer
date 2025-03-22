package com.hjy.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Appointment implements Serializable {
    public static final long serialVersionUID = 1L;
    private Integer appointmentId; // 预约家政ID
    private Integer appointmentUsers; // 预约用户
    private String userName; // 用户名称
    private Integer petServiceUsers; // 家政用户
    private String staffName; // 员工名称
    private String petbackerName; // 家政名称
    private String petType; // 宠物类型
    private String serviceFees; // 服务费用
    private Timestamp homeVisitTime; // 上门时间
    private String mattersNeedingAttention; // 注意事项
    private String examineState; // 审核状态
    private String payState; // 支付状态
    private String payType; // 支付类型: 微信、支付宝、网银
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
