package com.xzit.ar.portal.service.forum;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Comment;
import com.xzit.ar.common.po.info.Information;

import java.util.List;
import java.util.Map;

/**
 * 描述
 * Created by 董亮亮 on 2017/4/9.
 */
public interface PostService {

    /**
     * 查询论坛帖子列表
     *
     * @param page     分页类
     * @param queryStr 查询条件
     * @return 帖子list
     */
    List<Map<String, Object>> queryPosts(Page<Map<String, Object>> page, String queryStr);

    /**
     * 根据info_id查询帖子详情
     *
     * @param postId
     * @return post
     */
    Map<String, Object> getPostById(Integer postId) throws ServiceException;

    /**
     * 动态加载评论列表
     *
     * @param page
     * @param postId
     * @return
     */
    List<Map<String, Object>> dynamicLoadComment(Page<Map<String, Object>> page, Integer postId) throws ServiceException;

    /**
     * 存储评论内容
     *
     * @param comment
     * @return
     */
    Integer commentPost(Comment comment) throws ServiceException;

    /**
     * 喜欢帖子
     *
     * @param postId 帖子id
     * @return 喜欢此帖子的人数
     */
    Integer lovePost(Integer postId) throws ServiceException;

    /**
     * 保存帖子信息
     *
     * @param information
     * @return
     */
    Integer savePost(Information information) throws ServiceException;

    /**
     * 删除用户的帖子
     *
     * @param postId
     * @param userId
     * @return
     */
    Integer deletePost(Integer postId, Integer userId) throws ServiceException;

    /**
     * 加载用户相关帖子
     *
     * @param userId
     * @return
     */
    List<Map<String, Object>> getUserPost(Page<Map<String, Object>> page, Integer userId) throws ServiceException;
}
