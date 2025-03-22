package com.hjy.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.io.Serializable;

@Data   // 自动生成 Getter、Setter、toString、equals 和 hashCode 方法
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class AccessToken implements Serializable {
    public static final long serialVersionUID = 1L;

    private Integer tokenId; // 临时访问牌ID
    private String token; // 临时访问牌
    private String info; // 附加信息
    private Integer maxage; // 最大寿命（小时）
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
    private Integer userId; // 用户编号
}
