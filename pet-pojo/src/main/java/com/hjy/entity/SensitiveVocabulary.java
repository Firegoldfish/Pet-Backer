package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SensitiveVocabulary implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer sensitiveVocabularyId; // 敏感词汇ID
    private String sensitiveVocabulary; // 敏感词汇
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
