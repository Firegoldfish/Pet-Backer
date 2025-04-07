package com.hjy.projects.meetpet.mapper;

import com.hjy.framework.core.mapper.ProjectBaseMapper;
import com.hjy.projects.meetpet.model.UserModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("MeetPetUserMapper")
@Mapper
public interface UserMapper extends ProjectBaseMapper<UserModel> {
}
