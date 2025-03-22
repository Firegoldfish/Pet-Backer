package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PetServices implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer petServicesId; // 家政服务ID
    private Integer petServiceUsers; // 家政用户
    private String staffName; // 员工名称
    private String petbackerName; // 家政名称
    private String petbackerPhotos; // 家政照片
    private String petType; // 宠物类型
    private String serviceScope; // 服务范围
    private Timestamp serviceTime; // 服务时间
    private Integer serviceFees; // 服务费用
    private String personalProfile; // 个人简介
    private String introductionToPetEconomics; // 家政介绍
    private String contactInformation; // 联系方式
    private Integer hits; // 点击数
    private Integer praiseLen; // 点赞数
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
