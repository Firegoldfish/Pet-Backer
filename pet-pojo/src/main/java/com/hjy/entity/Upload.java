package com.hjy.entity;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Upload implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer uploadId; // 上传ID
    private String name; // 文件名
    private String path; // 访问路径
    private String file; // 文件路径
    private String display; // 显示顺序
    private Integer fatherId; // 父级ID
    private String dir; // 文件夹
    private String type; // 文件类型
}
