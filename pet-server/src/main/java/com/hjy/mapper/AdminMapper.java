package com.hjy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hjy.core.mapper.ProjectBaseMapper;
import com.hjy.model.AdminModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/4 17:54
 */
@Repository("AdminMapper")
@Mapper
public interface AdminMapper extends ProjectBaseMapper<AdminModel> {
}
