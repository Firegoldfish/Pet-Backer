package com.hjy.projects.meetpet.mapper;

import com.hjy.framework.core.mapper.ProjectBaseMapper;
import com.hjy.projects.meetpet.model.SetupModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("MeetPetSetupMapper")
@Mapper
public interface SetupMapper extends ProjectBaseMapper<SetupModel> {
}
