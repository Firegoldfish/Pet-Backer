package com.hjy.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.constant.core.model.BaseModel;
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

}
