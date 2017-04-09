package com.xzit.ar.portal.service.forum;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;

import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 * Created by 董亮亮 on 2017/4/9.
 */
public interface PostService {

    /**
     * TODO 查询论坛帖子列表
     * @param page 分页类
     * @param queryStr 查询条件
     * @return 帖子list
     * @throws ServiceException
     */
    public List<Map<String, Object>> queryPosts(Page<Map<String, Object>> page, String queryStr) throws ServiceException;
}