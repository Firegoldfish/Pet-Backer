package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Evaluation implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer evaluationId; // 售后评价ID
    private Integer appointmentUsers; // 预约用户
    private String userName; // 用户名称
    private Integer petServiceUsers; // 家政用户
    private String staffName; // 员工姓名
    private String petbackerName; // 家政名称
    private String petEconomicsPictures; // 家政图片
    private String petType; // 宠物类型
    private String serviceAttitude; // 服务态度
    private String serviceAchievements; // 服务成果
    private Integer hits; // 点击数
    private Integer praiseLen; // 点赞数
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
