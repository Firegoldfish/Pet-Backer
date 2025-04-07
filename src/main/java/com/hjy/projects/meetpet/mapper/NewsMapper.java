package com.hjy.projects.meetpet.mapper;

import com.hjy.framework.core.mapper.ProjectBaseMapper;
import com.hjy.projects.meetpet.model.NewsModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("MeetPetNewsMapper")
@Mapper
public interface NewsMapper extends ProjectBaseMapper<NewsModel> {
}
