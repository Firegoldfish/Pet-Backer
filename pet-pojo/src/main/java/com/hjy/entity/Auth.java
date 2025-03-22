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

public class Auth implements Serializable {
    private Integer authId; // 权限ID
    private String userGroup; // 用户组
    private String modName; // 模块名
    private String tableName; // 表名
    private String pageTitle; // 页面标题
    private String path; // 路由路径
    private String position; // 位置
    private String mode; // 跳转方式
    private Boolean add; // 是否可增加
    private Boolean del; // 是否可删除
    private Boolean set; // 是否可修改
    private Boolean get; // 是否可查看
    private String fieldAdd; // 添加字段
    private String fieldSet; // 修改字段
    private String fieldGet; // 查询字段
    private String tableNavName; // 跨表导航名称
    private String tableNav; // 跨表导航
    private String option; // 配置
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
