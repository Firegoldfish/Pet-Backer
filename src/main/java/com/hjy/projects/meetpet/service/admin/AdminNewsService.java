package com.hjy.projects.meetpet.service.admin;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hjy.framework.core.domain.PageParams;
import com.hjy.framework.core.domain.PageResult;
import com.hjy.framework.core.mapper.UpdateWhere;
import com.hjy.framework.core.mapper.Where;
import com.hjy.projects.meetpet.mapper.NewsMapper;
import com.hjy.projects.meetpet.model.NewsModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Notes: 资讯模块后台管理
 * @Author: Bill_Huo
 * @Date: 2025/2/16 9:35

 */

@Service("MeetPetAdminNewsService")
public class AdminNewsService extends BaseMyAdminService {

    @Resource(name = "MeetPetNewsMapper")
    private NewsMapper newsMapper;


    /** 添加资讯*/
    public Long insertNews(NewsModel news) {
        // 是否重复
        Where<NewsModel> where = new Where<>();
        where.eq("NEWS_TITLE", news.getNewsTitle());
        if (newsMapper.exists(where)) appError("该标题已经存在");

        // 入库
        news.setNewsStatus(NewsModel.STATUS.NORMAL);
        newsMapper.add(news);
        Long id = news.getNewsId();


        return id;
    }

    /** 修改资讯 */
    public void editNews(NewsModel news) {

        // 是否重复
        Where<NewsModel> where = new Where<>();
        where.eq("NEWS_TITLE", news.getNewsTitle());
        where.ne("NEWS_ID", news.getNewsId());
        if (newsMapper.exists(where)) this.appError("该标题已经存在");

        // 入库
        UpdateWhere<NewsModel> uw = new UpdateWhere<>();
        uw.eq("NEWS_ID", news.getNewsId());

        uw.set("NEWS_TITLE", news.getNewsTitle());
        uw.set("NEWS_CATE_ID", news.getNewsCateId());
        uw.set("NEWS_CATE_NAME", news.getNewsCateName());

        uw.set("NEWS_ORDER", news.getNewsOrder());

        uw.set("NEWS_FORMS", news.getNewsForms());
        uw.set("NEWS_OBJ", news.getNewsObj());


        newsMapper.edit(uw);

    }


    /** 资讯列表 */
    public PageResult getAdminNewsList(PageParams pageRequest) {

        Where<NewsModel> where = new Where<>();


        // 关键字查询
        String search = pageRequest.getSearch();
        if (StrUtil.isNotEmpty(search)) {
            where.and(
                    wrapper -> {
                        wrapper.or().like("NEWS_TITLE", search);
                        wrapper.or().like("NEWS_OBJ", search);
                    }
            );
        }

        // 条件查询
        String sortType = pageRequest.getSortType();
        String sortVal = pageRequest.getSortVal();
        if (StrUtil.isNotEmpty(sortType) && StrUtil.isNotEmpty(sortVal)) {
            switch (sortType) {
                case "cateId": {
                    where.eq("NEWS_CATE_ID", Convert.toLong(sortVal));
                    break;
                }
                case "status": {
                    where.eq("NEWS_STATUS", Convert.toInt(sortVal));
                    break;
                }
                case "vouch": {
                    where.eq("NEWS_VOUCH", 1);
                    break;
                }
                case "top": {
                    where.eq("NEWS_ORDER", 0);
                    break;
                }
                case "sort": {
                    where.fmtOrderBySort(sortVal, "");
                    break;
                }
            }

        }

        // 排序
        where.orderByAsc("NEWS_ORDER");
        where.orderByDesc("NEWS_ID");


        Page page = new Page(pageRequest.getPage(), pageRequest.getSize());
        return newsMapper.getPageList(page, where, "*");
    }

    /** 删除资讯 */
    public void delNews(long id) {
        NewsModel news = newsMapper.getOne(id);
        if (ObjectUtil.isNull(news)) this.appError("记录不存在");

        newsMapper.delete(id);
    }


    /** 获取单个资讯 */
    public Map<String, Object> getNewsDetail(long id) {
        return newsMapper.getOneMap(id);
    }

    /**
     * 修改资讯状态
     */
    public void statusNews(long id, int status) {
        UpdateWhere<NewsModel> uw = new UpdateWhere<>();
        uw.eq("NEWS_ID", id);

        uw.set("NEWS_STATUS", status);
        newsMapper.edit(uw);
    }

    /** 资讯排序设定 */
    public void orderNews(long id, int order) {
        UpdateWhere<NewsModel> uw = new UpdateWhere<>();
        uw.eq("NEWS_ID", id);

        uw.set("NEWS_ORDER", order);
        newsMapper.edit(uw);
    }


    /** 资讯首页设定 */
    public void vouchNews(long id, int vouch) {
        UpdateWhere<NewsModel> uw = new UpdateWhere<>();
        uw.eq("NEWS_ID", id);

        uw.set("NEWS_VOUCH", vouch);
        newsMapper.edit(uw);
    }




}
