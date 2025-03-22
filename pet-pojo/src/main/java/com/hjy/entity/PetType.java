package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PetType implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer petTypeId; // 宠物类型ID
    private String petType; // 宠物类型
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}