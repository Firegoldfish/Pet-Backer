package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommentReply implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer commentReplyId; // 评论回复ID
    private Integer petServiceUsers; // 家政用户
    private String staffName; // 员工姓名
    private Integer appointmentUsers; // 预约用户
    private String userName; // 用户名称
    private String replyContent; // 回复内容
    private Timestamp createTime; // 创建时间
    private Timestamp updateTime; // 更新时间
}
