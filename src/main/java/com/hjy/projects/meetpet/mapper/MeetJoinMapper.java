package com.hjy.projects.meetpet.mapper;

import com.hjy.framework.core.mapper.ProjectBaseMapper;
import com.hjy.projects.meetpet.model.MeetJoinModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository("MeetPetMeetJoinMapper")
@Mapper
public interface MeetJoinMapper extends ProjectBaseMapper<MeetJoinModel> {

}
