package com.hjy.utils;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.hjy.config.AppConfig;
import com.hjy.exception.AppException;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Note: 文件工具
 * @Author： Bill_Huo
 * @Date： 2025/4/6 15:46
 */

public class FileUtils {
    // form里的图片提取的正则表达式
    static final String REG_FORM_PIC = "\\[pic\\](.*?)\\\"";


    // 保存上传的图片文件，返回URL
    public static String saveUpLoadFile(MultipartFile file, String pid) {

        if (file.isEmpty()) throw new AppException("上传文件不能为空");

        // 生成文件名
        String fileName = file.getOriginalFilename();
        String extend = fileName.substring(fileName.lastIndexOf("."), fileName.length());

        String savePath = getFileSavePath(pid, extend, "pic");
        try {
            FileUtil.writeBytes(file.getBytes(), savePath);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            throw new AppException("文件上传异常，请稍后再试");
        }

        return getFileSaveURL(savePath);
    }

    // 保存自己内部生成的图片文件，返回数据库保存的相对路径
    public static String saveLocalFile(String pid, byte[] data, String fileName) {

        String savePath = getFileSavePath(pid, "jpg", "qr");

        try {
            FileUtil.writeBytes(data, savePath);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            throw new AppException("文件保存异常，请稍后再试");
        }

        return getFileSaveURL(savePath);

    }


    private static String getFileRelative(String pid, String ext, String prefix) {
        if (!pid.endsWith("/")) pid += '/';

        String day = TimeUtils.getNowTime("yyyyMMdd") + "/";

        ext = ext.toLowerCase();
        if (!ext.startsWith(".")) ext = "." + ext;

        if (!prefix.endsWith("_")) prefix += "_";

        String fileName = prefix + TimeUtils.getNowTime("") + RandomUtil.randomNumbers(8) + ext;

        return pid + day + fileName;
    }

    /**
     * 文件保存的服务器路径
     */
    public static String getFileSavePath(String pid, String ext, String prefix) {
        return AppConfig.UPLOAD_PATH + getFileRelative(pid, ext, prefix);
    }

    /**
     * 文件保存的URL，原始生成
     */
    public static String getFileSaveURL(String pid, String ext, String prefix) {
        return AppConfig.UPLOAD_SERVER + getFileRelative(pid, ext, prefix);
    }

    /**
     * 文件保存的URL,根据保存路径生成
     */
    public static String getFileSaveURL(String savePath) {
        return StrUtil.replace(savePath, AppConfig.UPLOAD_PATH, AppConfig.UPLOAD_SERVER);
    }

}