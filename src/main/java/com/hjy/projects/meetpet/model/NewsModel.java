package com.hjy.projects.meetpet.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hjy.framework.core.model.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Notes: 资讯实体
 * @Author: Bill_Huo
 * @Date: 2025/2/16 9:35
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("meetpet_news")
public class NewsModel extends BaseModel {
    /**
     * 状态
     */
    public static final class STATUS {
        public static final int STOP = 0; //非正常
        public static final int NORMAL = 1; // 正常
    }

    @TableId(value = "NEWS_ID", type = IdType.AUTO)
    private Long newsId;

    @TableField("NEWS_TITLE")
    private String newsTitle;

    @TableField("NEWS_STATUS")
    private int newsStatus;

    @TableField("NEWS_CATE_ID")
    private Long newsCateId;

    @TableField("NEWS_CATE_NAME")
    private String newsCateName;

    @TableField("NEWS_ORDER")
    private int newsOrder;

    @TableField("NEWS_VOUCH")
    private int newsVouch;

    @TableField("NEWS_VIEW_CNT")
    private long newsViewCnt;

    @TableField("NEWS_FORMS")
    private String newsForms;

    @TableField("NEWS_OBJ")
    private String newsObj;

}
