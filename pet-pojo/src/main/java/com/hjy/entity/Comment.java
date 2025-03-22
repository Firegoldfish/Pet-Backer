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

public class Comment implements Serializable {
    public static final long serialVersionUID = 1L;
    private Integer commentId; // 评论ID
    private Integer userId; // 评论人ID
    private Integer replyToId; // 回复评论ID
    private String content; // 内容
    private String nickname; // 昵称
    private String avatar; // 头像地址
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
    private String sourceTable; // 来源表
    private String sourceField; // 来源字段
    private Integer sourceId; // 来源ID
}
