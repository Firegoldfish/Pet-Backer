package com.hjy.constant.core.model;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/3/19 15:32
 */

@Data
public class BaseModel {
    private static final long serialVersionUID = 1L;

    @TableField("add_time")
    private Long addTime;

    @TableField("edit_time")
    private Long editTime;
}
