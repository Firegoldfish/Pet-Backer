package com.hjy.projects.meetpet.service.cust;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hjy.framework.core.domain.PageParams;
import com.hjy.framework.core.domain.PageResult;
import com.hjy.framework.core.mapper.Where;
import com.hjy.projects.meetpet.mapper.FavMapper;
import com.hjy.projects.meetpet.model.FavModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Notes: 收藏业务逻辑
 * @Author: Bill_Huo
 * @Date: 2025/2/28 16:12

 */

@Service("MeetPetFavService")
public class FavService extends BaseMyCustService {


    @Resource(name = "MeetPetFavMapper")
    private FavMapper favMapper;

    /** 是否收藏 */
    public Boolean isFav(long userId, long oid) {
        Where<FavModel> where = new Where<>();
        where.eq("FAV_OID", oid);
        where.eq("FAV_USER_ID", userId);
        return favMapper.exists(where);
    }

    /** 更新收藏 */
    public Boolean updateFav(long userId, long oid, String title, String type, String path) {
        Boolean isFav = this.isFav(userId, oid);

        if (isFav) {
            // 取消收藏
            this.delFav(userId, oid);
            return false;
        }


        // 保存
        FavModel fav = new FavModel();
        fav.setFavTitle(title);
        fav.setFavOid(oid);
        fav.setFavType(type);
        fav.setFavPath(path);
        fav.setFavUserId(userId);
        favMapper.add(fav);

        return true;

    }

    /** 取消收藏 */
    public int delFav(long userId, long oid) {
        Where<FavModel> where = new Where<>();
        where.eq("FAV_OID", oid);
        where.eq("FAV_USER_ID", userId);
        return favMapper.delete(where);
    }


    /** 我的收藏列表 */
    public PageResult getMyFavList(long userId, PageParams pageRequest) {

        Where<FavModel> where = new Where<>();
        where.eq("FAV_USER_ID", userId);

        // 排序
        where.orderByDesc("FAV_ID");


        Page page = new Page(pageRequest.getPage(), pageRequest.getSize());
        return favMapper.getPageList(page, where, "FAV_TITLE,FAV_OID,FAV_TYPE,FAV_PATH,ADD_TIME");
    }
}
