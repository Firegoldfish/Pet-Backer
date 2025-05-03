package com.hjy.projects.meetpet.controller.cust;

import org.springframework.web.bind.annotation.PostMapping;

import java.util.HashMap;

/**
 * @Note: 微信登录。做展示用
 * @Author：Bill_Huo
 * @Date：2025/5/3 15:20
 */

/**
public class LoginController {
    @PostMapping("/login")

    public Result<UserLoginVO> login(@RequestBody UserLoginDTO userLoginDTO) {
        log.info("微信用户登录：{}", userLoginDTO.getCode());
        //调用微信登录
        User user = userService.wxlogin(userLoginDTO);
        //为微信用户生成jwt令牌
        Map<String, Object> claims = new HashMap<>();
        claims.put(JwtClaimsConstant.USER_ID, user.getId());
        String token = JwtUtil.createJWT(jwtProperties.getUserSecretKey(), jwtProperties.getUserTtl(), claims);
        UserLoginVO userLoginVO = UserLoginVO.builder()
                .id(user.getId())
                .openid(user.getOpenid())
                .token(token)
                .build();
        return Result.success(userLoginVO);
    }
}
*/
