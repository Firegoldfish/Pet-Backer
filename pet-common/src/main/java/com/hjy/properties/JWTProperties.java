package com.hjy.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Note: 用户端微信用户生成jwt令牌相关配置
 * @Author：Bill_Huo
 * @Date：2025/4/3 10:14
 */
@Data
@ConfigurationProperties(prefix = "pet.jwt")
@Component
public class JWTProperties {
    private String secret;
    private long custExpire;
    private String userTokenName;
}
