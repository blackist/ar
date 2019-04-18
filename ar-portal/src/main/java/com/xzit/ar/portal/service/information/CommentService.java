package com.xzit.ar.portal.service.information;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Comment;

import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/15 21:30.
 */
public interface CommentService {

    /**
     * TODO 删除用户自己的评论
     * @param commentId
     * @param userId
     * @return
     * @throws ServiceException
     */
    Integer deleteComment(Integer commentId, Integer userId) throws ServiceException;

    /**
     * TODO 存储评论
     * @param comment
     * @return
     * @throws ServiceException
     */
    Integer saveComment(Comment comment) throws ServiceException;

    /**
     * TODO 动态加载动态消息的评论
     * @param infoId
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> dynamicLoadComment(Page<Map<String, Object> > page, Integer infoId) throws ServiceException;
}
