package com.hjy.core.mapper;

import cn.hutool.core.util.StrUtil;
import com.github.yulichang.wrapper.MPJLambdaWrapper;

/**
 * @Note: 前端直接传来排序字段
 * @Author：Bill_Huo
 * @Date：2025/4/3 15:09
 */
public class WhereJoin<T> extends MPJLambdaWrapper<T> {
    public MPJLambdaWrapper<T> fmtOrderBySort(String sortVal, String defaultSort) {
        if (StrUtil.contains(sortVal,"|")) {
            String[] arr = sortVal.split("\\|");

            if (arr[1].equals("desc"))
                return this.orderByDesc(arr[0]);
            else
                return this.orderByAsc(arr[0]);

        }
        else if (StrUtil.isNotEmpty(defaultSort)){
            return this.orderByDesc(defaultSort);
        }

        return this.typedThis;
    }
}
