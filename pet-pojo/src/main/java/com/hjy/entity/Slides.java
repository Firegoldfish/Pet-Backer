package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Slides implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer slidesId; // 轮播图ID
    private String title; // 标题
    private String content; // 内容
    private String url; // 链接
    private String img; // 轮播图
    private Integer hits; // 点击量
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
