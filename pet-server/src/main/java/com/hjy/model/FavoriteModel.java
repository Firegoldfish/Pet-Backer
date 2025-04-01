package com.hjy.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Note: 收藏实体
 * @Author：Bill_Huo
 * @Date：2025/2/20 16:46
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("favorite")
public class FavoriteModel extends BaseModel {
    @TableId(value = "favorite_id", type = IdType.AUTO)
    private Long favId;

    @TableField("favorite_user_id")
    private Long userId;  // 优化字段名，去掉冗余前缀

    @TableField("favorite_title")
    private String title;  // 收藏项标题（如服务名称/商品名称）

    @TableField("favorite_type")
    private String type;  // 收藏类型：service-服务, product-商品

    @TableField("favorite_oid")
    private Long objectId;  // 收藏对象ID（服务ID/商品ID）

    @TableField("favorite_path")
    private String path;  // 收藏对象访问路径
}
