package com.xzit.ar.portal.service.information;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.info.Comment;

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
}
