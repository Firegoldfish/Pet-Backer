package com.hjy.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Note: 新闻实体
 * @Author：Bill_Huo
 * @Date：2025/2/21 10:28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("news")
public class NewsModel extends BaseModel {
    /**
     * 状态
     */
    public static final class STATUS {
        public static final int STOP = 0; //非正常
        public static final int NORMAL = 1; // 正常
    }
    @TableId(value = "news_id", type = IdType.AUTO)
    private Long id; // 新闻ID

    @TableField("news_title")
    private String title; // 新闻标题

    @TableField("news_cate_id")
    private Long categoryId; // 分类ID

    @TableField("news_cate_name")
    private String categoryName; // 分类名称

    @TableField("news_status")
    private int status; // 状态(0-草稿 1-已发布 2-已下架)

    @TableField("news_order")
    private int newsOrder; // 排序权重

    @TableField("news_vouch")
    private int newsVouch; // 是否推荐(0-否 1-是)

    @TableField("news_content")
    private String content; // 新闻内容(HTML格式)

    @TableField("news_view_cnt")
    private Integer newsViewCnt = 0; // 浏览次数

    @TableField("news_pic")
    private String coverImage; // 封面图URL

    @TableField("news_obj")
    private String extraData; // 扩展数据(JSON格式)

    @TableField("news_forms")
    private String formData; // 表单数据(JSON格式)
}
