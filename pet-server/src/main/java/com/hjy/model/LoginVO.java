package com.hjy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/3 09:46
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LoginVO implements Serializable {
    private Long id;
    private String openId;
    private String token;
}
