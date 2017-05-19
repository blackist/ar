package com.xzit.ar.portal.service.forum.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.CommentMapper;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Comment;
import com.xzit.ar.common.po.info.Information;
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

    @Resource
    private CommentMapper commentMapper;

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
            if (CommonUtil.isNotEmpty(postId)) {
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
     * TODO 喜欢帖子
     *
     * @param postId 帖子id
     * @return 喜欢此帖子的人数
     * @throws ServiceException
     */
    @Override
    public Integer lovePost(Integer postId) throws ServiceException {
        int loves = 0;
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(postId)) {
                // 点赞
                if (informationMapper.increaseLoves(postId) > 0) {
                    loves = 1;
                    // 查询点赞数
                    loves = informationMapper.getLoves(postId);
                }
            }
        } catch (Exception e) {
            throw new ServiceException("给文章点赞时发生异常!");
        }
        return loves;
    }

    /**
     * TODO 存储评论内容
     *
     * @param comment
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer commentPost(Comment comment) throws ServiceException {
        try {
            // 参数校验
            if (comment != null && CommonUtil.isNotEmpty(comment.getUserId()) && CommonUtil.isNotEmpty(comment.getInfoId())) {
                // 存储评论内容
                commentMapper.save(comment);
                // 累计评论
                informationMapper.increaseComments(comment.getInfoId());
            }
        } catch (Exception e) {
            throw new ServiceException("评论时发生异常！");
        }
        return null;
    }

    /**
     * TODO 动态加载评论列表
     *
     * @param page
     * @param postId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> dynamicLoadComment(Page<Map<String, Object>> page, Integer postId) throws ServiceException {
        List<Map<String, Object>> comments = null;
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(postId)) {
                // 加载评论
                comments = commentMapper.dynamicLoadComment(page, postId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载评论时发生异常！");
        }
        return comments;
    }

    /**
     * TODO 查询论坛帖子列表
     *
     * @param page     分页类
     * @param queryStr 查询条件
     * @return 帖子list
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> queryPosts(Page<Map<String, Object>> page, String queryStr) throws ServiceException {
        try {
            // 校验参数
            if (CommonUtil.isEmpty(queryStr)) {
                queryStr = "";
            }
            queryStr = "%" + queryStr + "%";
            // 根据条件查询帖子
            return informationMapper.queryInfos(page, queryStr, "BBS", "%%", "A");
        } catch (Exception e) {
            throw new ServiceException("加载论坛帖子时发生异常！");
        }
    }

    /**
     * TODO 保存帖子信息
     *
     * @param information
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer savePost(Information information) throws ServiceException {
        int row = 0;
        try {
            if (information != null && CommonUtil.isNotEmpty(information.getUserId())) {
                row = informationMapper.save(information);
            }
        } catch (Exception e) {
            throw new ServiceException("发布新帖时发生异常");
        }
        return row;
    }

    /**
     * TODO 删除用户的帖子
     *
     * @param postId
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer deletePost(Integer postId, Integer userId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(postId) && CommonUtil.isNotEmpty(userId)) {
                // 检验帖子是否存在
                if (informationMapper.getInfoByUserIdAndInfoId(postId, userId) != null) {
                    // 删除帖子相关评论
                    commentMapper.deleteCommentByInfoId(postId);
                    // 删除帖子
                    return informationMapper.delete(postId);
                }
            }
        } catch (Exception e) {
            throw new ServiceException("删除帖子时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 加载用户相关帖子
     *
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getUserPost(Page<Map<String, Object>> page, Integer userId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(userId)) {
                return informationMapper.getInfoByUserIdAndInfoType(page, userId, "BBS");
            }
        } catch (Exception e) {
            throw new ServiceException("查询用户相关帖子时发生异常！");
        }
        return null;
    }
}
