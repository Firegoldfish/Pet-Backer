package com.hjy.controller.user;

import com.hjy.core.domain.LoginDTO;
import com.hjy.core.domain.Result;
import com.hjy.model.LoginVO;
import com.hjy.model.UserModel;
import com.hjy.properties.JWTProperties;
import com.hjy.service.LoginService;
import com.hjy.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @Note: 登录控制器
 * @Author：Bill_Huo
 * @Date：2025/4/3 09:42
 */
@RestController("MeetPetPassportController")
public class PassportController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private JWTProperties jwtProperties;

    public Result<LoginVO> login(@RequestBody LoginDTO loginDTO) {
        System.out.println("loginDTO = " + loginDTO.getCode());
        // 调用微信登录
        UserModel userModel = loginService.wxlogin(loginDTO);
        //为微信用户生成jwt
        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", userModel.getUserId());
        String token = JWTUtils.createJWT(jwtProperties.getSecret(),jwtProperties.getCustExpire(),claims);
        LoginVO loginVO = LoginVO.builder()
                .id(userModel.getUserId())
                .openId(userModel.getOpenId())
                .token(token)
                .build();
        return Result.success(loginVO);
    }
}
