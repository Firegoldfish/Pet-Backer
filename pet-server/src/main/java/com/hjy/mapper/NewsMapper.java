package com.hjy.mapper;

import com.hjy.core.mapper.ProjectBaseMapper;
import com.hjy.model.NewsModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/5 23:20
 */
@Repository("NewsMapper")
@Mapper
public interface NewsMapper extends ProjectBaseMapper<NewsModel> {
}
