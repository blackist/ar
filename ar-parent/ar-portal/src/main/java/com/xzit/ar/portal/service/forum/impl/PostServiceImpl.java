package com.xzit.ar.portal.service.forum.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.forum.PostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 * Created by 董亮亮 on 2017/4/9.
 */
@Service("postService")
public class PostServiceImpl implements PostService {

    @Resource
    private InformationMapper informationMapper;

    /**
     * TODO 根据info_id查询帖子详情
     *
     * @param postId
     * @return post
     * @throws ServiceException
     */
    @Override
    public Map<String, Object> getPostById(Integer postId) throws ServiceException {
        Map<String, Object> post = null;
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(postId)){
                // 累计浏览量
                informationMapper.increaseViews(postId);
                // 加载帖子详情
                post = informationMapper.getInfoDetailById(postId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载信息详情时发生异常！");
        }
        return post;
    }

    /**
     * TODO 查询论坛帖子列表
     * @param page     分页类
     * @param queryStr 查询条件
     * @return 帖子list
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> queryPosts(Page<Map<String, Object>> page, String queryStr) throws ServiceException {
        List<Map<String, Object>> posts = null;
//        try {
            // 校验参数
              if (CommonUtil.isEmpty(queryStr)){
                  queryStr = "";
              }
            queryStr = "%" + queryStr + "%";
            // 根据条件查询帖子
            posts = informationMapper.queryInfos(page, queryStr,"BBS", "%%", "A");
//        } catch (Exception e) {
//            throw new ServiceException("加载论坛帖子时发生异常！");
//        }
        return posts;
    }
}
