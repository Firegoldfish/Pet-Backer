package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Customization implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer customizationId; // 家政定制ID
    private Integer customizedUsers; // 定制用户
    private String userName; // 用户名称
    private String petbackerName; // 家政名称
    private String petbackerPhotos; // 家政照片
    private String petbackerAddress; // 家政地址
    private Integer serviceFees; // 服务费用
    private Timestamp homeVisitTime; // 上门时间
    private String petEconomicsContent; // 家政内容
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
