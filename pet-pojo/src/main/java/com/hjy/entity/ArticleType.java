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

public class ArticleType implements Serializable {
    public static final long serialVersionUID = 1L;
    private Integer typeId; // 分类ID
    private Integer display; // 显示顺序
    private String name; // 分类名称
    private Integer fatherId; // 上级分类ID
    private String description; // 描述
    private String icon; // 分类图标
    private String url; // 外链地址
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
