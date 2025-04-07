package com.hjy.projects.meetpet.mapper;

import com.hjy.framework.core.mapper.ProjectBaseMapper;
import com.hjy.projects.meetpet.model.MeetModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository("MeetPetMeetMapper")
@Mapper
public interface MeetMapper extends ProjectBaseMapper<MeetModel> {
}
