package com.hjy.core.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @Note: 微信登录DTO
 * @Author：Bill_Huo
 * @Date：2025/4/2 00:39
 */
@Data
@AllArgsConstructor
public class LoginDTO {
    private String code;
}
