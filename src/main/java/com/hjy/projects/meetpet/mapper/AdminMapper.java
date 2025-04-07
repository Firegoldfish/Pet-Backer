package com.hjy.projects.meetpet.mapper;

import com.hjy.framework.core.mapper.ProjectBaseMapper;
import com.hjy.projects.meetpet.model.AdminModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("MeetPetAdminMapper")
@Mapper
public interface AdminMapper extends ProjectBaseMapper<AdminModel> {
}
