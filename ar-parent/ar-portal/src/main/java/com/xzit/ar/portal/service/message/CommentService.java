package com.xzit.ar.portal.service.message;

import com.xzit.ar.common.exception.ServiceException;

/**
 * TODO ${TODO}
 *
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
}
