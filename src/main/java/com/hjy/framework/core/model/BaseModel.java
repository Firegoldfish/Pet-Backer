package com.hjy.framework.core.model;


import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

@Data
public class BaseModel {
    private static final long serialVersionUID = 1L;


    @TableField("ADD_TIME")
    private Long addTime;

    @TableField("EDIT_TIME")
    private Long editTime;


    /*
    public Long getAddTime() { // 新入库自动填充
        if (ObjectUtil.isNull(id) && ObjectUtil.isNull(addTime)) return TimeHelper.time();
        else
            return this.addTime;
    }

    public Long getEditTime() { // 新入库自动填充
        if (ObjectUtil.isNull(id) && ObjectUtil.isNull(editTime)) return TimeHelper.time();
        else
            return this.editTime;
    }*/

}

