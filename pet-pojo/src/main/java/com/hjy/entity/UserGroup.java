package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserGroup implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer groupId; // 用户组ID
    private Integer display; // 显示顺序
    private String name; // 名称
    private String description; // 描述
    private String sourceTable; // 来源表
    private String sourceField; // 来源字段
    private Integer sourceId; // 来源ID
    private Integer register; // 注册位置
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
