package com.xzit.ar.portal.service.information.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.CommentMapper;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Comment;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.information.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/15 21:33.
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private InformationMapper informationMapper;

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

    /**
     * TODO 存储评论
     *
     * @param comment
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer saveComment(Comment comment) throws ServiceException {
        try {
            Integer infoId = comment.getInfoId();
            if (CommonUtil.isNotEmpty(infoId) && CommonUtil.isNotEmpty(comment.getUserId())){
                // 增加评论数
                informationMapper.increaseComments(infoId);
                // 存储评论
                return commentMapper.save(comment);
            }
        } catch (Exception e) {
            throw new ServiceException("发表评论时发生异常");
        }
        return null;
    }

    /**
     * TODO 动态加载动态消息的评论
     * @param infoId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> dynamicLoadComment(Page<Map<String, Object> > page, Integer infoId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(infoId)){
                return commentMapper.dynamicLoadComment(page, infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("");
        }
        return null;
    }
}
