package com.hjy.mapper;

import com.hjy.core.mapper.ProjectBaseMapper;
import com.hjy.model.ReserveModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/5 23:26
 */
@Repository("ReserveMapper")
@Mapper
public interface ReserveMapper extends ProjectBaseMapper<ReserveModel> {
}
