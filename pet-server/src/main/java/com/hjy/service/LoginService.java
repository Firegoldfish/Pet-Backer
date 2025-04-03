package com.hjy.service;

import com.hjy.core.domain.LoginDTO;
import com.hjy.model.UserModel;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/4/3 09:49
 */

public interface LoginService {
    UserModel wxlogin(LoginDTO loginDTO);
}
