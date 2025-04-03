package com.hjy.service.impl;

import com.hjy.core.domain.LoginDTO;
import com.hjy.model.UserModel;
import com.hjy.properties.WechatProperties;
import com.hjy.service.LoginService;
import com.hjy.exception.LoginFailedException;
import com.hjy.utils.HttpClientUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSON;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import com.hjy.mapper.UserMapper;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/3 09:50
 */
@Service
@Slf4j
public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private WechatProperties wechatProperties;

    public static final String WX_LOGIN = "https://api.weixin.qq.com/sns/jscode2session";
    /**
     * 微信登录
     */
    public UserModel wxlogin(LoginDTO loginDTO) {
        //调用微信登录
        String openId = getOpenId(loginDTO.getCode());
        //判断openid是否为空，为空抛出异常
        if (openId == null) {
            //抛出异常
            throw new LoginFailedException("登录失败");
        }
        //判断当前用户是否为新用户，如果是新用户则自动注册，存数据库
        UserModel user = userMapper.getByOpenid(openId);
        if (user == null) {
            //新用户
            user.setOpenId(openId);
//            user = UserModel.builder()
//                    .openId(openId)
//                    .createTime(LocalDateTime.now())
//                    .build();
            userMapper.add(user);
        }
        //返回用户信息
        return user;
    }
    private String getOpenId(String code) {
        HashMap<String, String> map = new HashMap<>();
        map.put("appid", wechatProperties.getAppid());
        map.put("secret", wechatProperties.getSecret());
        map.put("js_code", code);
        map.put("grant_type", "authorization_code");
        String s = HttpClientUtils.doGet(WX_LOGIN, map);
        JSONObject jsonObject = JSON.parseObject(s);
        String openid = jsonObject.getString("openid");
        return openid;
    }
}