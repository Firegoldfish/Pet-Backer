package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Withdrawal implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer withdrawalId; // 提现申请ID
    private Integer petbackerStaff; // 家政员工
    private String staffName; // 员工姓名
    private Integer withdrawalAmount; // 提现金额
    private String withdrawalMethod; // 提现方式
    private Timestamp withdrawalTime; // 提现时间
    private String examineState; // 审核状态
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
