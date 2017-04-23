package com.xzit.ar.portal.service.information.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.CommentMapper;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.mapper.origin.OriginMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.information.InformationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 * Created by 董亮亮 on 2017/4/7.
 */
@Service("informationService")
public class InformationServiceImpl implements InformationService {

    @Resource
    private InformationMapper informationMapper;

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private OriginMapper originMapper;


    
    /**
     * TODO 记载组织最近消息
     * @param page     分页类
     * @param originId 组织id
     * @return 消息列表
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getOriginInfos(Page<Map<String, Object>> page, Integer originId)
            throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(originId)){
                // 查询
                return originMapper.getOriginInfos(page, originId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载最近消息时失败！");
        }
        return null;
    }

    /**
     * TODO 加载组织内某一成员的动态消息
     * @param page
     * @param originId
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getOriginUserInfos(Page<Map<String, Object>> page, Integer userId, Integer originId,
                                                        String originType) throws ServiceException {
        try {
            // 参数校验
            if(CommonUtil.isNotEmpty(userId) && CommonUtil.isNotEmpty(originId) && CommonUtil.isNotEmpty(originType)){
                // 查询消息
                return informationMapper.loadOriginUserInfos(page, userId, originId, originType);
            }
        } catch (Exception e) {
            throw new ServiceException("加载消息时发生异常");
        }
        return null;
    }

    /**
     * TODO 通过 消息id 和 组织id 获取消息详情
     *
     * @param infoId
     * @param originId
     * @return
     * @throws ServiceException
     */
    @Override
    public Map<String, Object> getInfoByInfoIdAndOriginId(Integer infoId, Integer originId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(infoId) && CommonUtil.isNotEmpty(originId)){
                // 增加浏览量
                informationMapper.increaseViews(infoId);
                return informationMapper.getInfoByInfoIdAndOriginId(infoId, originId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载消息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 根据information id 加载信息
     * @param infoId
     * @return
     * @throws ServiceException
     */
    @Override
    public Information getInfoById(Integer infoId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(infoId)){
                // 浏览量
                informationMapper.increaseComments(infoId);
                // 插叙怒消息
                return informationMapper.getById(infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 为消息点赞
     * @param infoId 消息id
     * @return 返回点赞的总数
     * @throws ServiceException
     */
    @Override
    public Integer loveInfo(Integer infoId) throws ServiceException {
        try {
            // 校验参数
            if (CommonUtil.isNotEmpty(infoId)){
                // 点赞存储
                informationMapper.increaseLoves(infoId);
                // 查询消息点赞总数
                return  informationMapper.getLoves(infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("发生异常！");
        }
        return null;
    }

    /**
     * TODO 删除消息
     * @param infoId
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer deleteInfo(Integer infoId, Integer userId) throws ServiceException {
        try {
            // 参数校验
            if(CommonUtil.isNotEmpty(infoId) && CommonUtil.isNotEmpty(userId)) {
                // 检验帖子是否存在
                if (informationMapper.getInfoByUserIdAndInfoId(infoId, userId) != null) {
                    // 删除帖子相关评论
                    commentMapper.deleteCommentByInfoId(infoId);
                    // 删除帖子
                    return informationMapper.delete(infoId);
                }
            }
            if (CommonUtil.isNotEmpty(infoId)){
                return informationMapper.delete(infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("删除消息时发生异常！");
        }
        return 0;
    }
}
