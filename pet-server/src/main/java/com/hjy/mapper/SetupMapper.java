package com.hjy.mapper;

import com.hjy.core.mapper.ProjectBaseMapper;
import com.hjy.model.SetupModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @Note: 文件上传
 * @Author：Bill_Huo
 * @Date：2025/4/6 15:43
 */
@Repository("SetupMapper")
@Mapper
public interface SetupMapper extends ProjectBaseMapper<SetupModel> {
}
