package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Orders implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer ordersId; // 家政接单ID
    private Integer petServiceUsers; // 家政用户
    private String staffName; // 员工名称
    private Integer customizedUsers; // 定制用户
    private String userName; // 用户名称
    private String petbackerName; // 家政名称
    private String petbackerAddress; // 家政地址
    private String serviceFees; // 服务费用
    private String homeVisitTime; // 上门时间
    private String petEconomicsContent; // 家政内容
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
