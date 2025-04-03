package com.hjy.core.domain;
import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @Note: 分页结果集
 * @Author：Bill_Huo
 * @Date：2025/4/3 15:03
 */


@Data
public class PageResult implements Serializable {
    /***
     * 每页记录行数
     */
    private Long size;

    /***
     * 总页数
     */
    private Long count;

    /***
     * 记录总数
     */
    private Long total;

    /**
     * 当前页码
     */
    private Long page;

    /***
     * 返回记录集
     */
    private List<Map<String, Object>> list;


}

