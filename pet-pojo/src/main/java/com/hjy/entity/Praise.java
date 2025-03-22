package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Praise implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer praiseId; // 点赞ID
    private Integer userId; // 点赞人
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
    private String sourceTable; // 来源表
    private String sourceField; // 来源字段
    private Integer sourceId; // 来源ID
    private Boolean status; // 点赞状态:1点赞，0已取消
}
