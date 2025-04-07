package com.hjy.projects.meetpet.service.cust;

import com.hjy.projects.meetpet.mapper.MeetJoinMapper;
import com.hjy.projects.meetpet.mapper.MeetMapper;
import com.hjy.projects.meetpet.mapper.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Notes: 活动模块业务逻辑
 * @Author: Bill_Huo
 * @Date: 2025/3/7 5:41

 */

@Service("MeetPetTestService")
public class TestService extends BaseMyCustService {

    @Resource(name = "MeetPetMeetMapper")
    private MeetMapper meetMapper;

    @Resource(name = "MeetPetMeetJoinMapper")
    private MeetJoinMapper meetJoinMapper;

    @Resource(name = "MeetPetUserMapper")
    private UserMapper userMapper;


    public void test() {

    }

}
