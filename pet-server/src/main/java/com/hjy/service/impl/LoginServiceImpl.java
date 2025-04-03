package com.hjy.service.impl;

import com.hjy.core.domain.LoginDTO;
import com.hjy.model.UserModel;
import com.hjy.properties.WechatProperties;
import com.hjy.service.LoginService;
import com.hjy.exception.LoginFailedException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/3 09:50
 */
@Service
@Slf4j
public class LoginServiceImpl implements LoginService {
    public static final String WX_LOGIN = "https://api.weixin.qq.com/sns/jscode2session";
    /**
     * 微信登录
     */
    public UserModel wxlogin(LoginDTO loginDTO) {
        //调用微信登录
        String openid = getOpenId(LoginDTO.getCode());
        //判断openid是否为空，为空抛出异常
        if (openid == null) {
            //抛出异常
            throw new LoginFailedException("登录失败");
        }
        //判断当前用户是否为新用户，如果是新用户则自动注册，存数据库
        UserModel user = userMapper.getByOpenid(openid);
        if (user == null) {
            //新用户
            user = UserModel.builder()
                    .openid(openid)
                    .createTime(LocalDateTime.now())
                    .build();
            userMapper.insert(user);
        }
        //返回用户信息
        return user;
    }
    private String getOpenId(String code) {
        HashMap<String, String> map = new HashMap<>();
        map.put("appid", WechatProperties.getAppid());
        map.put("secret", WechatProperties.getSecret());
        map.put("js_code", code);
        map.put("grant_type", "authorization_code");
        String s = HttpClientUtil.doGet(WX_LOGIN, map);
        JSONObject jsonObject = JSON.parseObject(s);
        String openid = jsonObject.getString("openid");
        return openid;
    }
    }
}
