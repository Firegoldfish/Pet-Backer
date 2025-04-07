package com.hjy.projects.meetpet.mapper;

import com.hjy.framework.core.mapper.ProjectBaseMapper;
import com.hjy.projects.meetpet.model.FavModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository("MeetPetFavMapper")
@Mapper
public interface FavMapper extends ProjectBaseMapper<FavModel> {
}
