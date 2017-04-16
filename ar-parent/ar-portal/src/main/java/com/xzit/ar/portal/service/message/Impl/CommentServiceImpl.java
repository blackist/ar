package com.xzit.ar.portal.service.message.Impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.CommentMapper;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.message.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * TODO ${TODO}
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/15 21:33.
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentMapper commentMapper;

    /**
     * TODO 删除用户自己的评论
     * @param commentId
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer deleteComment(Integer commentId, Integer userId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(commentId) && CommonUtil.isNotEmpty(userId)){
                return commentMapper.deleteCommentByUserIdAndInfoId(commentId, userId);
            }
        } catch (Exception e) {
            throw new ServiceException("删除评论时发生异常！");
        }
        return null;
    }
}
