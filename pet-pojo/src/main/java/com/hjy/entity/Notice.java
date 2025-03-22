package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notice implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer noticeId; // 公告ID
    private String title; // 标题
    private String content; // 正文
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
