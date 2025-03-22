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

public class Article implements Serializable {
    public static final long serialVersionUID = 1L;
    private Integer articleId; // 文章ID
    private String title; // 标题
    private String type; // 文章分类
    private Integer hits; // 点击数
    private Integer praiseLen; // 点赞数
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
    private String source; // 来源
    private String url; // 来源地址
    private String tag; // 标签
    private String content; // 正文
    private String img; // 封面图
    private String description; // 文章描述
}
