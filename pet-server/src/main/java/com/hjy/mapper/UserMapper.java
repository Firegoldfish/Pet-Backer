package com.hjy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hjy.core.mapper.ProjectBaseMapper;
import com.hjy.model.UserModel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/3 14:52
 */
@Mapper
@Repository("UserMapper")
public interface UserMapper extends ProjectBaseMapper<UserModel> {
    /**
     * 根据openid查询用户
     * @param openid
     * @return
     */
    @Select("select * from user where openId = #{open_id}")
    UserModel getByOpenid(String openid);
}
