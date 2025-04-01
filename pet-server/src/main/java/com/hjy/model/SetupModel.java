package com.hjy.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Note: 设置实体
 * @Author：Bill_Huo
 * @Date：2025/2/21 17:49
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("setup")
public class SetupModel extends BaseModel {
    @TableId(value = "setup_id", type = IdType.AUTO)
    private Long id; // 配置ID

    @TableField("setup_type")
    private String type; // 配置类型（如：email、sms、payment等）

    @TableField("setup_key")
    private String key; // 配置键（唯一标识）

    @TableField("setup_value")
    private String value; // 配置值（JSON格式存储）

}
