package com.hjy.utils;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.JWTUtil;
import com.hjy.config.AppConfig;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Map;

/**
 * @Note:
 * @Author：Bill_Huo
 * @Date：2025/2/21 23:50
 */

public class JWTUtils {


    /**
     * 根据 map 生成 token 默认：HS265(HmacSHA256)算法, expire单位毫秒
     */
    public static String genToken(long id, String name, String sub, Long expire) {
        JWT jwt = JWT.create();

        // 设置携带数据
        jwt.setPayload("id", id);
        jwt.setPayload("name", name);

        jwt.setSubject(sub);

        // 设置密钥
        jwt.setKey(AppConfig.JWT_SECERT.getBytes());

        // 设置过期时间
        jwt.setExpiresAt(new Date(System.currentTimeMillis() + expire * 1000));

        return jwt.sign();
    }

    public static String genToken(Map<String, Object> map, String sub, Long expire) {
        JWT jwt = JWT.create();

        // 设置携带数据
        map.forEach(jwt::setPayload);

        jwt.setSubject(sub);

        // 设置密钥
        jwt.setKey(AppConfig.JWT_SECERT.getBytes());

        // 设置过期时间
        jwt.setExpiresAt(new Date(System.currentTimeMillis() + expire * 1000));

        return jwt.sign();
    }


    public static boolean check(String token) {
        if (StrUtil.isEmpty(token)) return false;
        try {
            return JWT.of(token).setKey(AppConfig.JWT_SECERT.getBytes()).validate(0);
        } catch (Exception ex) {
            return false;
        }
    }

    public static JSONObject getTokenData(String token) {

        JWT jwt = JWTUtil.parseToken(token).setKey(AppConfig.JWT_SECERT.getBytes());


        JSONObject payloads = jwt.getPayloads();


        return payloads;
    }

//    public static LoginDTO getToken(String token) {
//
//        JWT jwt = JWTUtil.parseToken(token).setKey(AppConfig.JWT_SECERT.getBytes());
//
//
//        JSONObject payloads = jwt.getPayloads();
//
//        LoginDTO dto = new LoginDTO();
//        dto.setId(payloads.get("id", Long.class));
//        dto.setName(payloads.get("name", String.class));
//
//        return dto;
//    }

    public static String getSub(String token) {
        JSONObject ret = getTokenData(token);
        if (ObjectUtil.isEmpty(ret) || !ret.containsKey("sub")) return "";

        String sub = (String) ret.get("sub");
        if (StrUtil.isEmpty(sub)) return "";
        return sub;
    }

    public static String createJWT(String secretKey, long ttlMillis, Map<String, Object> claims) {
        // 指定签名的时候使用的签名算法，也就是header那部分
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

        // 生成JWT的时间
        long expMillis = System.currentTimeMillis() + ttlMillis;
        Date exp = new Date(expMillis);

        // 设置jwt的body
        JwtBuilder builder = Jwts.builder()
                // 如果有私有声明，一定要先设置这个自己创建的私有的声明，这个是给builder的claim赋值，一旦写在标准的声明赋值之后，就是覆盖了那些标准的声明的
                .setClaims(claims)
                // 设置签名使用的签名算法和签名使用的秘钥
                .signWith(signatureAlgorithm, secretKey.getBytes(StandardCharsets.UTF_8))
                // 设置过期时间
                .setExpiration(exp);

        return builder.compact();
    }
}

