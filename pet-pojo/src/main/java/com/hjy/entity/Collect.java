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

public class Collect implements Serializable {
    public static final long serialVersionUID = 1L;
    private Integer collectId; // 收藏ID
    private Integer userId; // 收藏人ID
    private String sourceTable; // 来源表
    private String sourceField; // 来源字段
    private Integer sourceId; // 来源ID
    private String title; // 标题
    private String img; // 封面
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
