package com.hjy.projects.meetpet.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.framework.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Notes: 设置实体
 * @Author: Bill_Huo
 * @Date: 2025/2/10 9:35

 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("meetpet_setup")
public class SetupModel extends BaseModel {

    @TableId(value = "SETUP_ID", type = IdType.AUTO)
    private Long setupId;

    @TableField("SETUP_TYPE")
    private String setupType;

    @TableField("SETUP_KEY")
    private String setupKey;

    @TableField("SETUP_VALUE")
    private String setupValue;


}
